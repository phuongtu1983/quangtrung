/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dynamicfield;

import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.DynamicFieldDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class DeleteDynamicFieldAction extends SpineAction {

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
        try {
            DynamicFieldDAO dynamicFieldDAO = new DynamicFieldDAO();
            dynamicFieldDAO.deleteDynamicField(request.getParameter("fieldId"));
        } catch (Exception ex) {
        }
        return true;
    }
}
