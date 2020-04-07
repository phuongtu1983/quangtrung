/*
 * LoginAction.java
 *
 * Created on December 8, 2006, 11:43 AM
 */
package com.stepup.gasoline.qt.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.dao.BasicDAO;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.permission.ApplicationPermissionBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 * @version
 */
public class LoginAction extends Action {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        LoginForm loginForm = (LoginForm) form;
        String username = loginForm.getUsername();
        String md5pw = loginForm.getMd5pw();
        EmployeeDAO employeeDAO = new EmployeeDAO();
        OnlineUserImpl user = null;
        try {
            user = (OnlineUserImpl) employeeDAO.login(username, md5pw);
        } catch (Exception ex) {
            LogUtil.error(ex.getMessage());
        }
        if (user == null) {
            ActionMessages errors = new ActionMessages();
            errors.add("passwordnotmatch", new ActionMessage("errors.loginform.passwordnotmatch"));
            saveErrors(request, errors);
            return mapping.getInputForward();
        } else {
            String loginedIpAddress = QTUtil.getMemberIPAdress(session);
            if (!request.getRemoteHost().equals(loginedIpAddress) && !StringUtil.isBlankOrNull(loginedIpAddress)) {
                ActionMessages errors = new ActionMessages();
                errors.add("userlogined", new ActionMessage("errors.loginform.logined"));
                saveErrors(request, errors);
                return mapping.getInputForward();
            }
            user.setIpAddress(request.getRemoteHost());
            session.setAttribute(Constants.EMPLOYEE_OBJ, user);
            session.setAttribute(Constants.SESSION_ID, session.getId());
            String preLoginPage = (String) session.getAttribute("preLoginPage");
            if (preLoginPage != null) {
                session.removeAttribute("preLoginPage");
                if (preLoginPage.split("params=").length > 1) {//Loc: neu tham so = null thi bo qua
                    response.sendRedirect(request.getContextPath() + preLoginPage);
                    return null;
                }
            }
            getPermission(session);
            getStartDate();
            return mapping.findForward(Constants.FORWARD_ACT_SUCCESS);
        }
    }

    private void getPermission(HttpSession session) {
        try {
            PermissionDAO permissionDAO = new PermissionDAO();
            ArrayList<ApplicationPermissionBean> arrPer = permissionDAO.getPermissionsOfEmployee(QTUtil.getMemberID(session));
            session.setAttribute(Constants.PERMISSION_USER_LIST, arrPer);
            String organizations = permissionDAO.getOrganizationManagedOfEmployee(QTUtil.getMemberID(session));
            session.setAttribute(Constants.PERMISSION_ORGANIZATION_MANAGED, organizations);
        } catch (Exception ex) {
        }
    }

    private void getStartDate() {
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            BasicDAO.START_DATE = employeeDAO.getStartDate();
        } catch (Exception ex) {
            LogUtil.error(ex.getMessage());
        }
    }

}
