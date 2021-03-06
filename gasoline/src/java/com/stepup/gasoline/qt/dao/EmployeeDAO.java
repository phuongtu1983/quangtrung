/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.auth.OnlineUser;
import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.auth.OnlineUserImpl;
import com.stepup.gasoline.qt.bean.BorrowBean;
import com.stepup.gasoline.qt.bean.BorrowDetailBean;
import com.stepup.gasoline.qt.bean.EmployeeAdvanceBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.EmployeeOffBean;
import com.stepup.gasoline.qt.bean.EmployeeOffIncreaseBean;
import com.stepup.gasoline.qt.bean.EmployeeOffMoneyBean;
import com.stepup.gasoline.qt.bean.EmployeeOilCommissionBean;
import com.stepup.gasoline.qt.bean.EmployeeOtherBonusBean;
import com.stepup.gasoline.qt.bean.EmployeePaneltyBean;
import com.stepup.gasoline.qt.bean.EmployeeSalaryFieldBean;
import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionBean;
import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionDetailBean;
import com.stepup.gasoline.qt.bean.EmployeeTimesheetBean;
import com.stepup.gasoline.qt.bean.SalaryBean;
import com.stepup.gasoline.qt.borrow.BorrowFormBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.employeeadvance.EmployeeAdvanceFormBean;
import com.stepup.gasoline.qt.employeeoff.EmployeeOffFormBean;
import com.stepup.gasoline.qt.employeeoffincrease.EmployeeOffIncreaseFormBean;
import com.stepup.gasoline.qt.employeeoffmoney.EmployeeOffMoneyFormBean;
import com.stepup.gasoline.qt.employeeoilcommission.EmployeeOilCommissionFormBean;
import com.stepup.gasoline.qt.employeeotherbonus.EmployeeOtherBonusFormBean;
import com.stepup.gasoline.qt.employeepanelty.EmployeePaneltyFormBean;
import com.stepup.gasoline.qt.employeesolarcommission.EmployeeSolarCommissionFormBean;
import com.stepup.gasoline.qt.employeetimesheet.EmployeeTimesheetFormBean;
import com.stepup.gasoline.qt.salary.EmployeeSalaryFieldDetailFormBean;
import com.stepup.gasoline.qt.salary.EmployeeSalaryTimesheetDetailFormBean;
import com.stepup.gasoline.qt.salary.SalaryFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class EmployeeDAO extends BasicDAO {

    public OnlineUser login(String username, String password)
            throws Exception {
        OnlineUserImpl user = null;
        ResultSet rs = null;

        String sql = "select u.id, e.id as empId, e.fullname, u.username, e.email, e.organization_id"
                + " from employee as e left join user as u on e.id=u.employee_id "
                + " where u.username='" + username + "'" + " and u.password='" + password + "'" + " and u.status=" + EmployeeBean.STATUS_ACTIVE
                + " and e.status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            //System.out.println("sql=" + sql);

            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                user = new OnlineUserImpl();
                user.setID(rs.getInt("id"));
                user.setEmployeeId(rs.getInt("empId"));
                user.setFullName(rs.getString("fullname"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setOrganizationId(rs.getInt("organization_id"));
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return user;
    }

    public EmployeeFormBean getEmployee(int empId) throws Exception {
        ResultSet rs = null;
        String sql = "select e.*, o.name as organization_name"
                + " from employee as e left join organization as o on e.organization_id=o.id where e.status=" + EmployeeBean.STATUS_ACTIVE + " and e.id=" + empId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeFormBean employee = new EmployeeFormBean();
                employee.setId(rs.getInt("id"));
                employee.setIdcard(rs.getString("idcard"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
                employee.setSalary(rs.getDouble("salary"));
                employee.setOrganizationId(rs.getInt("organization_id"));
                employee.setOrganizationName(rs.getString("organization_name"));
                employee.setBirthday(DateUtil.formatDate(rs.getDate("birthday"), "dd/MM/yyyy"));
                employee.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                employee.setSalaryBhxh(rs.getInt("salary_bhxh"));
                employee.setStatus(rs.getInt("status"));
                if (employee.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    employee.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (employee.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    employee.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                return employee;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public EmployeeFormBean getEmployeeByIdcard(String idcard) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee where idcard='" + idcard + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeFormBean employee = new EmployeeFormBean();
                employee.setId(rs.getInt("id"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
                employee.setBirthday(DateUtil.formatDate(rs.getDate("birthday"), "dd/MM/yyyy"));
                employee.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                employee.setSalaryBhxh(rs.getInt("salary_bhxh"));
                employee.setStatus(rs.getInt("status"));
                return employee;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public ArrayList getEmployeeHasNotAccount(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee where id not in (select employee_id from user where status=" + EmployeeBean.STATUS_ACTIVE + ")";
        if (status != 0) {
            sql += " and status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and organization_id in(" + organizationIds + ")";
        }
        sql += " order by id desc";
        ArrayList employeeList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFullname(rs.getString("fullname"));
                bean.setStatus(rs.getInt("status"));
                bean.setEmail(rs.getString("email"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                employeeList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeList;
    }

    public ArrayList getEmployees(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select e.*, o.name as organization_name from employee as e, organization as o where e.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and e.status=" + status;
        }
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and e.organization_id in (" + organizationIds + ")";
        }
        sql += " order by e.fullname desc";
        ArrayList employeeList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFullname(rs.getString("fullname"));
                bean.setEmail(rs.getString("email"));
                bean.setSalary(rs.getDouble("salary"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                employeeList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeList;
    }

    public ArrayList getEmployees(String employeeIds) throws Exception {
        ResultSet rs = null;
        String sql = "select e.*, o.name as organization_name from employee as e, organization as o where e.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE
                + " and e.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(employeeIds)) {
            sql += " and e.id in (" + employeeIds + ")";
        }
        sql += " order by e.fullname desc";
        ArrayList employeeList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFullname(rs.getString("fullname"));
                bean.setEmail(rs.getString("email"));
                bean.setSalary(rs.getDouble("salary"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                employeeList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeList;
    }

    public EmployeeBean getEmployeeByUser(int userId) throws Exception {
        ResultSet rs = null;
        String sql = "select e.id, u.id as user_id, e.fullname from employee as e, user as u where e.id=u.employee_id and u.id=" + userId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeBean employee = new EmployeeBean();
                employee.setId(rs.getInt("id"));
                employee.setUserId(rs.getInt("user_id"));
                employee.setFullname(rs.getString("fullname"));
                return employee;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public int insertEmployee(EmployeeBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String birthday = "", startDate;
            if (GenericValidator.isBlankOrNull(bean.getBirthday())) {
                birthday = "null";
            } else {
                birthday = "STR_TO_DATE('" + bean.getBirthday() + "','%d/%m/%Y')";
            }
            if (GenericValidator.isBlankOrNull(bean.getStartDate())) {
                startDate = "null";
            } else {
                startDate = "STR_TO_DATE('" + bean.getStartDate() + "','%d/%m/%Y')";
            }
            String sql = "";
            sql = "Insert Into employee (idcard, fullname, email, salary, organization_id, status, birthday, start_date, salary_bhxh)"
                    + " Values ('" + bean.getIdcard() + "','" + bean.getFullname() + "','" + bean.getEmail() + "'," + bean.getSalary() + "," + bean.getOrganizationId()
                    + "," + bean.getStatus() + "," + birthday + "," + startDate + "," + bean.getSalaryBhxh() + ")";
            return DBUtil.executeInsert(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }

        }
    }

    public void updateEmployee(EmployeeBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String birthday = "", startDate;
            if (GenericValidator.isBlankOrNull(bean.getBirthday())) {
                birthday = "null";
            } else {
                birthday = "STR_TO_DATE('" + bean.getBirthday() + "','%d/%m/%Y')";
            }
            if (GenericValidator.isBlankOrNull(bean.getStartDate())) {
                startDate = "null";
            } else {
                startDate = "STR_TO_DATE('" + bean.getStartDate() + "','%d/%m/%Y')";
            }
            String sql = "Update employee Set "
                    + " idcard='" + bean.getIdcard() + "'"
                    + ", fullname='" + bean.getFullname() + "'"
                    + ", email='" + bean.getEmail() + "'"
                    + ", birthday=" + birthday
                    + ", start_date=" + startDate
                    + ", salary=" + bean.getSalary()
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", status=" + bean.getStatus()
                    + ", salary_bhxh=" + bean.getSalaryBhxh()
                    + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public void updateEmployeeSalary(EmployeeBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update employee Set salary=" + bean.getSalary() + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchEmployeeAdvance(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeAdvance(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeAdvanceFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeAdvanceFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setAdvanceDate(DateUtil.formatDate(rs.getDate("advance_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeeAdvanceBean getEmployeeAdvance(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),advance_date)=0,1,0) as can_edit from employee_advance where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeAdvanceBean bean = new EmployeeAdvanceBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setAdvanceDate(DateUtil.formatDate(rs.getDate("advance_date"), "dd/MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public int insertEmployeeAdvance(EmployeeAdvanceBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getAdvanceDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getAdvanceDate();
            }
            String sql = "{call insertEmployeeAdvance(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_advance_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_inner_sale_id", 0);
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeAdvance(EmployeeAdvanceBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getAdvanceDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getAdvanceDate();
            }
            String sql = "{call updateEmployeeAdvance(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_advance_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public String getNextEmployeeAdvanceNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_advance");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteEmployeeAdvance(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteEmployeeAdvance(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchSalary(String fromDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSalary(?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SalaryFormBean bean = null;
                    while (rs.next()) {
                        bean = new SalaryFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setTotal(rs.getDouble("total"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public SalaryFormBean getSalary(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select s.*, e.fullname, e.organization_id from employee_salary as s, employee as e where s.employee_id=e.id and s.id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SalaryFormBean bean = new SalaryFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setEmployeeName(rs.getString("fullname"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setBasicSalary(rs.getDouble("basic_salary"));
                bean.setRealSalary(rs.getDouble("real_salary"));
                bean.setTotal(rs.getDouble("total"));
                bean.setMonthDay(rs.getInt("month_day"));
                bean.setWorkingDay(rs.getInt("working_day"));
                bean.setCommission(rs.getDouble("commission"));
                bean.setBonus(rs.getDouble("bonus"));
                bean.setBhxh(rs.getDouble("bhxh"));
                bean.setAdvance(rs.getDouble("advance"));
                bean.setPanelty(rs.getDouble("panelty"));
                bean.setSeniority(rs.getDouble("seniority"));
                bean.setActualReceived(rs.getDouble("actual_received"));
                bean.setFieldAmount(rs.getDouble("field_amount"));
                bean.setTimesheetAmount(rs.getDouble("timesheet_amount"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public SalaryFormBean getSalary(int employeeId, int month, int year) throws Exception {
        ResultSet rs = null;
        String sql = "select s.*, e.fullname, e.organization_id from employee_salary as s, employee as e"
                + " where s.employee_id=e.id and s.employee_id=" + employeeId + " and s.salary_month=" + month + " and s.salary_year=" + year;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SalaryFormBean bean = new SalaryFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setEmployeeName(rs.getString("fullname"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setBasicSalary(rs.getDouble("basic_salary"));
                bean.setRealSalary(rs.getDouble("real_salary"));
                bean.setTotal(rs.getDouble("total"));
                bean.setMonthDay(rs.getInt("month_day"));
                bean.setWorkingDay(rs.getInt("working_day"));
                bean.setCommission(rs.getDouble("commission"));
                bean.setBonus(rs.getDouble("bonus"));
                bean.setBhxh(rs.getDouble("bhxh"));
                bean.setAdvance(rs.getDouble("advance"));
                bean.setPanelty(rs.getDouble("panelty"));
                bean.setSeniority(rs.getDouble("seniority"));
                bean.setActualReceived(rs.getDouble("actual_received"));
                bean.setFieldAmount(rs.getDouble("field_amount"));
                bean.setTimesheetAmount(rs.getDouble("timesheet_amount"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public ArrayList getEmployeeSalaryField(int employeeId, int organizationId, String tableName) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT COALESCE(s.id,0) AS id, f.id AS field_id, f.NAME, s.amount AS VALUE"
                + " FROM dynamic_field AS f LEFT JOIN employee_salary_field AS s ON f.id=s.field_id AND s.employee_id=" + employeeId
                + " WHERE f.organization_id=" + organizationId + " AND table_name='" + tableName + "'"
                + " order by s.field_id";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            DynamicFieldValueFormBean bean = null;
            while (rs.next()) {
                bean = new DynamicFieldValueFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFieldId(rs.getInt("field_id"));
                bean.setName(rs.getString("name"));
                bean.setValue(rs.getString("value"));
                list.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return list;
    }

    public void insertEmployeeSalaryField(EmployeeSalaryFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into employee_salary_field (employee_id, field_id, amount)"
                    + " Values (" + bean.getEmployeeId() + "," + bean.getFieldId() + "," + bean.getAmount() + ")";
            DBUtil.executeInsert(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }

        }
    }

    public void updateEmployeeSalaryField(EmployeeSalaryFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update employee_salary_field Set  amount=" + bean.getAmount() + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchEmployeeTimesheet(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeTimesheet(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeTimesheetFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeTimesheetFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setTimesheetDate(DateUtil.formatDate(rs.getDate("timesheet_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setFieldName(rs.getString("field_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeeTimesheetBean getEmployeeTimesheet(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from timesheet where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeTimesheetBean bean = new EmployeeTimesheetBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setFieldId(rs.getInt("field_id"));
                bean.setTimesheetDate(DateUtil.formatDate(rs.getDate("timesheet_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public String getNextEmployeeTimesheetNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "timesheet");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertEmployeeTimesheet(EmployeeTimesheetBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getTimesheetDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getTimesheetDate();
            }
            String sql = "{call insertEmployeeTimesheet(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_timesheet_date", createdDate);
                spUtil.getCallableStatement().setInt("_field_id", bean.getFieldId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeTimesheet(EmployeeTimesheetBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getTimesheetDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getTimesheetDate();
            }
            String sql = "{call updateEmployeeTimesheet(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_timesheet_date", createdDate);
                spUtil.getCallableStatement().setInt("_field_id", bean.getFieldId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int deleteEmployeeTimesheet(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From timesheet Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchEmployeeOff(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOff(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeOffFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeOffFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setFromDate(DateUtil.formatDate(rs.getDate("from_date"), "dd/MM/yyyy"));
                        bean.setToDate(DateUtil.formatDate(rs.getDate("to_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeeOffBean getEmployeeOff(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_off where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOffBean bean = new EmployeeOffBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setActualOffDay(rs.getFloat("actual_off_day"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setFromDate(DateUtil.formatDate(rs.getDate("from_date"), "dd/MM/yyyy"));
                bean.setToDate(DateUtil.formatDate(rs.getDate("to_date"), "dd/MM/yyyy"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public int insertEmployeeOff(EmployeeOffBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            String fromDate = "";
            String toDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            if (GenericValidator.isBlankOrNull(bean.getFromDate())) {
                fromDate = "null";
            } else {
                fromDate = bean.getFromDate();
            }
            if (GenericValidator.isBlankOrNull(bean.getToDate())) {
                toDate = "null";
            } else {
                toDate = bean.getToDate();
            }
            String sql = "{call insertEmployeeOff(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setString("_from_date", fromDate);
                spUtil.getCallableStatement().setString("_to_date", toDate);
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setFloat("_actual_off_day", bean.getActualOffDay());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeOff(EmployeeOffBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String fromDate = "";
            String toDate = "";
            if (GenericValidator.isBlankOrNull(bean.getFromDate())) {
                fromDate = "null";
            } else {
                fromDate = bean.getFromDate();
            }
            if (GenericValidator.isBlankOrNull(bean.getToDate())) {
                toDate = "null";
            } else {
                toDate = bean.getToDate();
            }
            String sql = "{call updateEmployeeOff(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_from_date", fromDate);
                spUtil.getCallableStatement().setString("_to_date", toDate);
                spUtil.getCallableStatement().setFloat("_actual_off_day", bean.getActualOffDay());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public String getNextEmployeeOffNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_off");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteEmployeeOff(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_off Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getEmployeeSalaryTimesheetDetail(int employeeSalaryId) throws Exception {
        ResultSet rs = null;
        String sql = "select d.id, d.field_name, d.quantity, d.price, d.amount, coalesce(d.note) as note"
                + " from employee_salary_timesheet_detail as d"
                + " where d.employee_salary_id=" + employeeSalaryId
                + " order by d.field_name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeSalaryTimesheetDetailFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeSalaryTimesheetDetailFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFieldName(rs.getString("field_name"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setNote(rs.getString("note"));
                list.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return list;
    }

    public ArrayList getEmployeeSalaryFieldDetail(int employeeSalaryId) throws Exception {
        ResultSet rs = null;
        String sql = "select d.id, d.field_id, d.field_name, d.amount, coalesce(d.note) as note"
                + " from employee_salary_field_detail as d"
                + " where d.employee_salary_id=" + employeeSalaryId
                + " order by d.field_name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeSalaryFieldDetailFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeSalaryFieldDetailFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFieldName(rs.getString("field_name"));
                bean.setFieldId(rs.getInt("field_id"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setNote(rs.getString("note"));
                list.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return list;
    }

    public ArrayList getNotSalaryEmployee(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call getNotSalaryEmployee(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeBean();
                        bean.setId(rs.getInt("id"));
                        bean.setSalary(rs.getDouble("salary"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public String getNextEmployeeSalaryNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_salary");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertSalary(SalaryBean bean, String fromDate, String endDate, String organizationIds, String sessionId) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertSalary(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_month_day", bean.getMonthDay());
                spUtil.getCallableStatement().setDouble("_basic_salary", bean.getBasicSalary());
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                spUtil.getCallableStatement().setString("_session_id", sessionId);
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public int updateSalary(SalaryBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSalary(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateSalaryField(int id, double amount, String note) throws Exception {
        if (id == 0) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSalaryField(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.getCallableStatement().setDouble("_amount", amount);
                spUtil.getCallableStatement().setString("_note", note);
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchEmployeeOffIncrease(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOffIncrease(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeOffIncreaseFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeOffIncreaseFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeeOffIncreaseBean getEmployeeOffIncrease(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_off_increase where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOffIncreaseBean bean = new EmployeeOffIncreaseBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setDayoffId(rs.getInt("dayoff_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public String getNextEmployeeOffIncreaseNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_off_increase");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteEmployeeOffIncrease(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_off_increase Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertEmployeeOffIncrease(EmployeeOffIncreaseBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertEmployeeOffIncrease(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_dayoff_id", bean.getDayoffId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeOffIncrease(EmployeeOffIncreaseBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateEmployeeOffIncrease(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_dayoff_id", bean.getDayoffId());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchEmployeeOffMoney(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOffMoney(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeOffMoneyFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeOffMoneyFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public void deleteEmployeeOffMoney(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteEmployeeOffMoney(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public EmployeeOffMoneyBean getEmployeeOffMoney(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_off_money where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOffMoneyBean bean = new EmployeeOffMoneyBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public int insertEmployeeOffMoney(EmployeeOffMoneyBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertEmployeeOffMoney(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeOffMoney(EmployeeOffMoneyBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateEmployeeOffMoney(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public String getNextEmployeeOffMoneyNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_off_money");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public EmployeeOffMoneyBean getDayOffAndSalaryOfEmployee(int employeeId) throws Exception {
        SPUtil spUtil = null;
        EmployeeOffMoneyBean bean = new EmployeeOffMoneyBean();
        try {
            String sql = "{call getDayOffAndSalaryOfEmployee(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_employee_id", employeeId);
                spUtil.getCallableStatement().registerOutParameter("_day_off", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_salary", Types.DOUBLE);
                spUtil.execute();
                int dayOff = spUtil.getCallableStatement().getInt("_day_off");
                double salary = spUtil.getCallableStatement().getDouble("_salary");
                bean.setQuantity(dayOff);
                bean.setPrice(salary);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return bean;
    }

    public ArrayList getBirthdayEmployeeBeforeDay(int day) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call getBirthdayEmployeeBeforeDay(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_day", day);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeBean();
                        bean.setId(rs.getInt("id"));
                        bean.setFullname(rs.getString("fullname"));
                        bean.setEmail(rs.getString("email"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public String getStartDate() throws Exception {
        ResultSet rs = null;
        String sql = "SELECT value FROM parameter WHERE code='startdate'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                return rs.getString("value");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return "01/01/2018";
    }

    public ArrayList searchEmployeeOtherBonus(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOtherBonus(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeOtherBonusFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeOtherBonusFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeeOtherBonusBean getEmployeeOtherBonus(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_other_bonus where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOtherBonusBean bean = new EmployeeOtherBonusBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setOtherBonusId(rs.getInt("other_bonus_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public String getNextEmployeeOtherBonusNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_other_bonus");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteEmployeeOtherBonus(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_other_bonus Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertEmployeeOtherBonus(EmployeeOtherBonusBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertEmployeeOtherBonus(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_other_bonus_id", bean.getOtherBonusId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeOtherBonus(EmployeeOtherBonusBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateEmployeeOtherBonus(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_other_bonus_id", bean.getOtherBonusId());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList searchEmployeePanelty(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeePanelty(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeePaneltyFormBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeePaneltyFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public EmployeePaneltyBean getEmployeePanelty(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_panelty where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeePaneltyBean bean = new EmployeePaneltyBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setPaneltyId(rs.getInt("panelty_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public String getNextEmployeePaneltyNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "employee_panelty");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteEmployeePanelty(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_panelty Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertEmployeePanelty(EmployeePaneltyBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertEmployeePanelty(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_panelty_id", bean.getPaneltyId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeePanelty(EmployeePaneltyBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateEmployeePanelty(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_panelty_id", bean.getPaneltyId());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList getEmployeesVehicle(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select DISTINCT e.*, o.name as organization_name from employee as e, organization as o, employee_route_fee AS f"
                + " where e.organization_id=o.id and e.id=f.employee_id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and e.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and e.organization_id in (" + organizationIds + ")";
        }
        sql += " order by e.fullname desc";
        ArrayList employeeList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFullname(rs.getString("fullname"));
                bean.setEmail(rs.getString("email"));
                bean.setSalary(rs.getDouble("salary"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                employeeList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeList;
    }

    public ArrayList searchBorrow(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchBorrow(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    BorrowFormBean bean = null;
                    while (rs.next()) {
                        bean = new BorrowFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                }
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return list;
    }

    public BorrowBean getBorrow(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from borrow where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                BorrowBean bean = new BorrowBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public ArrayList getBorrowDetail(int borrowId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.* from borrow_detail as det where det.borrow_id=" + borrowId + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            BorrowDetailBean bean = null;
            while (rs.next()) {
                bean = new BorrowDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setBorrowId(rs.getInt("borrow_id"));
                bean.setPayDate(DateUtil.formatDate(rs.getDate("pay_date"), "MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                detailList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return detailList;
    }

    public int insertBorrow(BorrowBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertBorrow(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
                spUtil.execute();
                result = spUtil.getCallableStatement().getInt("_id");
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateBorrow(BorrowBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateBorrow(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public String getNextBorrowNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "borrow");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteBorrow(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteBorrow(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int insertBorrowDetail(BorrowDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertBorrowDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_borrow_id", bean.getBorrowId());
                spUtil.getCallableStatement().setString("_pay_date", bean.getPayDate());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateBorrowDetail(BorrowDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateBorrowDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_pay_date", bean.getPayDate());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int deleteBorrowDetail(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From borrow_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getEmployeeOilCommissions() throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_oil_commission";
        ArrayList employeeOilCommissionList = new ArrayList();

        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeOilCommissionFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeOilCommissionFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setAmount(rs.getDouble("amount"));
                employeeOilCommissionList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeOilCommissionList;
    }

    public ArrayList getEmployeeOilCommissions(String ids) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_oil_commission where 1";
        if (!org.apache.commons.validator.GenericValidator.isBlankOrNull(ids)) {
            sql += " and id in (" + ids + ")";
        }
        sql += " order by name";
        ArrayList employeeOilCommissionList = new ArrayList();

        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeOilCommissionFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeOilCommissionFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setAmount(rs.getDouble("amount"));
                employeeOilCommissionList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeOilCommissionList;
    }

    public EmployeeOilCommissionBean getEmployeeOilCommission(int employeeOilCommissionId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_oil_commission where id=" + employeeOilCommissionId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOilCommissionBean bean = new EmployeeOilCommissionBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setAmount(rs.getDouble("amount"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public EmployeeOilCommissionBean getEmployeeOilCommissionByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_oil_commission where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeOilCommissionBean bean = new EmployeeOilCommissionBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setAmount(rs.getDouble("amount"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public void insertEmployeeOilCommission(EmployeeOilCommissionBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into employee_oil_commission(name, note, amount) Values ('" + bean.getName() + "','" + bean.getNote() + "'," + bean.getAmount() + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }

        }
    }

    public void updateEmployeeOilCommission(EmployeeOilCommissionBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update employee_oil_commission Set "
                    + " name='" + bean.getName() + "'"
                    + ", note='" + bean.getNote() + "'"
                    + ", amount=" + bean.getAmount()
                    + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int deleteEmployeeOilCommission(int id) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_oil_commission Where id=" + id;
            result = DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getEmployeeSolarCommissions() throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_solar_commission";
        ArrayList employeeSolarCommissionList = new ArrayList();

        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeSolarCommissionFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeSolarCommissionFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                employeeSolarCommissionList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeSolarCommissionList;
    }

    public ArrayList getEmployeeSolarCommissions(String ids) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_solar_commission where 1";
        if (!org.apache.commons.validator.GenericValidator.isBlankOrNull(ids)) {
            sql += " and id in (" + ids + ")";
        }
        sql += " order by name";
        ArrayList employeeSolarCommissionList = new ArrayList();

        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeSolarCommissionFormBean bean = null;
            while (rs.next()) {
                bean = new EmployeeSolarCommissionFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                employeeSolarCommissionList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return employeeSolarCommissionList;
    }

    public EmployeeSolarCommissionBean getEmployeeSolarCommission(int employeeSolarCommissionId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_solar_commission where id=" + employeeSolarCommissionId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeSolarCommissionBean bean = new EmployeeSolarCommissionBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public ArrayList getEmployeeSolarCommissionDetail(int employeeSolarCommissionId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.* from employee_solar_commission_detail as det where det.employee_solar_comission_id=" + employeeSolarCommissionId + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            EmployeeSolarCommissionDetailBean bean = null;
            while (rs.next()) {
                bean = new EmployeeSolarCommissionDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setEmployeeSolarComissionId(rs.getInt("employee_solar_comission_id"));
                bean.setFrom(rs.getDouble("commission_from"));
                bean.setTo(rs.getDouble("commission_to"));
                bean.setCommission(rs.getDouble("commission"));
                detailList.add(bean);
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return detailList;
    }

    public EmployeeSolarCommissionBean getEmployeeSolarCommissionByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee_solar_commission where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeSolarCommissionBean bean = new EmployeeSolarCommissionBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                return bean;
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return null;
    }

    public int insertEmployeeSolarCommission(EmployeeSolarCommissionBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "Insert Into employee_solar_commission(name, note, code) Values ('" + bean.getName() + "','" + bean.getNote() + "','" + bean.getCode() + "')";
            return DBUtil.executeInsert(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public void updateEmployeeSolarCommission(EmployeeSolarCommissionBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update employee_solar_commission Set "
                    + " name='" + bean.getName() + "'"
                    + ", note='" + bean.getNote() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public void deleteEmployeeSolarCommission(String ids) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteEmployeeSolarCommission(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_ids", ids);
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int insertEmployeeSolarCommissionDetail(EmployeeSolarCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertEmployeeSolarCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_employee_solar_commission_id", bean.getEmployeeSolarComissionId());
                spUtil.getCallableStatement().setDouble("_commission_from", bean.getFrom());
                spUtil.getCallableStatement().setDouble("_commission_to", bean.getTo());
                spUtil.getCallableStatement().setDouble("_commission", bean.getCommission());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
        return result;
    }

    public void updateEmployeeSolarCommissionDetail(EmployeeSolarCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateEmployeeSolarCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setDouble("_commission_from", bean.getFrom());
                spUtil.getCallableStatement().setDouble("_commission_to", bean.getTo());
                spUtil.getCallableStatement().setDouble("_commission", bean.getCommission());
                spUtil.execute();
            }
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
                if (spUtil != null) {
                    spUtil.closeConnection();
                }
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public int deleteEmployeeSolarCommissionDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_solar_commission_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
}
