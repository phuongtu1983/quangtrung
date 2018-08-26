/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtwholesale;

import com.stepup.gasoline.qt.bean.DebtWholesaleBean;
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
public class AddDebtWholesaleAction extends SpineAction {

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
        DebtWholesaleFormBean formBean = (DebtWholesaleFormBean) form;
        PaymentDAO paymentDAO = new PaymentDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        DebtWholesaleBean bean = new DebtWholesaleBean();
        bean.setId(formBean.getId());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setPaid(formBean.getPaid());
        bean.setCode(formBean.getCode());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                paymentDAO.insertDebtWholesale(bean);
            } else {
                paymentDAO.updateDebtWholesale(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}