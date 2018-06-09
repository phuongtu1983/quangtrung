/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oldshell;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.OldShellBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
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
public class OldShellFormAction extends SpineAction {

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
        OldShellBean bean = null;
        String oldShellId = request.getParameter("oldShellId");
        VehicleDAO vehicleDAO = new VehicleDAO();
        if (!GenericValidator.isBlankOrNull(oldShellId)) {
            try {
                bean = vehicleDAO.getOldShell(Integer.parseInt(oldShellId));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new OldShellBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-OS-";
                String number = vehicleDAO.getNextOldShellNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.OLD_SHELL, bean);

        return true;
    }
}
