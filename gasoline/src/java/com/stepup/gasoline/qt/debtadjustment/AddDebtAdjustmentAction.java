/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtadjustment;

import com.stepup.gasoline.qt.bean.DebtAdjustmentBean;
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
public class AddDebtAdjustmentAction extends SpineAction {

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
        DebtAdjustmentFormBean formBean = (DebtAdjustmentFormBean) form;
        PaymentDAO paymentDAO = new PaymentDAO();
        
        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        DebtAdjustmentBean bean = new DebtAdjustmentBean();
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVendorId(formBean.getVendorId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setKind(formBean.getKind());
        bean.setAmount(formBean.getAmount());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                paymentDAO.insertDebtAdjustment(bean);
            } else {
                paymentDAO.updateDebtAdjustment(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
