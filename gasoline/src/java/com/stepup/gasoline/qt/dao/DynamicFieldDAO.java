/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.bean.DynamicFieldValueBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldFormBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class DynamicFieldDAO extends BasicDAO {

    public ArrayList getDynamicFields(String tableName) throws Exception {
        ResultSet rs = null;
        String sql = "select d.*, o.name as organization_name"
                + " from dynamic_field as d, organization as o where d.organization_id=o.id and d.table_name='" + tableName + "'"
                + " and o.status=" + EmployeeBean.STATUS_ACTIVE;
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            DynamicFieldFormBean bean = null;
            while (rs.next()) {
                bean = new DynamicFieldFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setTableName(tableName);
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

    public DynamicFieldFormBean getDynamicField(int fieldId) throws Exception {
        ResultSet rs = null;
        String sql = "select d.* from dynamic_field as d where d.id=" + fieldId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                DynamicFieldFormBean bean = new DynamicFieldFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setTableName(rs.getString("table_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
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

    public DynamicFieldFormBean getDynamicFieldByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select d.* from dynamic_field as d where d.name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                DynamicFieldFormBean bean = new DynamicFieldFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setTableName(rs.getString("table_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
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

    public void insertDynamicField(DynamicFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into dynamic_field (name, table_name, organization_id)"
                    + " Values ('" + bean.getName() + "','" + bean.getTableName() + "'," + bean.getOrganizationId() + ")";
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

    public void updateDynamicField(DynamicFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update dynamic_field Set "
                    + " name='" + bean.getName() + "'"
                    + ", organization_id=" + bean.getOrganizationId()
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

    public int deletePermission(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From dynamic_field_value Where field_id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
            sql = "Delete From dynamic_field Where id in (" + ids + ")";
            result = DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getDynamicFieldValues(int parentId, String tableName, int organizationId) throws Exception {
        ResultSet rs = null;
        String sql = "";
        if (parentId > 0) {
            sql = "select v.id, v.field_id, d.name, v.value"
                    + " from dynamic_field as d, dynamic_field_value as v"
                    + " where d.id=v.field_id and d.table_name='" + tableName + "' and d.organization_id=" + organizationId;
        } else {
            sql = "select 0 as id, d.id as field_id, d.name, '' as value"
                    + " from dynamic_field as d where d.table_name='" + tableName + "' and d.organization_id=" + organizationId;
        }

        sql += " order by d.name";
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

    public void insertDynamicFieldValue(DynamicFieldValueBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into dynamic_field_value (value, field_id, parent_id)"
                    + " Values ('" + bean.getValue() + "'," + bean.getFieldId() + "," + bean.getParentId() + ")";
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

    public void updateDynamicFieldValue(DynamicFieldValueBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update dynamic_field_value Set "
                    + " value='" + bean.getValue() + "'"
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
