/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solargroup;

import com.stepup.gasoline.qt.bean.SolarGroupBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AddSolarGroupAction extends SpineAction {

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
        SolarGroupFormBean formBean = (SolarGroupFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SolarGroupBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = goodDAO.getSolarGroupByName(formBean.getName());
        } catch (Exception ex) {
        }
        int solarGroupId = formBean.getId();
        if (solarGroupId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != solarGroupId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = goodDAO.getSolarGroup(solarGroupId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("solarGroupExisted", new ActionMessage("solarGroup.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new SolarGroupBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                goodDAO.insertSolarGroup(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updateSolarGroup(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
