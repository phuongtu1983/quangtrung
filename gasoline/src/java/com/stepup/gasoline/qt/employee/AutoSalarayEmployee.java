/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SalaryBean;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class AutoSalarayEmployee implements Runnable {

    @Override
    public void run() {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String yesterday = formatter.format(calendar.getTime());
            String prefix = DateUtil.today("yyyyMMdd") + "-ES-";

            int workingDays = calendar.get(Calendar.DAY_OF_MONTH) - calendar.get(Calendar.WEEK_OF_MONTH);
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList arrEmp = employeeDAO.getNotSalaryEmployee(yesterday);
            EmployeeBean bean = null;
            SalaryBean salaryBean = null;
            String code = "";
            for (int i = 0; i < arrEmp.size(); i++) {
                bean = (EmployeeBean) arrEmp.get(i);
                code = employeeDAO.getNextEmployeeSalaryNumber(prefix, 4);
                salaryBean = new SalaryBean();
                salaryBean.setCode(prefix + code);
                salaryBean.setCreatedDate(yesterday);
                salaryBean.setEmployeeId(bean.getId());
                salaryBean.setMonthDay(workingDays);
                salaryBean.setBasicSalary(bean.getSalary());
                employeeDAO.insertSalary(salaryBean);
            }
        } catch (Exception ex) {

        }
    }

}
