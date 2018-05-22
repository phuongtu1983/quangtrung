/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.core;

import com.stepup.core.util.CheckLogonTag;
import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.auth.OnlineUserPermission;
import com.stepup.gasoline.qt.bean.ParameterBean;
import com.stepup.gasoline.qt.dao.ParameterDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class SpineAction extends org.apache.struts.action.Action {

    protected String actionForwardResult;
    protected String strErrors;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        actionForwardResult = Constants.FORWARD_ACT_SUCCESS;
        HttpSession session = request.getSession();
        if (checkLogin(mapping, form, request)) {
            if (isValidUrl(request)) {
                OnlineUserPermission up = new OnlineUserPermission();
                up.setUserId(QTUtil.getMemberID(session));
                up.setFunction(this.getFunction());
                up.setPermission(this.getPermit());
                if (up.getPermission() != 0 && GenericValidator.isBlankOrNull(up.getFunction())) {
                    session.setAttribute(Constants.PERMISSION_USER, up);
                }
                if (checkPermission(mapping, form, request)) {
                    if (isPreventAccess()) {
                        return mapping.findForward("pauseSystem");
                    } else {
                        String actionName = getActionName();
                        if (actionName.equals("")) {
                            return doActionProgress(mapping, form, request, response, session, actionName);
                        } else {
                            Object o = session.getAttribute(actionName);
                            if (o == null) {
                                session.setAttribute(actionName, actionName);
                                return doActionProgress(mapping, form, request, response, session, actionName);
                            } else {
                                return doActionResult(true, mapping, request, response);
                            }
                        }
                    }
                } else {
                    ActionMessages errors = new ActionMessages();
                    errors.add("permissioninvalid", new ActionMessage("errors.permissionInvalid"));
                    saveErrors(request, errors);
                    actionForwardResult = Constants.ERROR_FORWARD;
                }
            } else {
                String message = getXmlMessage();
                if (!GenericValidator.isBlankOrNull(message)) {
                    ActionForward af = mapping.findForward(Constants.JSON_FORWARD);
                    String path = af.getPath();
                    String params = getXmlParameters(mapping, form, request, response);
                    path += "?mapMessage=" + message + "&params=" + params;
                    return new ActionForward(path);
                } else {
                    ActionMessages errors = new ActionMessages();
                    errors.add("urlnotvalid", new ActionMessage("errors.urlNotValid"));
                    saveErrors(request, errors);
                    return mapping.findForward(Constants.ERROR_FORWARD);
                }
            }
        } else {
            String message = getXmlMessage();
            if (!GenericValidator.isBlankOrNull(message)) {
                ActionForward af = mapping.findForward(Constants.JSON_FORWARD);
                String path = af.getPath();
                String params = getXmlParameters(mapping, form, request, response);
                path += "?mapMessage=" + message + "&params=" + params;
                request.getSession().setAttribute("preLoginPage", path);
            }
            OutputUtil.sendStringToOutput(response, "login");
            return null;
        }
        session.removeAttribute(Constants.PERMISSION_USER);
        return mapping.findForward(actionForwardResult);
    }

    protected boolean checkLogin(ActionMapping mapping, ActionForm form, HttpServletRequest request) {
        HttpSession session = request.getSession();
        ActionMessages errors = new ActionMessages();
        if (!CheckLogonTag.isValidSession(session, Constants.EMPLOYEE_OBJ)) {
            errors.add("userLogin", new ActionMessage("errors.user.userInvalid"));
            saveErrors(request, errors);
            String query = "/" + request.getRequestURI();
            session.setAttribute("preLoginPage", query);
            actionForwardResult = Constants.GLOBAL_FORWARD_LOGIN;
            return false;
        }
        return true;
    }

    protected boolean checkPermission(ActionMapping mapping, ActionForm form, HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        OnlineUserPermission up = null;
//        if ((session != null) && (session.getAttribute(Constants.PERMISSION_USER) != null)) {
//            up = (OnlineUserPermission) session.getAttribute(Constants.PERMISSION_USER);
//            return PermissionUtil.hasPermission(request, up.getFunction(), up.getPermission());
//        }
        return true;
    }

    protected boolean doAction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        return true;
    }

    protected boolean isAjax() {
        return false;
    }

    protected boolean isReturnStream() {
        return false;
    }

    protected boolean isValidUrl(HttpServletRequest request) {
        if (!GenericValidator.isBlankOrNull(request.getParameter("session"))) {
            if (request.getSession().getId().equals(request.getParameter("session"))) {
                return true;
            }
        }
        return false;
    }

    protected String getXmlMessage() {
        return "";
    }

    protected String getXmlParameters(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
        return "";
    }

    protected String getErrorsString(HttpServletRequest request) {
        String errorsString = "";
        ActionMessages messages = getErrors(request);
        Iterator<ActionMessage> lstMessage = messages.get();
        ActionMessage message = null;
        while (lstMessage.hasNext()) {
            message = lstMessage.next();
            errorsString += QTUtil.getBundleString(message.getKey());
        }
        return errorsString + " " + strErrors;
    }

    protected ActionForward doActionResult(boolean result, ActionMapping mapping, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (!result) {
                ActionForward input = mapping.getInputForward();
                if (input != null && !GenericValidator.isBlankOrNull(input.getName())) {
                    return input;
                } else {
                    String error = "error:" + getErrorsString(request);
                    OutputUtil.sendStringToOutput(response, error);
                }
            } else {
                if (!isReturnStream()) {
                    ActionForward af = null;
                    String forwardAction = "";
                    if (!this.actionForwardResult.equals(Constants.FORWARD_ACT_SUCCESS)) {
                        forwardAction = this.actionForwardResult;
                    } else {
                        forwardAction = Constants.FORWARD_ACT_SUCCESS;
                    }
                    af = mapping.findForward(forwardAction);
                    if (af != null) {
                        return af;
                    } else {
                        OutputUtil.sendStringToOutput(response, forwardAction);
                    }
                } else {
                    customizedReturnAction(request, response);
                }
            }
        } catch (Exception ex) {
        }
        return null;
    }

    protected String getFunction() {
        return "";
    }

    protected int getPermit() {
        return 0;
    }

    protected void customizedReturnAction(HttpServletRequest request, HttpServletResponse response) {
    }

    protected boolean isPreventAccess() {
        boolean result = false;
        try {
            ParameterDAO paramDAO = new ParameterDAO();
            String name = "prevent_access";
            ParameterBean bean = paramDAO.getParameter(name);
            if (bean != null) {
                if (bean.getValue().equals("on")) {
                    result = true;
                }
            }
        } catch (Exception ex) {
        }
        return result;
    }

    protected String getActionName() {
        return "";
    }

    private ActionForward doActionProgress(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response, HttpSession session, String actionName) {
        try {
            boolean result = doAction(mapping, form, request, response);
            session.removeAttribute(Constants.PERMISSION_USER);
            if (!actionName.equals("")) {
                session.removeAttribute(actionName);
            }
            return doActionResult(result, mapping, request, response);
        } catch (Exception ex) {
        }
        return null;
    }
}
