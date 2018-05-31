/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessoryimport;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.AccessoryImportBean;
import com.stepup.gasoline.qt.bean.AccountBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AccessoryImportFormAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
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
        AccessoryImportBean bean = null;
        String id = request.getParameter("accessoryImportId");
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int accessoryImportId = Integer.parseInt(id);
                bean = goodDAO.getAccessoryImport(accessoryImportId);
                arrDetail = goodDAO.getAccessoryImportDetail(accessoryImportId);
            } catch (Exception ex) {
            }
        }
        AccessoryImportFormBean formBean = null;
        if (bean != null) {
            formBean = new AccessoryImportFormBean(bean);
        } else {
            formBean = new AccessoryImportFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-AI-";
                    String number = goodDAO.getNextAccessoryImportNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.ACCESSORY_IMPORT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.ACCESSORY_IMPORT_ACCESSORY, arrDetail);

        ArrayList arrAccessory = null;
        try {
            arrAccessory = goodDAO.getAccessorys(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrAccessory == null) {
            arrAccessory = new ArrayList();
        }
        request.setAttribute(Constants.ACCESSORY_LIST, arrAccessory);

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
        
        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(organizationIds);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);
        
        return true;
    }
}
