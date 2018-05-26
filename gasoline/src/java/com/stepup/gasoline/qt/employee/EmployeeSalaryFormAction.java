/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class EmployeeSalaryFormAction extends SpineAction {

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
        EmployeeFormBean formBean = null;
        EmployeeSalaryFormBean salaryFormBean = new EmployeeSalaryFormBean();
        String employeeid = request.getParameter("employeeId");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        if (!GenericValidator.isBlankOrNull(employeeid)) {
            try {
                formBean = employeeDAO.getEmployee(Integer.parseInt(employeeid));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new EmployeeFormBean();
        }
        salaryFormBean.setEmployeeId(formBean.getId());
        salaryFormBean.setFullname(formBean.getFullname());
        salaryFormBean.setOrganizationId(formBean.getOrganizationId());
        salaryFormBean.setOrganizationName(formBean.getOrganizationName());
        salaryFormBean.setSalary(formBean.getSalary());
        request.setAttribute(Constants.EMPLOYEE_SALARY, salaryFormBean);

        ArrayList arrField = null;
        try {
            arrField = employeeDAO.getEmployeeSalaryField(formBean.getId(), formBean.getOrganizationId(), DynamicFieldBean.SALARY);
        } catch (Exception ex) {
        }
        if (arrField != null && arrField.size() > 0) {
            request.setAttribute(Constants.DYNAMIC_FIELD_VALUE, arrField);
        }
        return true;
    }
}
