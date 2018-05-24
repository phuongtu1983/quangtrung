/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellkind;

import com.stepup.gasoline.qt.bean.ShellKindBean;
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
public class AddShellKindAction extends SpineAction {

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
        ShellKindFormBean formBean = (ShellKindFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        ShellKindBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = goodDAO.getShellKindByName(formBean.getName());
        } catch (Exception ex) {
        }
        int kindId = formBean.getId();
        if (kindId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != kindId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = goodDAO.getShellKind(kindId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("shellKindExisted", new ActionMessage("shellKind.save.error"));
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
                if (formBean.getWeight() != bean.getWeight()) {
                    isUpdate = true;
                }
                if (formBean.getCommission() != bean.getCommission()) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new ShellKindBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setCode(formBean.getCode());
        bean.setWeight(formBean.getWeight());
        bean.setCommission(formBean.getCommission());
        bean.setStatus(formBean.getStatus());
        try {
            if (bNew) {
                goodDAO.insertShellKind(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updateShellKind(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
