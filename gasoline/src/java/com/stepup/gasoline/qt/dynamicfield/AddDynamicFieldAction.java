/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dynamicfield;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
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
public class AddDynamicFieldAction extends SpineAction {

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
        DynamicFieldFormBean formBean = (DynamicFieldFormBean) form;
        DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
        DynamicFieldFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = dynamicFieldDAO.getDynamicFieldByName(formBean.getName(), formBean.getTableName());
        } catch (Exception ex) {
        }
        int fieldId = formBean.getId();
        if (fieldId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != fieldId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = dynamicFieldDAO.getDynamicField(fieldId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("dynamicFieldExisted", new ActionMessage("dynamicField.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (!bNew) {
                if (!formBean.getCode().equals(oldBean.getCode())) {
                    isUpdate = true;
                }
                if (!formBean.getName().equals(oldBean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId() != oldBean.getOrganizationId()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        DynamicFieldBean bean = new DynamicFieldBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setName(formBean.getName());
        bean.setTableName(formBean.getTableName());
        bean.setOrganizationId(formBean.getOrganizationId());
        try {
            if (bNew) {
                dynamicFieldDAO.insertDynamicField(bean);
            } else {
                if (isUpdate) {
                    dynamicFieldDAO.updateDynamicField(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
