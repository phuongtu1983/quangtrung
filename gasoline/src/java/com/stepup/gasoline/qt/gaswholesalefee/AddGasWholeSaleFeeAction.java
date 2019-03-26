/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesalefee;

import com.stepup.gasoline.qt.bean.GasWholeSaleFeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddGasWholeSaleFeeAction extends SpineAction {

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
        GasWholeSaleFeeFormBean formBean = (GasWholeSaleFeeFormBean) form;
        GasDAO gasDAO = new GasDAO();
        GasWholeSaleFeeBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = gasDAO.getGasWholeSaleFeeByName(formBean.getName());
        } catch (Exception ex) {
        }
        int gasWholeSaleFeeId = formBean.getId();
        if (gasWholeSaleFeeId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != gasWholeSaleFeeId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = gasDAO.getGasWholeSaleFee(gasWholeSaleFeeId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("gasWholeSaleFeeExisted", new ActionMessage("gasWholesale.fee.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getKind() != bean.getKind()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new GasWholeSaleFeeBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setKind(formBean.getKind());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                gasDAO.insertGasWholeSaleFee(bean);
            } else {
                if (isUpdate) {
                    gasDAO.updateGasWholeSaleFee(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
