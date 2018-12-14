/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgimport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.LpgImportBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
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
public class LpgImportFormAction extends SpineAction {

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
        LpgImportBean bean = null;
        String lpgImportId = request.getParameter("lpgImportId");
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(lpgImportId)) {
            try {
                bean = gasDAO.getLpgImport(NumberUtil.parseInt(lpgImportId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new LpgImportBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-LI-";
                String number = gasDAO.getNextLpgImportNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_LPG_IMPORT)) {
                bean.setCanEdit(1);
            }
        }
        request.setAttribute(Constants.LPG_IMPORT, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendorHasStocks(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

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

        ArrayList arrRoute = null;
        try {
            VehicleDAO vehicleDAO = new VehicleDAO();
            arrRoute = vehicleDAO.getRoutes();
        } catch (Exception ex) {
        }
        if (arrRoute == null) {
            arrRoute = new ArrayList();
        }
        request.setAttribute(Constants.ROUTE_LIST, arrRoute);

        return true;
    }
}
