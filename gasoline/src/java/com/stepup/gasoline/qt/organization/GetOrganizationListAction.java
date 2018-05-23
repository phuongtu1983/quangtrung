/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetOrganizationListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            ArrayList list = organizationDAO.getOrganizations(NumberUtil.parseInt(request.getParameter("status"), 0));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    OrganizationBean bean = (OrganizationBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getOrganization(").append(bean.getId()).append(",\"loadOrganizationList\")^_self</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getName())).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getAddress())).append("</cell>");
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
