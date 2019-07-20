/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoice;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.InvoiceBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ContractDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
public class InvoiceFormAction extends SpineAction {

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
        InvoiceBean bean = null;
        String invoiceId = request.getParameter("invoiceId");
        ArrayList arrDetail = null;
        ArrayList arrPaidDetail = null;
        ContractDAO contractDAO = new ContractDAO();
        if (!GenericValidator.isBlankOrNull(invoiceId)) {
            try {
                int id = NumberUtil.parseInt(invoiceId, 0);
                bean = contractDAO.getInvoice(id);
                arrDetail = contractDAO.getInvoiceDetail(id);
                arrPaidDetail = contractDAO.getInvoicePaidDetail(id);
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new InvoiceBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-IN-";
                String number = contractDAO.getNextInvoiceNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.INVOICE, bean);

        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.INVOICE_DETAIL, arrDetail);

        if (arrPaidDetail == null) {
            arrPaidDetail = new ArrayList();
        }
        request.setAttribute(Constants.INVOICE_PAID_DETAIL, arrPaidDetail);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_OIL);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
