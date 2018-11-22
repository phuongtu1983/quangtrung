/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.debtvendor;

import com.stepup.gasoline.qt.bean.DebtVendorBean;
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
public class AddDebtVendorAction extends SpineAction {

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
        DebtVendorFormBean formBean = (DebtVendorFormBean) form;
        PaymentDAO paymentDAO = new PaymentDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        DebtVendorBean bean = new DebtVendorBean();
        bean.setId(formBean.getId());
        bean.setAccountId(formBean.getAccountId());
        bean.setPaid(formBean.getPaid());
        bean.setCode(formBean.getCode());
        bean.setVendorId(formBean.getVendorId());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                bean.setCreatedDate(formBean.getCreatedDate());
                paymentDAO.insertDebtVendor(bean);
            } else {
                paymentDAO.updateDebtVendor(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
