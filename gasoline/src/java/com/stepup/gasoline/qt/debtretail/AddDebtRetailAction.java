/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtretail;

import com.stepup.gasoline.qt.bean.DebtRetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.PaymentDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddDebtRetailAction extends SpineAction {

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
        DebtRetailFormBean formBean = (DebtRetailFormBean) form;
        PaymentDAO paymentDAO = new PaymentDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        DebtRetailBean bean = new DebtRetailBean();
        bean.setId(formBean.getId());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setPaid(formBean.getPaid());
        bean.setCode(formBean.getCode());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                paymentDAO.insertDebtRetail(bean);
            } else {
                paymentDAO.updateDebtRetail(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
