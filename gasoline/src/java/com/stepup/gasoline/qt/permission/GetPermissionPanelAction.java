/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.util.Constants;
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
public class GetPermissionPanelAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ArrayList userList = null;
        UserDAO userDAO = new UserDAO();
        try {
            userList = userDAO.getUsers(0);
        } catch (Exception ex) {
        }
        if (userList == null) {
            userList = new ArrayList();
        }
        request.setAttribute(Constants.SELECTED, QTUtil.getMemberID(request.getSession()));
        request.setAttribute(Constants.USER_LIST, userList);
        return true;
    }
}
