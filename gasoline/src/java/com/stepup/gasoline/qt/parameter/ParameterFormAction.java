/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.parameter;

import com.stepup.gasoline.qt.bean.ParameterBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ParameterDAO;
import com.stepup.gasoline.qt.util.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class ParameterFormAction extends SpineAction {

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
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String parameter = request.getParameter("parameterName");
        ParameterBean bean = null;
        ParameterFormBean nameBean = null;
        ParameterDAO parameterDAO = new ParameterDAO();
        try {
            bean = parameterDAO.getParameter(parameter);
        } catch (Exception ex) {
        }
        if (bean == null) {
            nameBean = new ParameterFormBean();
        } else {
            nameBean = new ParameterFormBean(bean);
        }
        request.setAttribute(Constants.PARAMETER, nameBean);
        return true;
    }
}
