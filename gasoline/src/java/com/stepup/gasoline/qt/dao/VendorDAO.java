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
import com.stepup.gasoline.qt.bean.GasReturnVendorBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.bean.VendorCustomerBean;
import com.stepup.gasoline.qt.bean.VendorOilStoreDetailBean;
import com.stepup.gasoline.qt.bean.VendorOrganizationBean;
import com.stepup.gasoline.qt.bean.VendorSolarStoreDetailBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.GasReturnVendorFormBean;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import com.stepup.gasoline.qt.vendorcustomer.VendorCustomerFormBean;
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
        String sql = "select v.*, o.name as organization_name"
                + " from vendor_organization AS vo, vendor AS v, organization AS o"
                + " where vo.vendor_id=v.id AND vo.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and v.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and vo.organization_id in(" + organizationIds + ")";
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

    public ArrayList getVendors(String organizationIds, String vendorKinds) throws Exception {
        ResultSet rs = null;
        String sql = "select v.*, o.name as organization_name from vendor_organization AS vo, vendor as v, organization as o"
                + " where vo.vendor_id=v.id AND vo.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and vo.organization_id in (" + organizationIds + ")";
        }

        vendorKinds = "0," + vendorKinds + ",0";

        if (vendorKinds.indexOf("," + VendorBean.IS_GAS + ",") > -1) {
            sql += " and v.is_gas=1";
        } else if (vendorKinds.indexOf("," + VendorBean.IS_PETRO + ",") > -1) {
            sql += " and v.is_petro=1";
        } else if (vendorKinds.indexOf("," + VendorBean.IS_GOOD + ",") > -1) {
            sql += " and v.is_good=1";
        } else if (vendorKinds.indexOf("," + VendorBean.IS_TRANSPORT + ",") > -1) {
            sql += " and v.is_transport=1";
        } else if (vendorKinds.indexOf("," + VendorBean.IS_OIL + ",") > -1) {
            sql += " and v.is_oil=1";
        } else if (vendorKinds.indexOf("," + VendorBean.IS_SOLAR + ",") > -1) {
            sql += " and v.is_solar=1";
        } else {
            sql += " and (v.is_gas=1 or v.is_petro=1 or v.is_good=1 or v.is_transport=1 or v.is_oil=1 or v.is_solar=1)";
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
                bean.setCommissionOnImport(rs.getFloat("commision_on_import"));
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

    public ArrayList getVendorHasStocks(String organizationIds, int vendorKind) throws Exception {
        ResultSet rs = null;
        String sql = "select v.*, o.name as organization_name from vendor_organization AS vo, vendor as v, organization as o"
                + " where vo.vendor_id=v.id and v.has_stock=1 AND vo.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and vo.organization_id in (" + organizationIds + ")";
        }
        switch (vendorKind) {
            case VendorBean.IS_GAS:
                sql += " and v.is_gas=1";
                break;
            case VendorBean.IS_PETRO:
                sql += " and v.is_petro=1";
                break;
            case VendorBean.IS_GOOD:
                sql += " and v.is_good=1";
                break;
            case VendorBean.IS_TRANSPORT:
                sql += " and v.is_transport=1";
                break;
            case VendorBean.IS_OIL:
                sql += " and v.is_oil=1";
                break;
            case VendorBean.IS_SOLAR:
                sql += " and v.is_solar=1";
                break;
            default:
                sql += " and v.is_gas=1 and v.is_petro=1 and v.is_good=1 and v.is_transport=1 and v.is_oil=1 and v.is_solar=1";
                break;
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
                vendor.setAddress(rs.getString("address"));
                vendor.setTax(rs.getString("tax"));
                vendor.setPhone(rs.getString("phone"));
                vendor.setFax(rs.getString("fax"));
                vendor.setStatus(rs.getInt("status"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setEqualOrganizationId(rs.getInt("equal_organization_id"));
                vendor.setCommissionOnImport(rs.getFloat("commision_on_import"));
                vendor.setMaxDebt(rs.getDouble("max_debt"));
                vendor.setHasStock(rs.getInt("has_stock") == 1 ? true : false);
                vendor.setIsGas(rs.getInt("is_gas") == 1 ? true : false);
                vendor.setIsPetro(rs.getInt("is_petro") == 1 ? true : false);
                vendor.setIsGood(rs.getInt("is_good") == 1 ? true : false);
                vendor.setIsTransport(rs.getInt("is_transport") == 1 ? true : false);
                vendor.setIsOil(rs.getInt("is_oil") == 1 ? true : false);
                vendor.setIsSolar(rs.getInt("is_solar") == 1 ? true : false);
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

    public VendorFormBean getVendorByName(String name, int organizatoinId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vendor where name='" + name + "' and organization_id=" + organizatoinId + " and status=" + EmployeeBean.STATUS_ACTIVE;
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
                vendor.setCommissionOnImport(rs.getFloat("commision_on_import"));
                vendor.setMaxDebt(rs.getDouble("max_debt"));
                vendor.setHasStock(rs.getInt("has_stock") == 1 ? true : false);
                vendor.setIsGas(rs.getInt("is_gas") == 1 ? true : false);
                vendor.setIsPetro(rs.getInt("is_petro") == 1 ? true : false);
                vendor.setIsGood(rs.getInt("is_good") == 1 ? true : false);
                vendor.setIsTransport(rs.getInt("is_transport") == 1 ? true : false);
                vendor.setIsOil(rs.getInt("is_oil") == 1 ? true : false);
                vendor.setIsSolar(rs.getInt("is_solar") == 1 ? true : false);
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
            String sql = "{call insertVendor(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_name", bean.getName());
                spUtil.getCallableStatement().setString("_address", bean.getAddress());
                spUtil.getCallableStatement().setString("_tax", bean.getTax());
                spUtil.getCallableStatement().setString("_phone", bean.getPhone());
                spUtil.getCallableStatement().setString("_fax", bean.getFax());
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
                spUtil.getCallableStatement().setInt("_equal_organization_id", bean.getEqualOrganizationId());
                spUtil.getCallableStatement().setFloat("_commision_on_import", bean.getCommissionOnImport());
                spUtil.getCallableStatement().setDouble("_max_debt", bean.getMaxDebt());
                spUtil.getCallableStatement().setInt("_has_stock", bean.getHasStock());
                spUtil.getCallableStatement().setInt("_is_gas", bean.getIsGas());
                spUtil.getCallableStatement().setInt("_is_petro", bean.getIsPetro());
                spUtil.getCallableStatement().setInt("_is_good", bean.getIsGood());
                spUtil.getCallableStatement().setInt("_is_transport", bean.getIsTransport());
                spUtil.getCallableStatement().setInt("_is_oil", bean.getIsOil());
                spUtil.getCallableStatement().setInt("_is_solar", bean.getIsSolar());
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
            String sql = "{call updateVendor(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_name", bean.getName());
                spUtil.getCallableStatement().setString("_address", bean.getAddress());
                spUtil.getCallableStatement().setString("_tax", bean.getTax());
                spUtil.getCallableStatement().setString("_phone", bean.getPhone());
                spUtil.getCallableStatement().setString("_fax", bean.getFax());
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
                spUtil.getCallableStatement().setInt("_equal_organization_id", bean.getEqualOrganizationId());
                spUtil.getCallableStatement().setInt("_has_stock", bean.getHasStock());
                spUtil.getCallableStatement().setInt("_is_gas", bean.getIsGas());
                spUtil.getCallableStatement().setInt("_is_petro", bean.getIsPetro());
                spUtil.getCallableStatement().setInt("_is_good", bean.getIsGood());
                spUtil.getCallableStatement().setInt("_is_transport", bean.getIsTransport());
                spUtil.getCallableStatement().setInt("_is_oil", bean.getIsOil());
                spUtil.getCallableStatement().setInt("_is_solar", bean.getIsSolar());
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

    public void updateVendorOil(VendorBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVendorOil(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setFloat("_commision_on_import", bean.getCommissionOnImport());
                spUtil.getCallableStatement().setDouble("_max_debt", bean.getMaxDebt());
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

    public ArrayList getVendorOilStoreDetail(int vendorId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as store_name"
                + " from vendor_oil_store as det, store as s"
                + " where det.store_id=s.id and det.vendor_id=" + vendorId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorOilStoreDetailBean bean = null;
            while (rs.next()) {
                bean = new VendorOilStoreDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setStoreName(rs.getString("store_name"));
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

    public int insertVendorOiStoreDetail(VendorOilStoreDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVendorOiStoreDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
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

    public int deleteVendorOilStoreDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vendor_oil_store Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public GasReturnVendorFormBean getGasReturnVendor(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select * from gas_return_vendor where " + organizationIds + " LIKE CONCAT('%,',organization_id,',%') limit 1";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasReturnVendorFormBean vendor = new GasReturnVendorFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setVendorId(rs.getInt("vendor_id"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
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

    public int insertGasReturnVendor(GasReturnVendorBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasReturnVendor(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
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

    public VendorOrganizationFormBean getVendorOrganization(int vendorOrganizationId) throws Exception {
        ResultSet rs = null;
        String sql = "select vo.*, v.name as vendor_name, o.name as organization_name, ot.name as link_organization_name"
                + " from vendor_organization as vo, vendor as v, organization as o, organization AS ot"
                + " where vo.vendor_id=v.id and vo.organization_id=o.id and v.organization_id=ot.id and vo.id=" + vendorOrganizationId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorOrganizationFormBean vendor = new VendorOrganizationFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setOrganizationName(rs.getString("organization_name"));
                vendor.setLinkOrganizationName(rs.getString("link_organization_name"));
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
        String sql = "select vo.vendor_id from vendor_organization AS vo, vendor as v, organization as o"
                + " where vo.vendor_id=v.id AND vo.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and v.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and vo.organization_id in (" + organizationIds + ")";
        }
        String result = "0,";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                result += rs.getInt("vendor_id") + ",";
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

    public VendorFormBean getVendorEqualOrganization(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vendor where equal_organization_id in(" + organizationIds + ")";
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
                vendor.setHasStock(rs.getInt("has_stock") == 1 ? true : false);
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

    public ArrayList getVendorEqualOrganizations() throws Exception {
        ResultSet rs = null;
        String sql = "select distinct id, organization_id, name from vendor where equal_organization_id<>-1";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorOrganizationFormBean bean = null;
            while (rs.next()) {
                bean = new VendorOrganizationFormBean();
                bean.setId(rs.getInt("id"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setVendorName(rs.getString("name"));
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

    public int insertVendorCustomer(VendorCustomerBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVendorCustomer(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
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

    public int deleteVendorCustomer(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vendor_customer Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getVendorCustomers(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT vc.id, v.name as vendor_name, c.name as customer_name"
                + " FROM vendor_customer AS vc, vendor AS v, customer as c"
                + " WHERE vc.vendor_id=v.id AND vc.customer_id=c.id"
                + " and v.status=" + EmployeeBean.STATUS_ACTIVE + " and c.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!organizationIds.isEmpty()) {
            sql += " and vc.organization_id IN (" + organizationIds + ")";
        }
        sql += " order by v.name desc";
        ArrayList vendorList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorCustomerFormBean bean = null;
            while (rs.next()) {
                bean = new VendorCustomerFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCustomerName(rs.getString("customer_name"));
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

    public VendorCustomerFormBean getVendorCustomer(int vendorCustomerId) throws Exception {
        ResultSet rs = null;
        String sql = "select vc.* from vendor_customer as vc, vendor as v, customer as c where vc.vendor_id=v.id and vc.customer_id=c.id and vc.id=" + vendorCustomerId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorCustomerFormBean vendor = new VendorCustomerFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setVendorId(rs.getInt("vendor_id"));
                vendor.setCustomerId(rs.getInt("customer_id"));
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

    public VendorCustomerFormBean getVendorCustomerByCustomer(int customerId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vendor_customer where customer_id=" + customerId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VendorCustomerFormBean vendor = new VendorCustomerFormBean();
                vendor.setId(rs.getInt("id"));
                vendor.setOrganizationId(rs.getInt("organization_id"));
                vendor.setVendorId(rs.getInt("vendor_id"));
                vendor.setCustomerId(rs.getInt("customer_id"));
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

    public void updateVendorSolar(VendorBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVendorSolar(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setFloat("_commision_on_import", bean.getCommissionOnImport());
                spUtil.getCallableStatement().setDouble("_max_debt", bean.getMaxDebt());
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

    public ArrayList getVendorSolarStoreDetail(int vendorId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as store_name"
                + " from vendor_solar_store as det, store as s"
                + " where det.store_id=s.id and det.vendor_id=" + vendorId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VendorSolarStoreDetailBean bean = null;
            while (rs.next()) {
                bean = new VendorSolarStoreDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setStoreName(rs.getString("store_name"));
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

    public int insertVendorOiStoreDetail(VendorSolarStoreDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVendorSolarStoreDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
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

    public int deleteVendorSolarStoreDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vendor_solar_store Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

}
