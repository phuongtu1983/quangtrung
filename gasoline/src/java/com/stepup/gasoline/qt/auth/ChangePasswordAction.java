/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.auth;

import com.stepup.core.sercurity.Encoder;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author Admin
 */
public class ChangePasswordAction extends SpineAction {

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
        PasswordFormBean memberForm = (PasswordFormBean) form;

        String username = QTUtil.getMemberName(request.getSession());
        String password = Encoder.getMD5_Base64(memberForm.getPassword());
        String newpassword = Encoder.getMD5_Base64(memberForm.getNewpassword());
        UserDAO memberDAO = new UserDAO();
        try {
            int ret = memberDAO.changePassword(username, password, newpassword);
            if (ret == 0) {
                ActionMessages errors = new ActionMessages();
                errors.add("employeeExisted", new ActionMessage("errors.changePassword.fail"));
                saveErrors(request, errors);
                return false;
            }
        } catch (Exception ex) {
        }
        return true;
    }
}
