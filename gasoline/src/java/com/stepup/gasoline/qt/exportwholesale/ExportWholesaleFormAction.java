/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.exportwholesale;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
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
public class ExportWholesaleFormAction extends SpineAction {

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
        ExportWholesaleBean bean = null;
        String id = request.getParameter("exportWholesaleId");
        ArrayList arrDetail = null;
        ArrayList arrReturnShelDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = NumberUtil.parseInt(id, 0);
                bean = gasDAO.getExportWholesale(gasImportId);
                arrDetail = gasDAO.getExportWholesaleDetail(gasImportId);
                arrReturnShelDetail = gasDAO.getExportWholesaleReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        ExportWholesaleFormBean formBean = null;
        if (bean != null) {
            formBean = new ExportWholesaleFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_EXPORT_WHOLESALE)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new ExportWholesaleFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-EW-";
                    String number = gasDAO.getNextExportWholesaleNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.EXPORT_WHOLESALE, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.EXPORT_WHOLESALE_SHELL, arrDetail);

        if (arrReturnShelDetail == null) {
            arrReturnShelDetail = new ArrayList();
        }
        request.setAttribute(Constants.EXPORT_WHOLESALE_RETURN, arrReturnShelDetail);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            arrShell = goodDAO.getShellVendor(organizationIds, vendorIds);
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
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
