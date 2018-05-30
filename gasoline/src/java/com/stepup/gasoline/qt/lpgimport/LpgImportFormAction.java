/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgimport;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.AccountBean;
import com.stepup.gasoline.qt.bean.LpgImportBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
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
                bean = gasDAO.getLpgImport(Integer.parseInt(lpgImportId));
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
                request.setAttribute(Constants.CAN_EDIT, true);
            } catch (Exception ex) {
            }
        } else {
            try {
                boolean hasAfter = gasDAO.hasLpgImportAfter(Integer.parseInt(lpgImportId));
                if (!hasAfter) {
                    request.setAttribute(Constants.CAN_EDIT, true);
                }
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.LPG_IMPORT, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrOrganization = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrOrganization = vendorDAO.getVendors(organizationIds);
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrOrganization);

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

        return true;
    }
}
