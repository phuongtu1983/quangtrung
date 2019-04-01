/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dayoff;

import com.stepup.gasoline.qt.bean.DayoffBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
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
public class AddDayoffAction extends SpineAction {

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
        DayoffFormBean formBean = (DayoffFormBean) form;
        OrganizationDAO organizationDAO = new OrganizationDAO();
        DayoffFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = organizationDAO.getDayoffByName(formBean.getName());
        } catch (Exception ex) {
        }
        int dayoffId = formBean.getId();
        if (dayoffId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != dayoffId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = organizationDAO.getDayoff(dayoffId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("dayoffExisted", new ActionMessage("dayoff.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(oldBean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        DayoffBean bean = new DayoffBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        bean.setOrganizationId(formBean.getOrganizationId());
        try {
            if (bNew) {
                organizationDAO.insertDayoff(bean);
            } else {
                if (isUpdate) {
                    organizationDAO.updateDayoff(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
