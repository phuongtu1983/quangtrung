/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.bean.PermissionDetailBean;
import com.stepup.gasoline.qt.permission.ApplicationPermissionBean;
import com.stepup.gasoline.qt.util.SQLSearchExpressionUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class PermissionDAO extends BasicDAO {

    public ArrayList<ApplicationPermissionBean> getPermissionsOfEmployee(int empId) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT p.id, p.NAME, CONCAT(',',p.users,',') users, det.function, det.operation"
                + " from permission_detail as det, permission as p where det.permission_id=p.id ";
        if (empId > 0) {
            sql += " AND CONCAT(',',p.users,',') LIKE CONCAT('%,'," + empId + ",',%')";
        }

        ArrayList<ApplicationPermissionBean> permissionList = new ArrayList<ApplicationPermissionBean>();
        try {
            rs = DBUtil.executeQuery(sql);
            ApplicationPermissionBean bean = null;
            while (rs.next()) {
                bean = new ApplicationPermissionBean();
                bean.setPerId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUsers(rs.getString("users"));
                bean.setFunction(rs.getString("function"));
                bean.setOperation(rs.getInt("operation"));
                permissionList.add(bean);
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
        return permissionList;
    }

    public String getOrganizationManagedOfEmployee(int empId) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT GROUP_CONCAT('0,',p.organizations,',0') organizations FROM permission AS p where 1 ";
        if (empId > 0) {
            sql += " AND CONCAT(',',p.users,',') LIKE CONCAT('%,'," + empId + ",',%')";
        }
        String result = "";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                result = rs.getString("organizations");
                break;
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

    public PermissionBean getPermission(int id) throws Exception {
        ResultSet rs = null;
        String sql = "Select * from permission Where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PermissionBean permission = new PermissionBean();
                permission.setId(rs.getInt("id"));
                permission.setName(rs.getString("name"));
                permission.setNote(rs.getString("note"));
                permission.setUsers(rs.getString("users"));
                return permission;
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

    public ArrayList getPermissionDetails(int perId) throws Exception {
        ResultSet rs = null;
        String sql = "Select * From permission_detail Where permission_id=" + perId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PermissionDetailBean detail = null;
            while (rs.next()) {
                detail = new PermissionDetailBean();
                detail.setId(rs.getInt("id"));
                detail.setPerId(rs.getInt("permission_id"));
                detail.setFunction(rs.getString("function"));
                detail.setOperation(rs.getInt("operation"));
                detailList.add(detail);
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

    public ArrayList getPermissionEmp(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select users from permission where id=" + id;
        ArrayList empList = new ArrayList();
        try {
            String users = "";
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                users = rs.getString("users");
            }
            DBUtil.closeConnection(rs);
            if (!GenericValidator.isBlankOrNull(users)) {
                sql = "select e.id, u.id as user_id, e.fullname from employee as e, user as u where e.id=u.employee_id and u.id in (" + users + ")";
                rs = DBUtil.executeQuery(sql);
                EmployeeBean emp = null;
                while (rs.next()) {
                    emp = new EmployeeBean();
                    emp.setId(rs.getInt("id"));
                    emp.setUserId(rs.getInt("user_id"));
                    emp.setFullname(rs.getString("fullname"));
                    empList.add(emp);
                }
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
        return empList;
    }
    
    public ArrayList getPermissionOrg(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select organizations from permission where id=" + id;
        ArrayList orgList = new ArrayList();
        try {
            String organizations = "";
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                organizations = rs.getString("organizations");
            }
            DBUtil.closeConnection(rs);
            if (!GenericValidator.isBlankOrNull(organizations)) {
                sql = "select id, name from organization where id in (" + organizations + ")";
                rs = DBUtil.executeQuery(sql);
                OrganizationBean org = null;
                while (rs.next()) {
                    org = new OrganizationBean();
                    org.setId(rs.getInt("id"));
                    org.setName(rs.getString("name"));
                    orgList.add(org);
                }
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
        return orgList;
    }

    public PermissionBean getPermissionByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "Select id From permission Where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PermissionBean permission = new PermissionBean();
                permission.setId(rs.getInt("id"));
                return permission;
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

    public int insertPermission(PermissionBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        try {
            String sql = "";
            sql = "Insert Into permission (name, users, organizations,  note)"
                    + " Values ('" + bean.getName() + "','" + bean.getUsers() + "','" + bean.getOrganizations() + "','" + bean.getNote() + "')";
            result = DBUtil.executeInsert(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void updatePermission(PermissionBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update permission Set "
                    + " name='" + bean.getName() + "'"
                    + ", users='" + bean.getUsers() + "'"
                    + ", organizations='" + bean.getOrganizations() + "'"
                    + ", note='" + bean.getNote() + "'"
                    + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    public int insertPermissionDetail(PermissionDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        try {
            String sql = "";
            sql = "Insert Into permission_detail (permission_id, function, operation)"
                    + " Values (" + bean.getPerId() + ",'" + bean.getFunction() + "'," + bean.getOperation() + ")";
            result = DBUtil.executeInsert(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void updatePermissionDetail(PermissionDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update permission_detail Set function='" + bean.getFunction() + "'"
                    + " Where permission_id=" + bean.getPerId() + " and operation=" + bean.getOperation();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    public ArrayList getPermissions(int user) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT p.*"
                + ", (SELECT GROUP_CONCAT(e.fullname) FROM employee AS e, user AS u"
                + " WHERE e.id=u.employee_id AND CONCAT(',',p.users,',') LIKE CONCAT('%,',u.id,',%') )AS fullname"
                + " FROM permission AS p"
                + " WHERE 1";
        if (user != 0) {
            sql += " AND CONCAT(',',p.users,',') LIKE '%," + user + ",%'";
        }
        sql += " order by p.id desc";
        ArrayList permissionList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PermissionBean permission = null;
            while (rs.next()) {
                permission = new PermissionBean();
                permission.setId(rs.getInt("id"));
                permission.setName(rs.getString("name"));
                permission.setNote(rs.getString("note"));
                permission.setUserNames(rs.getString("fullname"));
                permissionList.add(permission);
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
        return permissionList;
    }

    public int deletePermission(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From permission_detail Where permission_id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
            sql = "Delete From permission Where id in (" + ids + ")";
            result = DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchPermissions(String name) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT p.*"
                + ", (SELECT GROUP_CONCAT(e.fullname) FROM employee AS e, user AS u"
                + " WHERE e.id=u.employee_id AND CONCAT(',',p.users,',') LIKE CONCAT('%,',u.id,',%') )AS fullname"
                + " FROM permission AS p"
                + " WHERE 1";
        if (!StringUtil.isBlankOrNull(name)) {
            sql += " and (" + SQLSearchExpressionUtil.excuteExpression(name, "p.name") + ")";
        }
        sql += " order by p.id desc";
        ArrayList permissionList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PermissionBean permission = null;
            while (rs.next()) {
                permission = new PermissionBean();
                permission.setId(rs.getInt("id"));
                permission.setName(rs.getString("name"));
                permission.setNote(rs.getString("note"));
                permission.setUserNames(rs.getString("fullname"));
                permissionList.add(permission);
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
        return permissionList;
    }
}
