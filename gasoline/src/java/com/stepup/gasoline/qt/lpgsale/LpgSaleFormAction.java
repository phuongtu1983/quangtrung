/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgsale;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.LpgImportBean;
import com.stepup.gasoline.qt.bean.LpgSaleBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
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
public class LpgSaleFormAction extends SpineAction {

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
        LpgSaleBean bean = null;
        String lpgSaleId = request.getParameter("lpgSaleId");
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(lpgSaleId)) {
            try {
                bean = gasDAO.getLpgSale(NumberUtil.parseInt(lpgSaleId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new LpgSaleBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-LS-";
                String number = gasDAO.getNextLpgSaleNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_LPG_SALE)) {
                bean.setCanEdit(1);
            }
        }

        request.setAttribute(Constants.LPG_SALE, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, CustomerBean.KIND_WHOLESALE, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

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

        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("lpgSale.detail.kind.sale"));
        value.setValue(LpgSaleBean.KIND_SALE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("lpgSale.detail.kind.return"));
        value.setValue(LpgSaleBean.KIND_RETURN + "");
        arrStatus.add(value);
        request.setAttribute(Constants.LPG_SALE_KIND_LIST, arrStatus);

        return true;
    }
}
