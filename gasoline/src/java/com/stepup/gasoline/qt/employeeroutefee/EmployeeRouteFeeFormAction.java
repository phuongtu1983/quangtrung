/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeroutefee;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.EmployeeRouteFeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
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
public class EmployeeRouteFeeFormAction extends SpineAction {

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
        EmployeeRouteFeeBean bean = null;
        String employeeRouteFeeId = request.getParameter("employeeRouteFeeId");
        VehicleDAO vehicleDAO = new VehicleDAO();
        if (!GenericValidator.isBlankOrNull(employeeRouteFeeId)) {
            try {
                bean = vehicleDAO.getEmployeeRouteFee(NumberUtil.parseInt(employeeRouteFeeId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new EmployeeRouteFeeBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-ER-";
                String number = vehicleDAO.getNextEmployeeRouteFeeNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.EMPLOYEE_ROUTE_FEE, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrEmployee = null;
        ArrayList arrRoute = null;
        ArrayList arrVehicle = null;

        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
        } catch (Exception ex) {
        }
        try {
            arrRoute = vehicleDAO.getRoutes();
        } catch (Exception ex) {
        }
        try {
            arrVehicle = vehicleDAO.getVehicles();
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        if (arrRoute == null) {
            arrRoute = new ArrayList();
        }
        if (arrVehicle == null) {
            arrVehicle = new ArrayList();
        }

        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);
        request.setAttribute(Constants.ROUTE_LIST, arrRoute);
        request.setAttribute(Constants.VEHICLE_LIST, arrVehicle);

        return true;
    }
}
