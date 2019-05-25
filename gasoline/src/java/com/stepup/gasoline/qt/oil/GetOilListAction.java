/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oil;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetOilListAction extends BaseAction {
    
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList list = goodDAO.getOils(NumberUtil.parseInt(request.getParameter("status"), 0), QTUtil.getOrganizationManageds(request.getSession()));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    OilFormBean bean = (OilFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getOil(").append(bean.getId()).append(",\"loadOilList\")^_self</cell>");
                    buff.append("<cell>").append(bean.getName()).append("</cell>");
                    buff.append("<cell>").append(bean.getBaseUnitName()).append("</cell>");
                    buff.append("<cell>").append(bean.getSaleUnitName()).append("</cell>");
                    buff.append("</row>");
                }
            }
        } catch (Exception ex) {
        }
        buff.append("</rows>");
        
        OutputUtil.sendXmlStringToOutput(response, buff.toString());
        return true;
    }
    
    @Override
    protected boolean isReturnStream() {
        return true;
    }
    
    @Override
    protected String getActionName() {
        return this.getClass().getName();
    }
}