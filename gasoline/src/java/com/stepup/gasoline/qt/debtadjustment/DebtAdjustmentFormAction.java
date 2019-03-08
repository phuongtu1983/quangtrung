/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtadjustment;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DebtAdjustmentBean;
import com.stepup.gasoline.qt.bean.DebtVendorBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
public class DebtAdjustmentFormAction extends SpineAction {

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
        DebtAdjustmentFormBean formBean = null;
        String debtAdjustmentId = request.getParameter("debtAdjustmentId");
        PaymentDAO paymentDAO = new PaymentDAO();
        if (!GenericValidator.isBlankOrNull(debtAdjustmentId)) {
            try {
                DebtAdjustmentBean bean = paymentDAO.getDebtAdjustment(NumberUtil.parseInt(debtAdjustmentId, 0));
                if (bean != null) {
                    formBean = new DebtAdjustmentFormBean(bean);
                }
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new DebtAdjustmentFormBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-DA-";
                String number = paymentDAO.getNextDebtAdjustmentNumber(prefix, 4);
                prefix += number;
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_DEBT_VENDOR)) {
                formBean.setCanEdit(1);
            }
        }
        
        request.setAttribute(Constants.DEBT_ADJUSTMENT, formBean);

        ArrayList arrVendor = null;
        ArrayList arrCustomer = null;
        try {
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_GAS);

            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_GAS);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

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
