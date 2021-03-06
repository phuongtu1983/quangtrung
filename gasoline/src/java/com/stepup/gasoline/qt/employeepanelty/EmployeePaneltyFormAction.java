/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeepanelty;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.EmployeePaneltyBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
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
public class EmployeePaneltyFormAction extends SpineAction {

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
        EmployeePaneltyBean bean = null;
        String employeePaneltyId = request.getParameter("employeePaneltyId");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        if (!GenericValidator.isBlankOrNull(employeePaneltyId)) {
            try {
                bean = employeeDAO.getEmployeePanelty(NumberUtil.parseInt(employeePaneltyId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new EmployeePaneltyBean();
            bean.setCreatedDate(DateUtil.today("dd/MM/yyyy"));
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-EI-";
                String number = employeeDAO.getNextEmployeePaneltyNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        }
        request.setAttribute(Constants.EMPLOYEE_PANELTY, bean);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrEmployee = null;
        try {
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);

        ArrayList arrPanelty = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrPanelty = organizationDAO.getPaneltysList(organizationIds);
        } catch (Exception ex) {
        }
        if (arrPanelty == null) {
            arrPanelty = new ArrayList();
        }
        request.setAttribute(Constants.PANELTY_LIST, arrPanelty);

        return true;
    }
}
