/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.employeevehiclesalary;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.salary.SalaryFormBean;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class PrintEmployeeVehicleSalaryReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int employeeId = NumberUtil.parseInt(request.getParameter("employeeId"), 0);

            Date dFromDate = DateUtil.convertStringToDate(fromDate, "dd/MM/yyyy");
            DateFormat dateFormat = new SimpleDateFormat("MM/yyyy");
            Calendar c = Calendar.getInstance();
            c.setTime(dFromDate);

            EmployeeVehicleSalaryReportOutBean outBean = new EmployeeVehicleSalaryReportOutBean();
            VehicleDAO vehicleDAO = new VehicleDAO();
            try {
                EmployeeDAO employeeDAO = new EmployeeDAO();
                SalaryFormBean salaryFormBean = employeeDAO.getSalary(employeeId, c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
                if (salaryFormBean != null) {
                    outBean.setEmployeeName(salaryFormBean.getEmployeeName());
                    outBean.setSalary(salaryFormBean.getBasicSalary());
                    outBean.setAllowance(salaryFormBean.getFieldAmount());
                    outBean.setBhxh(salaryFormBean.getBhxh());
                    outBean.setSeniority(salaryFormBean.getSeniority());
                    outBean.setAdvance(salaryFormBean.getAdvance());
                }
            } catch (Exception ex) {
            }

            ArrayList employeeRouteFeeList = null;
            try {

                employeeRouteFeeList = vehicleDAO.reportEmployeeRouteFee(fromDate, toDate, employeeId);
            } catch (Exception ex) {
            }
            if (employeeRouteFeeList == null) {
                employeeRouteFeeList = new ArrayList();
            }
            beans.put("employeeRouteFee", employeeRouteFeeList);

            ArrayList tripFee = null;
            try {
                tripFee = vehicleDAO.reportTripFee(fromDate, toDate, employeeId);
            } catch (Exception ex) {
            }
            if (tripFee == null) {
                tripFee = new ArrayList();
            }
            beans.put("tripFee", tripFee);

            ArrayList tripOil = null;
            try {
                tripOil = vehicleDAO.reportTripOil(fromDate, toDate, employeeId);
            } catch (Exception ex) {
            }
            if (tripOil == null) {
                tripOil = new ArrayList();
            }
            beans.put("tripOil", tripOil);

            try {
                vehicleDAO.getOtherFieldForEmployeeVehicleSalaryReport(employeeId, c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR), outBean);
            } catch (Exception ex) {
            }

            beans.put("qtrp_date", dateFormat.format(c.getTime()));
            beans.put("qtrp_employeeName", outBean.getEmployeeName());
            beans.put("qtrp_salary", outBean.getSalary());
            beans.put("qtrp_tripAllowance", outBean.getTripAllowance());
            beans.put("qtrp_allowance", outBean.getAllowance());
            beans.put("qtrp_bhxh", outBean.getBhxh());
            beans.put("qtrp_seniority", outBean.getSeniority());
            beans.put("qtrp_advance", outBean.getAdvance());
            beans.put("qtrp_borrow", outBean.getBorrow());
            beans.put("qtrp_borrow_rest", outBean.getBorrowRest());

            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/luong_nhan_vien.xls");

            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "luong_nhan_vien.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
