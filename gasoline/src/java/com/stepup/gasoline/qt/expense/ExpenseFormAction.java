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
        }else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_EXPENSE)) {
                formBean.setCanEdit(1);
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
        
        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("expense.detail.type.other.title"));
        value.setValue(ExpenseBean.TYPE_OTHER + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("expense.detail.type.bank.title"));
        value.setValue(ExpenseBean.TYPE_BANK + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("expense.detail.type.company.title"));
        value.setValue(ExpenseBean.TYPE_COMPANY + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("expense.detail.type.income.title"));
        value.setValue(ExpenseBean.TYPE_INCOME + "");
        arrStatus.add(value);
        request.setAttribute(Constants.EXPENSE_TYPE_LIST, arrStatus);

        return true;
    }
}
