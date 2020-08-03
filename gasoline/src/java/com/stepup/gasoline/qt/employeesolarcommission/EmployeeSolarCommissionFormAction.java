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
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        int employeeSolarCommissionId = NumberUtil.parseInt(request.getParameter("employeeSolarCommissionId"), 0);
        ArrayList arrFeeDetail = null;
        if (employeeSolarCommissionId != 0) {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            try {
                bean = employeeDAO.getEmployeeSolarCommission(employeeSolarCommissionId);
                arrFeeDetail = employeeDAO.getEmployeeSolarCommissionDetail(employeeSolarCommissionId);
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new EmployeeSolarCommissionBean();
        }
        request.setAttribute(Constants.EMPLOYEE_SOLAR_COMMISSION, bean);

        if (arrFeeDetail == null) {
            arrFeeDetail = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_SOLAR_COMMISSION_COMMISSION, arrFeeDetail);

        return true;
    }
}
