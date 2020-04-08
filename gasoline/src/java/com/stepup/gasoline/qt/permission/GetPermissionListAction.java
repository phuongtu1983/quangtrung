/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetPermissionListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            PermissionDAO permissionDAO = new PermissionDAO();
            ArrayList logList = null;
            if (!StringUtil.isBlankOrNull(request.getParameter("name"))) {
                logList = permissionDAO.searchPermissions(request.getParameter("name"));
            } else {
                logList = permissionDAO.getPermissions(NumberUtil.parseInt(request.getParameter("user"), 0));
            }
            if (logList == null) {
                logList = new ArrayList();
            }
            if (logList != null) {
                int length = logList.size();
                for (int i = 0; i < length; i++) {
                    PermissionBean bean = (PermissionBean) logList.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getName())).append("^javascript:getPermission(").append(bean.getId()).append(")^_self</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getNote())).append("</cell>");
                    buff.append("<cell>").append(StringUtil.encodeString(bean.getUserNames())).append("</cell>");
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
