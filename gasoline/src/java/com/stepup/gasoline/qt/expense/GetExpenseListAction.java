/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.expense;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.PaymentDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetExpenseListAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            PaymentDAO paymentDAO = new PaymentDAO();
            ArrayList list = paymentDAO.searchExpense(request.getParameter("fromDate"), request.getParameter("toDate"));
            if (list != null) {
                int length = list.size();
                for (int i = 0; i < length; i++) {
                    ExpenseFormBean bean = (ExpenseFormBean) list.get(i);
                    buff.append("<row id=\"").append(bean.getId()).append("\">");
                    buff.append("<cell>").append(bean.getCode()).append("^javascript:getExpense(").append(bean.getId()).append(",\"loadExpensePanel\")^_self</cell>");
                    buff.append("<cell>").append(bean.getCreatedDate()).append("</cell>");
                    buff.append("<cell>").append(bean.getContent()).append("</cell>");
                    buff.append("<cell>").append(NumberUtil.formatMoneyDefault(bean.getAmount(), "VND")).append("</cell>");
                    buff.append("<cell>").append(bean.getNote()).append("</cell>");
                    buff.append("</row>");
                }
            }
        } catch (Exception ex) {
        }
        buff.append("</rows>");

        OutputUtil.sendXmlStringToOutput(response, buff.toString());
        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    @Override
    protected String getActionName() {
        return this.getClass().getName();
    }
}
