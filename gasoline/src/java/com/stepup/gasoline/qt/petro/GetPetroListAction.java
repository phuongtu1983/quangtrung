/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.petro;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetPetroListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList list = goodDAO.getPetros(NumberUtil.parseInt(request.getParameter("status"), 0));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    PetroFormBean bean = (PetroFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getName()).append("^javascript:getPetro(").append(bean.getId()).append(",\"loadPetroList\")^_self</cell>");
                    buff.append("<cell>").append(bean.getCode()).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getPrice(), "VND")).append("</cell>");
                    buff.append("<cell>").append(bean.getUnitName()).append("</cell>");
                    buff.append("<cell>").append(bean.getOrganizationName()).append("</cell>");
                    buff.append("<cell>").append(bean.getStatusName()).append("</cell>");
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