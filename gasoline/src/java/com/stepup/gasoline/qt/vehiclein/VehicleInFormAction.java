/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehiclein;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VehicleInBean;
import com.stepup.gasoline.qt.bean.VehicleOutBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vehicleout.VehicleOutFormBean;
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
        ArrayList arrAccessoryDetail = null;
        ArrayList arrOilExportDetail = null;
        ArrayList arrReturnShelDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = NumberUtil.parseInt(id, 0);
                bean = gasDAO.getVehicleIn(gasImportId);
                arrDetail = gasDAO.getVehicleInDetail(gasImportId);
                arrAccessoryDetail = gasDAO.getVehicleInAccessoryDetail(gasImportId);
                arrOilExportDetail = gasDAO.getVehicleInOilExportDetail(gasImportId);
                arrReturnShelDetail = gasDAO.getVehicleInReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        VehicleInFormBean formBean = null;
        if (bean != null) {
            formBean = new VehicleInFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_VEHICLE_IN)) {
                formBean.setCanEdit(1);
            }
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
        
        if (arrAccessoryDetail == null) {
            arrAccessoryDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_IN_ACCESSORY, arrAccessoryDetail);

        if (arrOilExportDetail == null) {
            arrOilExportDetail = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_IN_OIL_EXPORT, arrOilExportDetail);
        
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
            arrShell = goodDAO.getShellVendor(organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        ArrayList arrAccessory = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrAccessory = goodDAO.getAccessorys(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrAccessory == null) {
            arrAccessory = new ArrayList();
        }
        request.setAttribute(Constants.ACCESSORY_LIST, arrAccessory);
        
        ArrayList arrOilExport = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrOilExport = goodDAO.getOilExports(QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOilExport == null) {
            arrOilExport = new ArrayList();
        }
        request.setAttribute(Constants.OIL_EXPORT_LIST, arrOilExport);

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

        ArrayList arrVehicleOut = null;
        try {
            if (formBean.getId() == 0) {
                String today = DateUtil.today("dd/MM/yyyy");
                String vehicleOutSavedDate = request.getParameter("vehicleOutSavedDate");
                if (GenericValidator.isBlankOrNull(vehicleOutSavedDate)) {
                    vehicleOutSavedDate = today;
                }
                String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
                arrVehicleOut = gasDAO.searchVehicleOut(vehicleOutSavedDate, vehicleOutSavedDate, organizationIds);
            } else {
                if (arrVehicleOut == null) {
                    arrVehicleOut = new ArrayList();
                }
                VehicleOutBean vehicleOutbean = gasDAO.getVehicleOut(formBean.getVehicleOutId());
                VehicleOutFormBean vehicleOutFormBean = new VehicleOutFormBean(vehicleOutbean);
                arrVehicleOut.add(vehicleOutFormBean);
            }
        } catch (Exception ex) {
        }
        if (arrVehicleOut == null) {
            arrVehicleOut = new ArrayList();
        }
        request.setAttribute(Constants.VEHICLE_OUT_LIST, arrVehicleOut);

        return true;
    }
}
