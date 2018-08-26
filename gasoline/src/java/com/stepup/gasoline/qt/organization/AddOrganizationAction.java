/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.AddDynamicFieldFreeValueAction;
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
public class AddOrganizationAction extends AddDynamicFieldFreeValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        OrganizationFormBean formBean = (OrganizationFormBean) form;
        OrganizationDAO organizationDAO = new OrganizationDAO();
        OrganizationBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = organizationDAO.getOrganizationByName(formBean.getName());
        } catch (Exception ex) {
        }
        int organizationId = formBean.getId();
        if (organizationId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            super.setParentId(organizationId);
            bNew = false;
            if (bean != null && bean.getId() != organizationId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = organizationDAO.getOrganization(organizationId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("organizationExisted", new ActionMessage("organization.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (!formBean.getCode().equals(bean.getCode())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new OrganizationBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setAddress(formBean.getAddress());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                organizationId = organizationDAO.insertOrganization(bean);
                super.setParentId(organizationId);
            } else {
                if (isUpdate) {
                    organizationDAO.updateOrganization(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    @Override
    public String getParentTableName() {
        return DynamicFieldBean.ORGANIZATION;
    }
}
