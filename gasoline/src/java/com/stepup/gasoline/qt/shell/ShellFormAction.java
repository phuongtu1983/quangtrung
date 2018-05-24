/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shell;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.UnitDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class ShellFormAction extends SpineAction {

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
        ShellBean bean = null;
        String shellId = request.getParameter("shellId");
        if (!GenericValidator.isBlankOrNull(shellId)) {
            GoodDAO goodDAO = new GoodDAO();
            try {
                bean = goodDAO.getShell(Integer.parseInt(shellId));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new ShellBean();
        }
        request.setAttribute(Constants.SHELL, bean);

        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.active"));
        value.setValue(EmployeeBean.STATUS_ACTIVE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.inactive"));
        value.setValue(EmployeeBean.STATUS_INACTIVE + "");
        arrStatus.add(value);
        request.setAttribute(Constants.STATUS_LIST, arrStatus);

        ArrayList arrUnit = null;
        try {
            UnitDAO unitDAO = new UnitDAO();
            arrUnit = unitDAO.getUnits(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        request.setAttribute(Constants.UNIT_LIST, arrUnit);

        ArrayList arrShellKind = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShellKind = goodDAO.getShellKinds(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShellKind == null) {
            arrShellKind = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_KIND_LIST, arrShellKind);

        return true;
    }
}
