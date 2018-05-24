/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.auth.OnlineUser;
import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.auth.OnlineUserImpl;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class EmployeeDAO extends BasicDAO{

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
        String sql = "select * from employee where id=" + empId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeFormBean employee = new EmployeeFormBean();
                employee.setId(rs.getInt("id"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
                employee.setSalary(rs.getDouble("salary"));
                employee.setOrganizationId(rs.getInt("organization_id"));
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

    public ArrayList getEmployees(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select e.*, o.name as organization_name from employee as e, organization as o where e.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and e.status=" + status;
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
            String sql = "";
            sql = "Insert Into employee (fullname, email, salary, organization_id, status)"
                    + " Values ('" + bean.getFullname() + "','" + bean.getEmail() + "'," + bean.getSalary() + "," + bean.getOrganizationId() + "," + bean.getStatus() + ")";
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
            String sql = "Update employee Set "
                    + " fullname='" + bean.getFullname() + "'"
                    + ", email='" + bean.getEmail() + "'"
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

}
