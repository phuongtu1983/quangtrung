/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oldshell;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OldShellBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import java.util.ArrayList;
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
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(oldShellId)) {
            try {
                bean = gasDAO.getOldShell(Integer.parseInt(oldShellId));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new OldShellBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-OS-";
                String number = gasDAO.getNextOldShellNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_OLD_SHELL)) {
                bean.setCanEdit(1);
            }
        }
        request.setAttribute(Constants.OLD_SHELL, bean);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShell = goodDAO.getShells(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

        return true;
    }
}
