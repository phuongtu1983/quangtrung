/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtvendor;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DebtVendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.PaymentDAO;
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
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class DebtVendorFormAction extends SpineAction {

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
        DebtVendorBean bean = null;
        String debtVendorId = request.getParameter("debtVendorId");
        PaymentDAO paymentDAO = new PaymentDAO();
        if (!GenericValidator.isBlankOrNull(debtVendorId)) {
            try {
                bean = paymentDAO.getDebtVendor(NumberUtil.parseInt(debtVendorId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new DebtVendorBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-DV-";
                String number = paymentDAO.getNextDebtVendorNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_DEBT_VENDOR)) {
                bean.setCanEdit(1);
            }
        }
        request.setAttribute(Constants.DEBT_VENDOR, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(organizationIds, "");
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

        ArrayList arrKind = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("debtVendor.detail.kind.good.title"));
        value.setValue(DebtVendorBean.KIND_GOOD + "");
        arrKind.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("debtVendor.detail.kind.transport.title"));
        value.setValue(DebtVendorBean.KIND_TRANSPORT + "");
        arrKind.add(value);
        request.setAttribute(Constants.KIND_LIST, arrKind);

        return true;
    }
}
