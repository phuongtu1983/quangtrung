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
import com.stepup.gasoline.qt.bean.EmployeeAdvanceBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.EmployeeOffBean;
import com.stepup.gasoline.qt.bean.EmployeeOffIncreaseBean;
import com.stepup.gasoline.qt.bean.EmployeeOffMoneyBean;
import com.stepup.gasoline.qt.bean.EmployeeSalaryFieldBean;
import com.stepup.gasoline.qt.bean.EmployeeTimesheetBean;
import com.stepup.gasoline.qt.bean.SalaryBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.employeeadvance.EmployeeAdvanceFormBean;
import com.stepup.gasoline.qt.employeeoff.EmployeeOffFormBean;
import com.stepup.gasoline.qt.employeeoffincrease.EmployeeOffIncreaseFormBean;
import com.stepup.gasoline.qt.employeeoffmoney.EmployeeOffMoneyFormBean;
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
        String sql = "select e.*, o.name as organization_name from employee as e, organization as o where e.organization_id=o.id and e.id=" + empId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeFormBean employee = new EmployeeFormBean();
                employee.setId(rs.getInt("id"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
                employee.setSalary(rs.getDouble("salary"));
                employee.setOrganizationId(rs.getInt("organization_id"));
                employee.setOrganizationName(rs.getString("organization_name"));
                employee.setBirthday(DateUtil.formatDate(rs.getDate("birthday"), "dd/MM/yyyy"));
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

    public EmployeeFormBean getEmployeeByNameOrEmail(String fullname, String email) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee where fullname='" + fullname + "' or email='" + email + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeFormBean employee = new EmployeeFormBean();
                employee.setId(rs.getInt("id"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
                employee.setBirthday(DateUtil.formatDate(rs.getDate("birthday"), "dd/MM/yyyy"));
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

    public ArrayList getEmployeeHasNotAccount(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee where id not in (select employee_id from user)";
        if (status != 0) {
            sql += " and status=" + status;
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

    public int insertEmployee(EmployeeBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String birthday = "";
            if (GenericValidator.isBlankOrNull(bean.getBirthday())) {
                birthday = "null";
            } else {
                birthday = "STR_TO_DATE('" + bean.getBirthday() + "','%d/%m/%Y')";
            }
            String sql = "";
            sql = "Insert Into employee (fullname, email, salary, organization_id, status, birthday)"
                    + " Values ('" + bean.getFullname() + "','" + bean.getEmail() + "'," + bean.getSalary() + "," + bean.getOrganizationId()
                    + "," + bean.getStatus() + "," + birthday + ")";
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
            String birthday = "";
            if (GenericValidator.isBlankOrNull(bean.getBirthday())) {
                birthday = "null";
            } else {
                birthday = "STR_TO_DATE('" + bean.getBirthday() + "','%d/%m/%Y')";
            }
            String sql = "Update employee Set "
                    + " fullname='" + bean.getFullname() + "'"
                    + ", email='" + bean.getEmail() + "'"
                    + ", birthday=" + birthday
                    + ", salary=" + bean.getSalary()
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", status=" + bean.getStatus()
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

    public ArrayList searchEmployeeAdvance(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeAdvance(?,?)}";
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
        String sql = "select * from employee_advance where id=" + id;
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
            String sql = "{call insertEmployeeAdvance(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_advance_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public int deleteEmployeeAdvance(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_advance Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchSalary(String fromDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSalary(?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
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

    public ArrayList searchEmployeeTimesheet(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeTimesheet(?,?)}";
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
            String sql = "{call insertEmployeeTimesheet(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_timesheet_date", createdDate);
                spUtil.getCallableStatement().setInt("_field_id", bean.getFieldId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public ArrayList searchEmployeeOff(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOff(?,?)}";
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
            String sql = "{call insertEmployeeOff(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setString("_from_date", fromDate);
                spUtil.getCallableStatement().setString("_to_date", toDate);
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_actual_off_day", bean.getActualOffDay());
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
                spUtil.getCallableStatement().setInt("_actual_off_day", bean.getActualOffDay());
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

    public int insertSalary(SalaryBean bean) throws Exception {
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
            String sql = "{call insertSalary(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_month_day", bean.getMonthDay());
                spUtil.getCallableStatement().setDouble("_basic_salary", bean.getBasicSalary());
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

    public ArrayList searchEmployeeOffIncrease(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOffIncrease(?,?)}";
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
            String sql = "{call insertEmployeeOffIncrease(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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
            String sql = "{call updateEmployeeOffIncrease(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
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

    public ArrayList searchEmployeeOffMoney(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchEmployeeOffMoney(?,?)}";
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

    public int deleteEmployeeOffMoney(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From employee_off_money Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
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
            String sql = "{call insertEmployeeOffMoney(?,?,?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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

}
