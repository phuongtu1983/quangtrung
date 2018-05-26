/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dynamicfield;

import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetDynamicFieldListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
            ArrayList list = dynamicFieldDAO.getDynamicFields(request.getParameter("tableName"));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    DynamicFieldFormBean bean = (DynamicFieldFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getName()).append("^javascript:getDynamicField(").append(bean.getId()).append(",\"loadDynamicFieldList\")^_self</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getCode())).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getOrganizationName())).append("</cell>");
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
