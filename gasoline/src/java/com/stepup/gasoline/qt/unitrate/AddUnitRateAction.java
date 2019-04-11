/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.unitrate;

import com.stepup.gasoline.qt.bean.UnitRateBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.UnitDAO;
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
public class AddUnitRateAction extends SpineAction {

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
        UnitRateFormBean formBean = (UnitRateFormBean) form;
        UnitDAO unitDAO = new UnitDAO();
        UnitRateBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = unitDAO.getUnitRate(formBean.getBaseUnitId(), formBean.getParentUnitId());
        } catch (Exception ex) {
        }
        int unitRateId = formBean.getId();
        if (unitRateId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != unitRateId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = unitDAO.getUnitRate(unitRateId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("unitRateExisted", new ActionMessage("unitRate.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (formBean.getBaseUnitId() != bean.getBaseUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getParentUnitId() != bean.getParentUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getRate() != bean.getRate()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new UnitRateBean();
        bean.setId(formBean.getId());
        bean.setBaseUnitId(formBean.getBaseUnitId());
        bean.setParentUnitId(formBean.getParentUnitId());
        bean.setRate(formBean.getRate());
        try {
            if (bNew) {
                unitDAO.insertUnitRate(bean);
            } else {
                if (isUpdate) {
                    unitDAO.updateUnitRate(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
