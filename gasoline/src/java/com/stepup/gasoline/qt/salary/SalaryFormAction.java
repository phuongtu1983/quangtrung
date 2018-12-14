/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salary;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
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
public class SalaryFormAction extends SpineAction {

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
        SalaryFormBean formBean = null;
        String salaryId = request.getParameter("salaryId");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        if (!GenericValidator.isBlankOrNull(salaryId)) {
            try {
                formBean = employeeDAO.getSalary(NumberUtil.parseInt(salaryId, 0));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new SalaryFormBean();
        }

        request.setAttribute(Constants.SALARY, formBean);

        ArrayList arrTimesheetDetail = null;
        try {
            arrTimesheetDetail = employeeDAO.getEmployeeSalaryTimesheetDetail(formBean.getId());
        } catch (Exception ex) {
        }
        if (arrTimesheetDetail == null) {
            arrTimesheetDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALARY_TIMESHEET_LIST, arrTimesheetDetail);

        ArrayList arrFieldDetail = null;
        try {
            arrFieldDetail = employeeDAO.getEmployeeSalaryFieldDetail(formBean.getId());
        } catch (Exception ex) {
        }
        if (arrFieldDetail == null) {
            arrFieldDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALARY_FIELD_LIST, arrFieldDetail);

        ArrayList arrTimesheetField = null;
        try {
            DynamicFieldDAO fieldDAO = new DynamicFieldDAO();
            arrTimesheetField = fieldDAO.getDynamicFieldValues(0, DynamicFieldBean.SALARY, formBean.getOrganizationId());
        } catch (Exception ex) {
        }
        if (arrTimesheetField == null) {
            arrTimesheetField = new ArrayList();
        }
        request.setAttribute(Constants.DYNAMIC_FIELD_LIST, arrTimesheetField);

        return true;
    }

}
