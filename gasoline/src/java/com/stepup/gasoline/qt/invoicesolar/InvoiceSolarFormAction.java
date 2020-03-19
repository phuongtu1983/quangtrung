/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.InvoiceSolarBean;
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
public class InvoiceSolarFormAction extends SpineAction {

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
        InvoiceSolarBean bean = null;
        String invoiceSolarId = request.getParameter("invoiceSolarId");
        ArrayList arrDetail = null;
        ArrayList arrPaidDetail = null;
        ContractDAO contractDAO = new ContractDAO();
        if (!GenericValidator.isBlankOrNull(invoiceSolarId)) {
            try {
                int id = NumberUtil.parseInt(invoiceSolarId, 0);
                bean = contractDAO.getInvoiceSolar(id);
                arrDetail = contractDAO.getInvoiceSolarDetail(id);
                arrPaidDetail = contractDAO.getInvoiceSolarPaidDetail(id);
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new InvoiceSolarBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-IS-";
                String number = contractDAO.getNextInvoiceSolarNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.INVOICE_SOLAR, bean);

        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.INVOICE_SOLAR_DETAIL, arrDetail);

        if (arrPaidDetail == null) {
            arrPaidDetail = new ArrayList();
        }
        request.setAttribute(Constants.INVOICE_SOLAR_PAID_DETAIL, arrPaidDetail);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_SOLAR);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
