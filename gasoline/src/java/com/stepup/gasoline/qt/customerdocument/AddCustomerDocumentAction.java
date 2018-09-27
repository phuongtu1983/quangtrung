/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customerdocument;

import com.stepup.gasoline.qt.bean.DocumentBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
public class AddCustomerDocumentAction extends SpineAction {

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
        CustomerDocumentFormBean formBean = (CustomerDocumentFormBean) form;
        CustomerDAO customerDAO = new CustomerDAO();
        CustomerDocumentFormBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = customerDAO.getDocumentByName(formBean.getName());
        } catch (Exception ex) {
        }
        int documentId = formBean.getId();
        if (documentId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != documentId) {
                isExist = true;
            }
            if (oldBean == null) {
                try {
                    oldBean = customerDAO.getDocument(documentId);
                } catch (Exception ex) {
                }
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("customerDocumentExisted", new ActionMessage("customerDocument.save.error"));
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
            }
        } catch (Exception ex) {
        }
        DocumentBean bean = new DocumentBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                documentId = customerDAO.insertDocument(bean);
            } else {
                if (isUpdate) {
                    customerDAO.updateDocument(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

}
