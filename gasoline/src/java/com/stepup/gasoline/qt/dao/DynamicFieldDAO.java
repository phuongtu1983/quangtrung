/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.DynamicFieldBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldFormBean;
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
                + " from dynamic_field as d, organization as o where d.organization_id=o.id and d.table_name='" + tableName + "'";
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

}
