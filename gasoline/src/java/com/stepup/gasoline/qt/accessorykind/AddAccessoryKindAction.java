/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessorykind;

import com.stepup.gasoline.qt.bean.AccessoryKindBean;
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
public class AddAccessoryKindAction extends SpineAction {

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
        AccessoryKindFormBean formBean = (AccessoryKindFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        AccessoryKindFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = goodDAO.getAccessoryKindByName(formBean.getName());
        } catch (Exception ex) {
        }
        int kindId = formBean.getId();
        if (kindId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != kindId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = goodDAO.getAccessoryKind(kindId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("accessoryKindExisted", new ActionMessage("accessoryKind.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getName().equals(oldBean.getNote())) {
                    isUpdate = true;
                }
                if (formBean.getCommission() != oldBean.getCommission()) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != oldBean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        AccessoryKindBean bean = new AccessoryKindBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        bean.setCommission(formBean.getCommission());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                goodDAO.insertAccessoryKind(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updateAccessoryKind(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
