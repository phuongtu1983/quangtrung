/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.petro;

import com.stepup.gasoline.qt.bean.PetroBean;
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
public class AddPetroAction extends SpineAction {

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
        PetroFormBean formBean = (PetroFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        PetroBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = goodDAO.getPetroByName(formBean.getName());
        } catch (Exception ex) {
        }
        int shellId = formBean.getId();
        if (shellId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != shellId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = goodDAO.getPetro(shellId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("petroExisted", new ActionMessage("petro.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getCode().equals(bean.getCode())) {
                    isUpdate = true;
                }
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getStatus() != bean.getStatus()) {
                    isUpdate = true;
                }
                if (formBean.getUnitId() != bean.getUnitId()) {
                    isUpdate = true;
                }
                if (formBean.getOrganizationId()!= bean.getOrganizationId()) {
                    isUpdate = true;
                }
                if (formBean.getPrice() != bean.getPrice()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new PetroBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setName(formBean.getName());
        bean.setUnitId(formBean.getUnitId());
        bean.setOrganizationId(formBean.getOrganizationId());
        bean.setPrice(formBean.getPrice());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                goodDAO.insertPetro(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updatePetro(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
