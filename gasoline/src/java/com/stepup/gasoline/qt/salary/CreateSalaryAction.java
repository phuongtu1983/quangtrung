/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salary;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SalaryBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AutoDAO;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class CreateSalaryAction extends SpineAction {

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
            AutoDAO autoDAO = new AutoDAO();
            autoDAO.insertAutoSalaryEmployee();
            createSalary(request);
        } catch (Exception ex) {
        }
        return true;
    }

    private void createSalary(HttpServletRequest request) {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String yesterday = formatter.format(calendar.getTime());
            String prefix = DateUtil.today("yyyyMMdd") + "-ES-";

            int workingDays = calendar.get(Calendar.DAY_OF_MONTH) - calendar.get(Calendar.WEEK_OF_MONTH) + 1;
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList arrEmp = employeeDAO.getNotSalaryEmployee(yesterday);
            EmployeeBean bean = null;
            SalaryBean salaryBean = null;
            String code = "";
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            String startDate = DateUtil.getFirstDayOfMonth("dd/MM/yyyy");
            String fromDate = DateUtil.getLastDayOfMonth("dd/MM/yyyy");
            for (int i = 0; i < arrEmp.size(); i++) {
                bean = (EmployeeBean) arrEmp.get(i);
                String session = bean.getId() + "_" + QTUtil.getEmployeeId(request.getSession()) + "_" + Calendar.getInstance().getTimeInMillis();
                code = employeeDAO.getNextEmployeeSalaryNumber(prefix, 4);
                salaryBean = new SalaryBean();
                salaryBean.setCode(prefix + code);
                salaryBean.setCreatedDate(yesterday);
                salaryBean.setEmployeeId(bean.getId());
                salaryBean.setMonthDay(workingDays);
                salaryBean.setBasicSalary(bean.getSalary());
                employeeDAO.insertSalary(salaryBean, startDate, fromDate, organizationIds, session);
            }
        } catch (Exception ex) {

        }
    }
}
