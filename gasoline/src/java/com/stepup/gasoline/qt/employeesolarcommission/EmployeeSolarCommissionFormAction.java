/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeesolarcommission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionBean;
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
public class EmployeeSolarCommissionFormAction extends SpineAction {

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
        EmployeeSolarCommissionBean bean = null;
        String employeeSolarCommissionid = request.getParameter("employeeSolarCommissionId");
        if (!GenericValidator.isBlankOrNull(employeeSolarCommissionid)) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            try {
                bean = employeeDAO.getEmployeeSolarCommission(NumberUtil.parseInt(employeeSolarCommissionid, 0));
            } catch (Exception ex) {
            }
        }
        EmployeeSolarCommissionFormBean formBean = null;
        if (bean == null) {
            formBean = new EmployeeSolarCommissionFormBean();
        } else {
            formBean = new EmployeeSolarCommissionFormBean(bean);
        }
        request.setAttribute(Constants.EMPLOYEE_SOLAR_COMMISSION, formBean);

        return true;
    }
}
