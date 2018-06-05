/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.AccountBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.GasWholesaleBean;
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
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class GasWholesaleFormAction extends SpineAction {

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
        GasWholesaleBean bean = null;
        String id = request.getParameter("gasWholesaleId");
        ArrayList arrDetail = null;
        ArrayList arrPromotionMaterialDetail = null;
        ArrayList arrReturnShellDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getGasWholesale(gasImportId);
                arrDetail = gasDAO.getGasWholesaleDetail(gasImportId);
                arrPromotionMaterialDetail = gasDAO.getGasWholesalePromotionMaterialDetail(gasImportId);
                arrReturnShellDetail = gasDAO.getGasWholesaleReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        GasWholesaleFormBean formBean = null;
        if (bean != null) {
            formBean = new GasWholesaleFormBean(bean);
        } else {
            formBean = new GasWholesaleFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-GW-";
                    String number = gasDAO.getNextGasWholesaleNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.GAS_WHOLESALE, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_WHOLESALE_SHELL, arrDetail);
        
        if (arrPromotionMaterialDetail == null) {
            arrPromotionMaterialDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_WHOLESALE_PROMOTION_MATERIAL, arrPromotionMaterialDetail);
        
        if (arrReturnShellDetail == null) {
            arrReturnShellDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_WHOLESALE_RETURN_SHELL, arrReturnShellDetail);

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

        ArrayList arrPaymentMode = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("paymentMode.cash"));
        value.setValue(AccountBean.PAYMENT_MODE_CASH + "");
        arrPaymentMode.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("paymentMode.bank"));
        value.setValue(AccountBean.PAYMENT_MODE_BANK + "");
        arrPaymentMode.add(value);
        request.setAttribute(Constants.PAYMENT_MODE_LIST, arrPaymentMode);

        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds);
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
