/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shielddecrease;

import com.stepup.gasoline.qt.bean.ShieldDecreaseBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddShieldDecreaseAction extends SpineAction {

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
        ShieldDecreaseFormBean formBean = (ShieldDecreaseFormBean) form;
        GoodDAO goodDAO = new GoodDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        ShieldDecreaseBean bean = new ShieldDecreaseBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setQuantity(formBean.getQuantity());
        bean.setNote(formBean.getNote());
        bean.setVendorId(formBean.getVendorId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                bean.setCreatedDate(formBean.getCreatedDate());
                goodDAO.insertShieldDecrease(bean);
            } else {
                goodDAO.updateShieldDecrease(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
