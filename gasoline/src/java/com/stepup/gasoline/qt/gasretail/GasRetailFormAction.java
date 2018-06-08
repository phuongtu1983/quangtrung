/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasretail;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.GasRetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class GasRetailFormAction extends SpineAction {

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
        GasRetailBean bean = null;
        String id = request.getParameter("gasRetailId");
        ArrayList arrDetail = null;
        ArrayList arrPromotionMaterialDetail = null;
        ArrayList arrReturnShellDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getGasRetail(gasImportId);
                arrDetail = gasDAO.getGasRetailDetail(gasImportId);
                arrPromotionMaterialDetail = gasDAO.getGasRetailPromotionMaterialDetail(gasImportId);
                arrReturnShellDetail = gasDAO.getGasRetailReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        GasRetailFormBean formBean = null;
        if (bean != null) {
            formBean = new GasRetailFormBean(bean);
        } else {
            formBean = new GasRetailFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-GW-";
                    String number = gasDAO.getNextGasRetailNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.GAS_RETAIL, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_RETAIL_SHELL, arrDetail);

        if (arrPromotionMaterialDetail == null) {
            arrPromotionMaterialDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_RETAIL_PROMOTION_MATERIAL, arrPromotionMaterialDetail);

        if (arrReturnShellDetail == null) {
            arrReturnShellDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_RETAIL_RETURN_SHELL, arrReturnShellDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShell = goodDAO.getShells(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        ArrayList arrPromotionMaterial = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrPromotionMaterial = goodDAO.getPromotionMaterials(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrPromotionMaterial == null) {
            arrPromotionMaterial = new ArrayList();
        }
        request.setAttribute(Constants.PROMOTION_MATERIAL_LIST, arrPromotionMaterial);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrAccount = null;
        try {
            AccountDAO accountDAO = new AccountDAO();
            arrAccount = accountDAO.getAccounts(organizationIds);
        } catch (Exception ex) {
        }
        if (arrAccount == null) {
            arrAccount = new ArrayList();
        }
        request.setAttribute(Constants.ACCOUNT_LIST, arrAccount);

        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, CustomerBean.KIND_RETAIL);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

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
