/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gui;

import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetMenuAction extends Action {

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        UserDAO userDAO = new UserDAO();
        OutputUtil.sendXmlStringToOutput(response, userDAO.getUserMenu(QTUtil.getMemberID(request.getSession())));
        return null;
    }
}