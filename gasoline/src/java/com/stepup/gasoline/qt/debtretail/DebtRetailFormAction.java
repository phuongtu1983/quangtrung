/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtretail;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.DebtRetailBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.PaymentDAO;
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
public class DebtRetailFormAction extends SpineAction {

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
        DebtRetailBean bean = null;
        String debtRetailId = request.getParameter("debtRetailId");
        PaymentDAO paymentDAO = new PaymentDAO();
        if (!GenericValidator.isBlankOrNull(debtRetailId)) {
            try {
                bean = paymentDAO.getDebtRetail(NumberUtil.parseInt(debtRetailId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new DebtRetailBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-DR-";
                String number = paymentDAO.getNextDebtRetailNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.DEBT_RETAIL, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, CustomerBean.KIND_RETAIL, 0);
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

        return true;
    }
}
