/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.expense;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.ExpenseBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
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
public class ExpenseFormAction extends SpineAction {

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
        ExpenseFormBean formBean = null;
        String expenseId = request.getParameter("expenseId");
        PaymentDAO paymentDAO = new PaymentDAO();
        if (!GenericValidator.isBlankOrNull(expenseId)) {
            try {
                ExpenseBean bean = paymentDAO.getExpense(Integer.parseInt(expenseId));
                if (bean != null) {
                    formBean = new ExpenseFormBean(bean);
                }
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new ExpenseFormBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-EX-";
                String number = paymentDAO.getNextExpenseNumber(prefix, 4);
                prefix += number;
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.EXPENSE, formBean);

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

        return true;
    }
}
