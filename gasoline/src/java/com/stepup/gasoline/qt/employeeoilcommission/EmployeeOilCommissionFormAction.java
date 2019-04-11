/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoilcommission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeOilCommissionBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class EmployeeOilCommissionFormAction extends SpineAction {

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
        EmployeeOilCommissionBean bean = null;
        String employeeOilCommissionid = request.getParameter("employeeOilCommissionId");
        if (!GenericValidator.isBlankOrNull(employeeOilCommissionid)) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            try {
                bean = employeeDAO.getEmployeeOilCommission(NumberUtil.parseInt(employeeOilCommissionid, 0));
            } catch (Exception ex) {
            }
        }
        EmployeeOilCommissionFormBean formBean = null;
        if (bean == null) {
            formBean = new EmployeeOilCommissionFormBean();
        } else {
            formBean = new EmployeeOilCommissionFormBean(bean);
        }
        request.setAttribute(Constants.EMPLOYEE_OIL_COMMISSION, formBean);

        return true;
    }
}
