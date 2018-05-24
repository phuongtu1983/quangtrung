/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.unit;

import com.stepup.gasoline.qt.bean.UnitBean;
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
public class AddUnitAction extends SpineAction {

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
        UnitFormBean formBean = (UnitFormBean) form;
        UnitDAO unitDAO = new UnitDAO();
        UnitBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = unitDAO.getUnitByName(formBean.getName());
        } catch (Exception ex) {
        }
        int unitId = formBean.getId();
        if (unitId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != unitId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = unitDAO.getUnit(unitId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("unitExisted", new ActionMessage("unit.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new UnitBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                unitDAO.insertUnit(bean);
            } else {
                if (isUpdate) {
                    unitDAO.updateUnit(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
