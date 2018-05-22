/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.UserBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class UserDAO {

    public ArrayList getUsers(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select u.*, e.fullname from user as u, employee as e where u.employee_id=e.id";
        if (status != 0) {
            sql += " and u.status=" + status;
        }
        sql += " order by e.fullname";

        ArrayList userList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            UserBean bean = null;
            while (rs.next()) {
                bean = new UserBean();
                bean.setId(rs.getInt("id"));
                bean.setEmpId(rs.getInt("employee_id"));
                bean.setFullname(rs.getString("fullname"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                userList.add(bean);
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
        return userList;
    }

//    public Object isExistMember(String userName, String email) throws Exception {
//        ResultSet rs = null;
//        String sql = "select u.id, u.emp_id, e.fullname, u.password"
//                + " from user u, employee e"
//                + " where u.emp_id=e.id and u.username='" + userName + "' and e.email='" + email + "'";
//        try {
//            rs = DBUtil.executeQuery(sql);
//            UserBean employee = null;
//            while (rs.next()) {
//                employee = new UserBean();
//                employee.setId(rs.getInt("id"));
//                employee.setEmpId(rs.getInt("emp_id"));
//                employee.setFullname(rs.getString("fullname"));
//                employee.setPassword(rs.getString("password"));
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
    public int changePassword(int userId, String newPassword)
            throws Exception {
        int result = 0;
        try {
            String sql = "update user set password='" + newPassword + "'"
                    + " where id=" + userId;
            //System.out.println("sql=" + sql);
            result = DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

//    public int changePassword(String username, String password, String newPassword)
//            throws Exception {
//        int result = 0;
//        try {
//            String sql = "update user set password='" + newPassword + "'"
//                    + " where username='" + username + "'"
//                    + " and password='" + password + "'";
//            //System.out.println("sql=" + sql);
//            result = DBUtil.executeUpdate(sql);
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        }
//        return result;
//    }
    public UserBean getUser(int userId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from user where id=" + userId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UserBean user = new UserBean();
                user.setId(rs.getInt("id"));
                user.setEmpId(rs.getInt("employee_id"));
                user.setStatus(rs.getInt("status"));
                user.setUsername(rs.getString("username"));
//                if (user.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    user.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (user.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    user.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
                return user;
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

    public UserBean getUserByName(String username) throws Exception {
        ResultSet rs = null;
        String sql = "select u.*, e.fullname from user as u, employee as e where e.id=u.employee_id and u.username='" + username + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UserBean user = new UserBean();
                user.setId(rs.getInt("id"));
                user.setEmpId(rs.getInt("employee_id"));
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname"));
                user.setStatus(rs.getInt("status"));
                return user;
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

    public void insertUser(UserBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into user(employee_id, username, password, status)"
                    + " Values (" + bean.getEmpId() + ",'" + bean.getUsername() + "','" + bean.getPassword() + "'," + bean.getStatus() + ")";
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

    public void updateUser(UserBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update user Set "
                    + " username='" + bean.getUsername() + "'"
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

    public void updateUserMenu(int userId, String menu) throws Exception {
        try {
            String sql = "Update user Set menu='" + menu + "' Where id=" + userId;
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

    public String getUserMenu(int userId) throws Exception {
        ResultSet rs = null;
        String result = "";
        try {
            String sql = "select menu from user where id=" + userId;
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                result = rs.getString("menu");
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
        return result;
    }
}
