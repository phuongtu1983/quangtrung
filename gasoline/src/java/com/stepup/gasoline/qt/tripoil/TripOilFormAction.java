/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.tripoil;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.TripOilBean;
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
public class TripOilFormAction extends SpineAction {

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
        TripOilBean bean = null;
        String tripOilId = request.getParameter("tripOilId");
        VehicleDAO vehicleDAO = new VehicleDAO();
        if (!GenericValidator.isBlankOrNull(tripOilId)) {
            try {
                bean = vehicleDAO.getTripOil(NumberUtil.parseInt(tripOilId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new TripOilBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-TO-";
                String number = vehicleDAO.getNextTripOilNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.TRIP_OIL, bean);

        ArrayList arrVehicle = null;
        try {
            arrVehicle = vehicleDAO.getVehicles();
        } catch (Exception ex) {
        }
        if (arrVehicle == null) {
            arrVehicle = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_LIST, arrVehicle);

        ArrayList arrEmployee = null;

        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }

        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }

        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);

        return true;
    }
}
