/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.panelty;

import com.stepup.gasoline.qt.bean.PaneltyBean;
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
public class AddPaneltyAction extends SpineAction {

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
        PaneltyFormBean formBean = (PaneltyFormBean) form;
        OrganizationDAO organizationDAO = new OrganizationDAO();
        PaneltyFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = organizationDAO.getPaneltyByName(formBean.getName());
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
                    oldBean = organizationDAO.getPanelty(dayoffId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("paneltyExisted", new ActionMessage("panelty.save.error"));
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
        PaneltyBean bean = new PaneltyBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        bean.setOrganizationId(formBean.getOrganizationId());
        try {
            if (bNew) {
                organizationDAO.insertPanelty(bean);
            } else {
                if (isUpdate) {
                    organizationDAO.updatePanelty(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
