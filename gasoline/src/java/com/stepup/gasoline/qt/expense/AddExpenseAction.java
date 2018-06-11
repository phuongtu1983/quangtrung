/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.expense;

import com.stepup.gasoline.qt.bean.ExpenseBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.PaymentDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddExpenseAction extends SpineAction {

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
        ExpenseFormBean formBean = (ExpenseFormBean) form;
        PaymentDAO paymentDAO = new PaymentDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        ExpenseBean bean = new ExpenseBean();
        bean.setId(formBean.getId());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setFromDate(formBean.getFromDate());
        bean.setToDate(formBean.getToDate());
        bean.setAmount(formBean.getAmount());
        bean.setCode(formBean.getCode());
        bean.setContent(formBean.getContent());
        bean.setNote(formBean.getNote());
        bean.setIsUsually(formBean.getIsUsually() == true ? 1 : 0);
        try {
            if (bNew) {
                paymentDAO.insertExpense(bean);
            } else {
                paymentDAO.updateExpense(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
