/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellimport;

import com.stepup.gasoline.qt.bean.ShellImportBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddShellImportAction extends SpineAction {

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
        ShellImportFormBean formBean = (ShellImportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        ShellImportBean bean = null;
        boolean bNew = false;

        int shellImportId = formBean.getId();
        if (shellImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
            try {
                bean = goodDAO.getShellImport(shellImportId);
            } catch (Exception ex) {
            }
        }

        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getCreatedDate().equals(bean.getCreatedDate())) {
                    isUpdate = true;
                }
                if (formBean.getShellId() != bean.getShellId()) {
                    isUpdate = true;
                }
                if (formBean.getQuantity() != bean.getQuantity()) {
                    isUpdate = true;
                }
                if (formBean.getPrice() != bean.getPrice()) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new ShellImportBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setShellId(formBean.getShellId());
        bean.setPrice(formBean.getPrice());
        bean.setQuantity(formBean.getQuantity());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                goodDAO.insertShellImport(bean);
            } else {
                if (isUpdate) {
                    goodDAO.updateShellImport(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
