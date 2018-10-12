/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicleout;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VehicleOutBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
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
public class VehicleOutFormAction extends SpineAction {

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
        VehicleOutBean bean = null;
        String id = request.getParameter("vehicleOutId");
        ArrayList arrDetail = null;
        ArrayList arrEmployeeDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getVehicleOut(gasImportId);
                arrDetail = gasDAO.getVehicleOutDetail(gasImportId);
                arrEmployeeDetail = gasDAO.getVehicleOutEmployeeDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        VehicleOutFormBean formBean = null;
        if (bean != null) {
            formBean = new VehicleOutFormBean(bean);
        } else {
            formBean = new VehicleOutFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-VO-";
                    String number = gasDAO.getNextVehicleOutNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.VEHICLE_OUT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_OUT_GOOD, arrDetail);

        if (arrEmployeeDetail == null) {
            arrEmployeeDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_OUT_EMPLOYEE, arrEmployeeDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            arrShell = goodDAO.getShellVendor(organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        ArrayList arrVehicle = null;
        try {
            VehicleDAO vehicleDAO = new VehicleDAO();
            arrVehicle = vehicleDAO.getVehicles();
        } catch (Exception ex) {
        }
        if (arrVehicle == null) {
            arrVehicle = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_LIST, arrVehicle);
        
        ArrayList arrEmployee = null;
        try {
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);

        return true;
    }
}
