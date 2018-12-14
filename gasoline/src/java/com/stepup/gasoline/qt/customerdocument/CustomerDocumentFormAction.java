/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customerdocument;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.util.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class CustomerDocumentFormAction extends SpineAction {

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
        CustomerDocumentFormBean formBean = null;
        String customerDocumentId = request.getParameter("customerDocumentId");
        CustomerDAO customerDAO = new CustomerDAO();
        if (!GenericValidator.isBlankOrNull(customerDocumentId)) {
            try {
                formBean = customerDAO.getDocument(NumberUtil.parseInt(customerDocumentId, 0));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new CustomerDocumentFormBean();
        }

        request.setAttribute(Constants.CUSTOMER_DOCUMENT, formBean);

        return true;
    }
}
