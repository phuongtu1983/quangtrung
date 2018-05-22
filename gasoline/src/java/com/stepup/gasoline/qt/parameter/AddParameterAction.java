/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.parameter;

import com.stepup.gasoline.qt.bean.ParameterBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ParameterDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddParameterAction extends SpineAction {

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
        ParameterFormBean formBean = (ParameterFormBean) form;
        ParameterDAO parameterDAO = new ParameterDAO();
        ParameterBean bean = null;
        try {
            bean = parameterDAO.getParameter(formBean.getId());
            boolean isUpdate = false;
            if (!formBean.getValue().equals(bean.getValue())) {
                isUpdate = true;
            }
            if (isUpdate) {
                parameterDAO.updateParameter(formBean.getId(), formBean.getValue());
            }
        } catch (Exception ex) {
        }
        return true;
    }
}
