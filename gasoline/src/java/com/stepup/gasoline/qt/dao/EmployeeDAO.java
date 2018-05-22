/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.auth.OnlineUser;
import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.auth.OnlineUserImpl;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class EmployeeDAO {

    public OnlineUser login(String username, String password)
            throws Exception {
        OnlineUserImpl user = null;
        ResultSet rs = null;

        String sql = "select u.id, e.id as empId, e.fullname, u.username, e.email"
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
//
//    public ArrayList searchEmployee(int status) throws Exception {
//        ResultSet rs = null;
//        String sql = "select * from employee where 1";
//        if (status != 0) {
//            sql += " and status=" + status;
//        }
//        sql += " order by id desc";
//        ArrayList employeeList = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EmployeeBean bean = null;
//            while (rs.next()) {
//                bean = new EmployeeBean();
//                bean.setId(rs.getInt("id"));
//                bean.setFullname(rs.getString("fullname"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setEmail(rs.getString("email"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                employeeList.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return employeeList;
//    }

    public EmployeeBean getEmployee(int empId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from employee where id=" + empId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                EmployeeBean employee = new EmployeeBean();
                employee.setId(rs.getInt("id"));
                employee.setFullname(rs.getString("fullname"));
                employee.setEmail(rs.getString("email"));
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

//    public EmployeeBean getEmployeeByNameOrEmail(String fullname, String email) throws Exception {
//        ResultSet rs = null;
//        String sql = "select * from employee where fullname='" + fullname + "' or email='" + email + "'";
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                EmployeeBean employee = new EmployeeBean();
//                employee.setId(rs.getInt("id"));
//                employee.setFullname(rs.getString("fullname"));
//                employee.setEmail(rs.getString("email"));
//                employee.setStatus(rs.getInt("status"));
//                return employee;
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return null;
//    }
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
            EmployeeBean bean = null;
            while (rs.next()) {
                bean = new EmployeeBean();
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

//    public ArrayList getEmployees(int status) throws Exception {
//        ResultSet rs = null;
//        String sql = "select * from employee where 1";
//        if (status != 0) {
//            sql += " and status=" + status;
//        }
//        sql += " order by id desc";
//        ArrayList employeeList = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EmployeeBean bean = null;
//            while (rs.next()) {
//                bean = new EmployeeBean();
//                bean.setId(rs.getInt("id"));
//                bean.setFullname(rs.getString("fullname"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setEmail(rs.getString("email"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                employeeList.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return employeeList;
//    }
//
//    public EmployeeBean getEmployeeByUserID(int userId) throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT * FROM employee AS e, USER AS u WHERE e.id=u.emp_id AND u.id=" + userId + " LIMIT 1";
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                EmployeeBean employee = new EmployeeBean();
//                employee.setId(rs.getInt("id"));
//                employee.setFullname(rs.getString("fullname"));
//                employee.setEmail(rs.getString("email"));
//                employee.setStatus(rs.getInt("status"));
//                if (employee.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    employee.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (employee.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    employee.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                return employee;
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return null;
//    }
}
