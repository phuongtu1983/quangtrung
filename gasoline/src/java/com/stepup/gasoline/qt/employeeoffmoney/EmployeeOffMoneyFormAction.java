/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoffmoney;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeOffMoneyBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
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
public class EmployeeOffMoneyFormAction extends SpineAction {

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
        EmployeeOffMoneyBean bean = null;
        String employeeOffMoneyId = request.getParameter("employeeOffMoneyId");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        if (!GenericValidator.isBlankOrNull(employeeOffMoneyId)) {
            try {
                bean = employeeDAO.getEmployeeOffMoney(Integer.parseInt(employeeOffMoneyId));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new EmployeeOffMoneyBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-EM-";
                String number = employeeDAO.getNextEmployeeOffMoneyNumber(prefix, 4);
                prefix += number;
                bean.setCode(prefix);
            } catch (Exception ex) {
            }
        } else {
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_EMPLOYEE_OFF_MONEY)) {
                bean.setCanEdit(1);
            }
        }

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrEmployee = null;
        try {
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
            if (bean.getEmployeeId() == 0) {
                if (arrEmployee != null && arrEmployee.size() > 0) {
                    EmployeeFormBean empBean = (EmployeeFormBean) arrEmployee.get(0);
                    EmployeeOffMoneyBean moneyBean = employeeDAO.getDayOffAndSalaryOfEmployee(empBean.getId());
                    if (moneyBean != null) {
                        bean.setQuantity(moneyBean.getQuantity());
                        bean.setPrice(moneyBean.getPrice());
                        bean.setAmount(moneyBean.getQuantity() * moneyBean.getPrice());
                        bean.setEmployeeId(empBean.getId());
                    }
                }
            }
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);
        request.setAttribute(Constants.EMPLOYEE_OFF_MONEY, bean);

        ArrayList arrAccount = null;
        try {
            AccountDAO accountDAO = new AccountDAO();
            arrAccount = accountDAO.getAccounts(organizationIds);
        } catch (Exception ex) {
        }
        if (arrAccount == null) {
            arrAccount = new ArrayList();
        }
        request.setAttribute(Constants.ACCOUNT_LIST, arrAccount);

        return true;
    }
}
