/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.bean.VendorOrganizationBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import com.stepup.gasoline.qt.vendororganization.VendorOrganizationFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
        String sql = "select v.*, o.name as organization_name from vendor_organization AS vo, vendor as v, organization as o"
                + " where vo.vendor_id=v.id AND vo.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and vo.organization_id in (" + organizationIds + ")";
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
                vendor.setEqualOrganizationId(rs.getInt("equal_organization_id"));
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
                VendorFormBean vendor = new VendorFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setName(rs.getString("name"));
                vendor.setCode(rs.getString("code"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setEqualOrganizationId(rs.getInt("equal_organization_id"));
                vendor.setStatus(rs.getInt("status"));
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

    public int insertVendor(VendorBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVendor(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_name", bean.getName());
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
                spUtil.getCallableStatement().setInt("_equal_organization_id", bean.getEqualOrganizationId());
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

    public void updateVendor(VendorBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVendor(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_name", bean.getName());
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
                spUtil.getCallableStatement().setInt("_equal_organization_id", bean.getEqualOrganizationId());
                spUtil.getCallableStatement().setInt("_id", bean.getId());
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

    public VendorOrganizationFormBean getVendorOrganization(int vendorOrganizationId) throws Exception {
        ResultSet rs = null;
        String sql = "select vo.*, v.name as vendor_name, o.name as organization_name "
                + " from vendor_organization as vo, vendor as v, organization as o where vo.vendor_id=v.id and vo.organization_id=o.id and vo.id=" + vendorOrganizationId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorOrganizationFormBean vendor = new VendorOrganizationFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setOrganizationName(rs.getString("organization_name"));
                vendor.setVendorId(rs.getInt("vendor_id"));
                vendor.setVendorName(rs.getString("vendor_name"));
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

    public ArrayList getVendorsForConnect(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT v.id, CONCAT(v.NAME,' - ',o.NAME) AS NAME FROM vendor AS v, organization AS o"
                + " where v.organization_id=o.id and v.status=" + EmployeeBean.STATUS_ACTIVE
                + " and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!organizationIds.isEmpty()) {
            sql += " and v.equal_organization_id NOT IN (" + organizationIds + ") AND o.id NOT IN(" + organizationIds + ")";
        }
        sql += " AND NOT EXISTS (SELECT vendor_id, organization_id FROM vendor_organization WHERE vendor_id=v.id";
        if (!organizationIds.isEmpty()) {
            sql += " AND organization_id IN (" + organizationIds + ")";
        }

        sql += ") order by v.name desc";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorFormBean bean = null;
            while (rs.next()) {
                bean = new VendorFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public ArrayList getVendorOrganizations(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT vo.id, o.NAME AS organization_name, CONCAT(v.NAME,' - ',ot.NAME) AS vendor_name"
                + " FROM vendor_organization AS vo, vendor AS v, organization AS o, organization AS ot"
                + " WHERE vo.vendor_id=v.id AND vo.organization_id=o.id AND v.organization_id=ot.id"
                + " and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!organizationIds.isEmpty()) {
            sql += " and v.organization_id not in(" + organizationIds + ") AND v.equal_organization_id NOT IN (" + organizationIds + ") and vo.organization_id IN (" + organizationIds + ")";
        }
        sql += " order by v.name desc";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorOrganizationFormBean bean = null;
            while (rs.next()) {
                bean = new VendorOrganizationFormBean();
                bean.setId(rs.getInt("id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setVendorName(rs.getString("vendor_name"));
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

    public int insertVendorOrganization(VendorOrganizationBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVendorOrganization(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_id", bean.getId());
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

    public int deleteVendorOrganization(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vendor_organization Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public String getVendorOfOrganizations(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT v.id"
                + " FROM vendor AS v"
                + " WHERE v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!organizationIds.isEmpty()) {
            sql += " and v.equal_organization_id in(" + organizationIds + ")";
        }
        String result = "0,";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                result += rs.getInt("id") + ",";
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
        return result + "0";
    }
}
