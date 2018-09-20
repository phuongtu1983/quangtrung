/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class VendorDAO extends BasicDAO {

    public ArrayList getVendors(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select v.*, o.name as organization_name from vendor as v, organization as o where v.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and v.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and v.organization_id in(" + organizationIds + ")";
        }
        sql += " order by v.name desc";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorFormBean bean = null;
            while (rs.next()) {
                bean = new VendorFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                vendorList.add(bean);
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
        return vendorList;
    }

    public ArrayList getVendors(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select v.*, o.name as organization_name from vendor as v, organization as o"
                + " where v.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and v.organization_id in (" + organizationIds + ")";
        }
        sql += " order by v.name desc";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorFormBean bean = null;
            while (rs.next()) {
                bean = new VendorFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                vendorList.add(bean);
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
        return vendorList;
    }

    public VendorFormBean getVendor(int vendorId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vendor where id=" + vendorId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorFormBean vendor = new VendorFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setCode(rs.getString("code"));
                vendor.setName(rs.getString("name"));
                vendor.setStatus(rs.getInt("status"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                if (vendor.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    vendor.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (vendor.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    vendor.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                return vendor;
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

    public VendorFormBean getVendorByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vendor where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorFormBean employee = new VendorFormBean();
                employee.setId(rs.getInt("id"));
                employee.setName(rs.getString("name"));
                employee.setCode(rs.getString("code"));
                employee.setOrganizationId(rs.getInt("organization_id"));
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

    public int insertVendor(VendorBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "";
            sql = "Insert Into vendor (name, code, organization_id, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getOrganizationId() + "," + bean.getStatus() + ")";
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

    public void updateVendor(VendorBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update vendor Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
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
