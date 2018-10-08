/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehiclein;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VehicleInBean;
import com.stepup.gasoline.qt.core.SpineAction;
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
public class VehicleInFormAction extends SpineAction {

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
        VehicleInBean bean = null;
        String id = request.getParameter("vehicleInId");
        ArrayList arrDetail = null;
        ArrayList arrReturnShelDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getVehicleIn(gasImportId);
                arrDetail = gasDAO.getVehicleInDetail(gasImportId);
                arrReturnShelDetail = gasDAO.getVehicleInReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        VehicleInFormBean formBean = null;
        if (bean != null) {
            formBean = new VehicleInFormBean(bean);
        } else {
            formBean = new VehicleInFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-VI-";
                    String number = gasDAO.getNextVehicleInNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.VEHICLE_IN, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_IN_SHELL, arrDetail);

        if (arrReturnShelDetail == null) {
            arrReturnShelDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_IN_RETURN, arrReturnShelDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            arrShell = goodDAO.getShellVendor(vendorIds);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        ArrayList arrShellReturn = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShellReturn = goodDAO.getShells(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShellReturn == null) {
            arrShellReturn = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_RETURN_LIST, arrShellReturn);

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

        return true;
    }
}
