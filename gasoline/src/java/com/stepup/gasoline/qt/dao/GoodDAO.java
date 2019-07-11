/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.accessory.AccessoryFormBean;
import com.stepup.gasoline.qt.accessoryimport.AccessoryImportFormBean;
import com.stepup.gasoline.qt.accessorykind.AccessoryKindFormBean;
import com.stepup.gasoline.qt.bean.AccessoryBean;
import com.stepup.gasoline.qt.bean.AccessoryImportBean;
import com.stepup.gasoline.qt.bean.AccessoryImportDetailBean;
import com.stepup.gasoline.qt.bean.AccessoryKindBean;
import com.stepup.gasoline.qt.bean.OilGroupBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.GoodBean;
import com.stepup.gasoline.qt.bean.GoodImportBean;
import com.stepup.gasoline.qt.bean.GoodImportDetailBean;
import com.stepup.gasoline.qt.bean.OilBean;
import com.stepup.gasoline.qt.bean.OilExportBean;
import com.stepup.gasoline.qt.bean.OilExportDetailBean;
import com.stepup.gasoline.qt.bean.OilImportBean;
import com.stepup.gasoline.qt.bean.OilImportDetailBean;
import com.stepup.gasoline.qt.bean.PetroBean;
import com.stepup.gasoline.qt.bean.PromotionMaterialBean;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportBean;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportDetailBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryChangeDetailBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryDetailBean;
import com.stepup.gasoline.qt.bean.SaleGoodBean;
import com.stepup.gasoline.qt.bean.SaleGoodDetailBean;
import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.bean.SaleOilDetailBean;
import com.stepup.gasoline.qt.bean.SaleOilPromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnDetailBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnStoreBean;
import com.stepup.gasoline.qt.bean.SalePetroBean;
import com.stepup.gasoline.qt.bean.SalePetroDetailBean;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.bean.ShellImportBean;
import com.stepup.gasoline.qt.bean.ShellKindBean;
import com.stepup.gasoline.qt.bean.ShellVendorDetailBean;
import com.stepup.gasoline.qt.bean.ShieldDecreaseBean;
import com.stepup.gasoline.qt.bean.ShieldImportBean;
import com.stepup.gasoline.qt.bean.UnitBean;
import com.stepup.gasoline.qt.good.GoodFormBean;
import com.stepup.gasoline.qt.goodimport.GoodImportFormBean;
import com.stepup.gasoline.qt.oil.OilFormBean;
import com.stepup.gasoline.qt.oilexport.OilExportFormBean;
import com.stepup.gasoline.qt.oilgroup.OilGroupFormBean;
import com.stepup.gasoline.qt.oilimport.OilImportFormBean;
import com.stepup.gasoline.qt.petro.PetroFormBean;
import com.stepup.gasoline.qt.promotionmaterial.PromotionMaterialFormBean;
import com.stepup.gasoline.qt.promotionmaterialimport.PromotionMaterialImportFormBean;
import com.stepup.gasoline.qt.saleaccessory.SaleAccessoryFormBean;
import com.stepup.gasoline.qt.salegood.SaleGoodFormBean;
import com.stepup.gasoline.qt.saleoil.SaleOilFormBean;
import com.stepup.gasoline.qt.salepetro.SalePetroFormBean;
import com.stepup.gasoline.qt.shell.ShellFormBean;
import com.stepup.gasoline.qt.shellimport.ShellImportFormBean;
import com.stepup.gasoline.qt.shellkind.ShellKindFormBean;
import com.stepup.gasoline.qt.shielddecrease.ShieldDecreaseFormBean;
import com.stepup.gasoline.qt.shieldimport.ShieldImportFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import org.apache.commons.validator.GenericValidator;

/**
 *
 * @author Administrator
 */
public class GoodDAO extends BasicDAO {
    
    public ArrayList getShellKinds(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from shell_kind where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ShellKindFormBean bean = null;
            while (rs.next()) {
                bean = new ShellKindFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setWeight(rs.getInt("weight"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public ShellKindBean getShellKind(int kindId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from shell_kind where id=" + kindId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellKindBean bean = new ShellKindBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setWeight(rs.getInt("weight"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
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
    
    public ShellKindBean getShellKindByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from shell_kind where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellKindBean bean = new ShellKindBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setWeight(rs.getInt("weight"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertShellKind(ShellKindBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into shell_kind (name, code, weight, commission, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getWeight() + "," + bean.getCommission() + "," + bean.getStatus() + ")";
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
    
    public void updateShellKind(ShellKindBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update shell_kind Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + ", weight=" + bean.getWeight()
                    + ", commission=" + bean.getCommission()
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
    
    public ArrayList getShells(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from shell where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ShellFormBean bean = null;
            while (rs.next()) {
                bean = new ShellFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public ShellBean getShell(int shellId) throws Exception {
        ResultSet rs = null;
        String sql = "select s.*, u.name as unit_name, sk.weight from shell as s, unit as u, shell_kind AS sk where s.unit_id=u.id and s.kind_id=sk.id and s.id=" + shellId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellBean bean = new ShellBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setWeight(rs.getDouble("weight"));
                bean.setStatus(rs.getInt("status"));
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
    
    public ArrayList getShellVendor(String organizationIds, String vendorIds) throws Exception {
        ResultSet rs = null;
        String sql = "select sv.*, v.name as vendor_name, v.code as vendor_code, s.name as shell_name"
                + " from shell_vendor as sv, vendor as v, shell as s"
                + " where sv.quantity>0 and sv.vendor_id=v.id and sv.shell_id=s.id and sv.vendor_id in (" + vendorIds + ") and sv.organization_id in(" + organizationIds + ")"
                + " and v.status=" + EmployeeBean.STATUS_ACTIVE + " and s.status=" + EmployeeBean.STATUS_ACTIVE
                + " order by sv.vendor_id, s.name";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ShellVendorDetailBean bean = null;
            while (rs.next()) {
                bean = new ShellVendorDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setVendorName(rs.getString("vendor_name"));
                bean.setName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
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
    
    public ShellVendorDetailBean getShellVendor(int shellVendorId) throws Exception {
        ResultSet rs = null;
        String sql = "select sv.*, v.name as vendor_name, v.code as vendor_code, s.name as shell_name"
                + " from shell_vendor as sv, vendor as v, shell as s"
                + " where sv.vendor_id=v.id and sv.shell_id=s.id and sv.id=" + shellVendorId;
        try {
            rs = DBUtil.executeQuery(sql);
            ShellVendorDetailBean bean = null;
            while (rs.next()) {
                bean = new ShellVendorDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setVendorName(rs.getString("vendor_name"));
                bean.setName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
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
    
    public ShellBean getShellByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from shell where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellBean bean = new ShellBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public int insertShell(ShellBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        try {
            String sql = "";
            sql = "Insert Into shell (name, code, kind_id, unit_id, price, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getKindId() + "," + bean.getUnitId() + "," + bean.getPrice()
                    + "," + bean.getStatus() + ")";
            result = DBUtil.executeInsert(sql);
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
        return result;
    }
    
    public void updateShell(ShellBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update shell Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + ", unit_id=" + bean.getUnitId()
                    + ", kind_id=" + bean.getKindId()
                    + ", price=" + bean.getPrice()
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
    
    public ArrayList getAccessoryKinds(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory_kind where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AccessoryKindFormBean bean = null;
            while (rs.next()) {
                bean = new AccessoryKindFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public ArrayList getAccessoryKinds(String accessoryKindIds) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory_kind where status=" + EmployeeBean.STATUS_ACTIVE;
        if (!GenericValidator.isBlankOrNull(accessoryKindIds)) {
            sql += " and id in (" + accessoryKindIds + ")";
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AccessoryKindFormBean bean = null;
            while (rs.next()) {
                bean = new AccessoryKindFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public AccessoryKindFormBean getAccessoryKind(int kindId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory_kind where id=" + kindId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccessoryKindFormBean bean = new AccessoryKindFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
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
    
    public AccessoryKindFormBean getAccessoryKindByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory_kind where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccessoryKindFormBean bean = new AccessoryKindFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setCommission(rs.getInt("commission"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertAccessoryKind(AccessoryKindBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into accessory_kind (name, note, commission, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getNote() + "'," + bean.getCommission() + "," + bean.getStatus() + ")";
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
    
    public void updateAccessoryKind(AccessoryKindBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update accessory_kind Set "
                    + " name='" + bean.getName() + "'"
                    + ", note='" + bean.getNote() + "'"
                    + ", commission=" + bean.getCommission()
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
    
    public ArrayList getAccessorys(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AccessoryFormBean bean = null;
            while (rs.next()) {
                bean = new AccessoryFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public AccessoryBean getAccessory(int accessoryId) throws Exception {
        ResultSet rs = null;
        String sql = "select a.*, u.name as unit_name from accessory as a, unit as u where a.unit_id=u.id and a.id=" + accessoryId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccessoryBean bean = new AccessoryBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public AccessoryBean getAccessoryByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from accessory where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccessoryBean bean = new AccessoryBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setKindId(rs.getInt("kind_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertAccessory(AccessoryBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into accessory (name, kind_id, unit_id, price, status)"
                    + " Values ('" + bean.getName() + "'," + bean.getKindId() + "," + bean.getUnitId() + "," + bean.getPrice() + "," + bean.getStatus() + ")";
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
    
    public void updateAccessory(AccessoryBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update accessory Set "
                    + " name='" + bean.getName() + "'"
                    + ", unit_id=" + bean.getUnitId()
                    + ", kind_id=" + bean.getKindId()
                    + ", price=" + bean.getPrice()
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
    
    public ArrayList getPromotionMaterials(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from promotion_material where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PromotionMaterialFormBean bean = null;
            while (rs.next()) {
                bean = new PromotionMaterialFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public PromotionMaterialFormBean getPromotionMaterial(int promotionMaterialId) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, u.name as unit_name from promotion_material as p, unit as u where p.unit_id=u.id and p.id=" + promotionMaterialId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PromotionMaterialFormBean bean = new PromotionMaterialFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setStatus(rs.getInt("status"));
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
    
    public PromotionMaterialFormBean getPromotionMaterialByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from promotion_material where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PromotionMaterialFormBean bean = new PromotionMaterialFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertPromotionMaterial(PromotionMaterialBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into promotion_material (name, unit_id, status)"
                    + " Values ('" + bean.getName() + "'," + bean.getUnitId() + "," + bean.getStatus() + ")";
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
    
    public void updatePromotionMaterial(PromotionMaterialBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update promotion_material Set "
                    + " name='" + bean.getName() + "'"
                    + ", unit_id=" + bean.getUnitId()
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
    
    public ArrayList getPetros(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, o.name as organization_name, u.name as unit_name from petro as p, organization as o, unit as u"
                + " where p.organization_id=o.id and p.unit_id=u.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and u.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and p.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and o.id in(" + organizationIds + ")";
        }
        sql += " order by p.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PetroFormBean bean = null;
            while (rs.next()) {
                bean = new PetroFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public ArrayList getPetros(String petroIds) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, o.name as organization_name, u.name as unit_name from petro as p, organization as o, unit as u"
                + " where p.organization_id=o.id and p.unit_id=u.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and u.status=" + EmployeeBean.STATUS_ACTIVE;
        
        if (petroIds.isEmpty()) {
            petroIds = "0";
        }
        sql += " and p.id in(" + petroIds + ")";
        sql += " order by p.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PetroFormBean bean = null;
            while (rs.next()) {
                bean = new PetroFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public PetroBean getPetro(int petroId) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, u.name as unit_name from petro as p, unit as u where p.unit_id=u.id and p.id=" + petroId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PetroBean bean = new PetroBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public PetroBean getPetroByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from petro where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PetroBean bean = new PetroBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertPetro(PetroBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into petro (code, name, organization_id, unit_id, price, status)"
                    + " Values ('" + bean.getCode() + "','" + bean.getName() + "'," + bean.getOrganizationId() + "," + bean.getUnitId() + "," + bean.getPrice() + "," + bean.getStatus() + ")";
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
    
    public void updatePetro(PetroBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update petro Set "
                    + " code='" + bean.getCode() + "'"
                    + ", name='" + bean.getName() + "'"
                    + ", unit_id=" + bean.getUnitId()
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", price=" + bean.getPrice()
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
    
    public ArrayList searchShellImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchShellImport(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ShellImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new ShellImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setShellName(rs.getString("shell_name"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
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
    
    public ShellImportBean getShellImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),created_date)=0,1,0) as can_edit from shell_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellImportBean bean = new ShellImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setVendorId(rs.getInt("vendor_id"));
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
    
    public int insertShellImport(ShellImportBean bean) throws Exception {
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
            String sql = "{call insertShellImport(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
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
    
    public void updateShellImport(ShellImportBean bean) throws Exception {
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
            String sql = "{call updateShellImport(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
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
    
    public String getNextShellImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shell_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteShellImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteShellImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public ArrayList searchAccessoryImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchAccessoryImport(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    AccessoryImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new AccessoryImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public AccessoryImportBean getAccessoryImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from accessory_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccessoryImportBean bean = new AccessoryImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getAccessoryImportDetail(int accessoryImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as accessory_name"
                + " from accessory_import_detail as det, accessory as s"
                + " where det.accessory_id=s.id and det.accessory_import_id=" + accessoryImportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AccessoryImportDetailBean bean = null;
            while (rs.next()) {
                bean = new AccessoryImportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setAccessoryImportId(rs.getInt("accessory_import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccessoryId(rs.getInt("accessory_id"));
                bean.setAccessoryName(rs.getString("accessory_name"));
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
    
    public int insertAccessoryImport(AccessoryImportBean bean) throws Exception {
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
            String sql = "{call insertAccessoryImport(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateAccessoryImport(AccessoryImportBean bean) throws Exception {
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
            String sql = "{call updateAccessoryImport(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
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
    
    public String getNextAccessoryImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "accessory_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteAccessoryImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteAccessoryImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertAccessoryImportDetail(AccessoryImportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertAccessoryImportDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_accessory_import_id", bean.getAccessoryImportId());
                spUtil.getCallableStatement().setInt("_accessory_id", bean.getAccessoryId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateAccessoryImportDetail(AccessoryImportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateAccessoryImportDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public ArrayList searchPromotionMaterialImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchPromotionMaterialImport(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    PromotionMaterialImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new PromotionMaterialImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public PromotionMaterialImportBean getPromotionMaterialImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from promotion_material_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PromotionMaterialImportBean bean = new PromotionMaterialImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getPromotionMaterialImportDetail(int promotionMaterialImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as promotion_material_name"
                + " from promotion_material_import_detail as det, promotion_material as s"
                + " where det.promotion_material_id=s.id and det.import_id=" + promotionMaterialImportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PromotionMaterialImportDetailBean bean = null;
            while (rs.next()) {
                bean = new PromotionMaterialImportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setPromotionMaterialImportId(rs.getInt("import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setPromotionMaterialId(rs.getInt("promotion_material_id"));
                bean.setPromotionMaterialName(rs.getString("promotion_material_name"));
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
    
    public int insertPromotionMaterialImport(PromotionMaterialImportBean bean) throws Exception {
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
            String sql = "{call insertPromotionMaterialImport(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updatePromotionMaterialImport(PromotionMaterialImportBean bean) throws Exception {
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
            String sql = "{call updatePromotionMaterialImport(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
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
    
    public String getNextPromotionMaterialImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "promotion_material_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deletePromotionMaterialImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deletePromotionMaterialImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertPromotionMaterialImportDetail(PromotionMaterialImportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertPromotionMaterialImportDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_promotion_material_import_id", bean.getPromotionMaterialImportId());
                spUtil.getCallableStatement().setInt("_promotion_material_id", bean.getPromotionMaterialId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updatePromotionMaterialImportDetail(PromotionMaterialImportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updatePromotionMaterialImportDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public ArrayList searchSaleAccessory(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleAccessory(?,?)}";
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
                    SaleAccessoryFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleAccessoryFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public SaleAccessoryBean getSaleAccessory(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from accessory_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleAccessoryBean bean = new SaleAccessoryBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getSaleAccessoryDetail(int saleAccessoryId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as accessory_name, s.unit_id, u.name as unit_name"
                + " from accessory_sale_detail as det, accessory as s, unit as u"
                + " where det.accessory_id=s.id and s.unit_id=u.id and det.accessory_sale_id=" + saleAccessoryId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleAccessoryDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleAccessoryDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleAccessoryId(rs.getInt("accessory_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccessoryId(rs.getInt("accessory_id"));
                bean.setAccessoryName(rs.getString("accessory_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertSaleAccessory(SaleAccessoryBean bean) throws Exception {
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
            String sql = "{call insertSaleAccessory(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateSaleAccessory(SaleAccessoryBean bean) throws Exception {
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
            String sql = "{call updateSaleAccessory(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
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
    
    public String getNextSaleAccessoryNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "accessory_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteSaleAccessory(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleAccessory(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertSaleAccessoryDetail(SaleAccessoryDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleAccessoryDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_accessory_sale_id", bean.getSaleAccessoryId());
                spUtil.getCallableStatement().setInt("_accessory_id", bean.getAccessoryId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateSaleAccessoryDetail(SaleAccessoryDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleAccessoryDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public ArrayList getSaleAccessoryChangeDetail(int saleAccessoryId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as accessory_name, s.unit_id, u.name as unit_name"
                + " from accessory_sale_change_detail as det, accessory as s, unit as u"
                + " where det.accessory_id=s.id and s.unit_id=u.id and det.accessory_sale_id=" + saleAccessoryId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleAccessoryChangeDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleAccessoryChangeDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleAccessoryId(rs.getInt("accessory_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setAccessoryId(rs.getInt("accessory_id"));
                bean.setAccessoryName(rs.getString("accessory_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
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
    
    public int insertSaleAccessoryChangeDetail(SaleAccessoryChangeDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleAccessoryChangeDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_accessory_sale_id", bean.getSaleAccessoryId());
                spUtil.getCallableStatement().setInt("_accessory_id", bean.getAccessoryId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
    
    public void updateSaleAccessoryChangeDetail(SaleAccessoryChangeDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleAccessoryChnageDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
    
    public ArrayList searchSalePetro(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSalePetro(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SalePetroFormBean bean = null;
                    while (rs.next()) {
                        bean = new SalePetroFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public SalePetroBean getSalePetro(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from petro_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SalePetroBean bean = new SalePetroBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setCustomerId(rs.getInt("customer_id"));
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
    
    public ArrayList getSalePetroDetail(int salePetroId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as petro_name, s.unit_id, u.name as unit_name"
                + " from petro_sale_detail as det, petro as s, unit as u"
                + " where det.petro_id=s.id and s.unit_id=u.id and det.petro_sale_id=" + salePetroId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SalePetroDetailBean bean = null;
            while (rs.next()) {
                bean = new SalePetroDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSalePetroId(rs.getInt("petro_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setPetroId(rs.getInt("petro_id"));
                bean.setPetroName(rs.getString("petro_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertSalePetro(SalePetroBean bean) throws Exception {
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
            String sql = "{call insertSalePetro(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateSalePetro(SalePetroBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateSalePetro(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
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
    
    public String getNextSalePetroNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "petro_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteSalePetro(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSalePetro(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertSalePetroDetail(SalePetroDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSalePetroDetail(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_petro_sale_id", bean.getSalePetroId());
                spUtil.getCallableStatement().setInt("_petro_id", bean.getPetroId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public void updateSalePetroDetail(SalePetroDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSalePetroDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public int deleteSalePetroDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From petro_sale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList searchShieldImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchShieldImport(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ShieldImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new ShieldImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setNote(rs.getString("note"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setQuantity(rs.getInt("quantity"));
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
    
    public ShieldImportBean getShieldImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),created_date)=0,1,0) as can_edit from shield_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShieldImportBean bean = new ShieldImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public int insertShieldImport(ShieldImportBean bean) throws Exception {
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
            String sql = "{call insertShieldImport(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateShieldImport(ShieldImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateShieldImport(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
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
    
    public String getNextShieldImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shield_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteShieldImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteShieldImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public ArrayList searchShieldDecrease(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchShieldDecrease(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ShieldDecreaseFormBean bean = null;
                    while (rs.next()) {
                        bean = new ShieldDecreaseFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setNote(rs.getString("note"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setQuantity(rs.getInt("quantity"));
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
    
    public ShieldDecreaseBean getShieldDecrease(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),created_date)=0,1,0) as can_edit from shield_decrease where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShieldDecreaseBean bean = new ShieldDecreaseBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public int insertShieldDecrease(ShieldDecreaseBean bean) throws Exception {
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
            String sql = "{call insertShieldDecrease(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateShieldDecrease(ShieldDecreaseBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateShieldDecrease(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
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
    
    public String getNextShieldDecreaseNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shield_decrease");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteShieldDecrease(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteShieldDecrease(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public GoodBean getGood(int goodId) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, u.name as unit_name from good as p, unit as u where p.unit_id=u.id and p.id=" + goodId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GoodBean bean = new GoodBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public ArrayList getGoods(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select p.*, o.name as organization_name, u.name as unit_name from good as p, organization as o, unit as u"
                + " where p.organization_id=o.id and p.unit_id=u.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and u.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and p.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and o.id in(" + organizationIds + ")";
        }
        sql += " order by p.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GoodFormBean bean = null;
            while (rs.next()) {
                bean = new GoodFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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
    
    public GoodBean getGoodByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from good where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GoodBean bean = new GoodBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setPrice(rs.getDouble("price"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertGood(GoodBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into good (code, name, organization_id, unit_id, price, status)"
                    + " Values ('" + bean.getCode() + "','" + bean.getName() + "'," + bean.getOrganizationId() + "," + bean.getUnitId() + "," + bean.getPrice() + "," + bean.getStatus() + ")";
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
    
    public void updateGood(GoodBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update good Set "
                    + " code='" + bean.getCode() + "'"
                    + ", name='" + bean.getName() + "'"
                    + ", unit_id=" + bean.getUnitId()
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", price=" + bean.getPrice()
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
    
    public ArrayList searchGoodImport(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGoodImport(?,?)}";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GoodImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new GoodImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setStoreId(rs.getInt("store_id"));
                        bean.setStoreName(rs.getString("store_name"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public GoodImportBean getGoodImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from good_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GoodImportBean bean = new GoodImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setRate(rs.getDouble("rate"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getGoodImportDetail(int goodImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as good_name"
                + " from good_import_detail as det, good as s"
                + " where det.good_id=s.id and det.good_import_id=" + goodImportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GoodImportDetailBean bean = null;
            while (rs.next()) {
                bean = new GoodImportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGoodImportId(rs.getInt("good_import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setGoodId(rs.getInt("good_id"));
                bean.setGoodName(rs.getString("good_name"));
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
    
    public int insertGoodImport(GoodImportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertGoodImport(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateGoodImport(GoodImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateGoodImport(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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
    }
    
    public String getNextGoodImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "good_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteGoodImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteGoodImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertGoodImportDetail(GoodImportDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGoodImportDetail(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_good_import_id", bean.getGoodImportId());
                spUtil.getCallableStatement().setInt("_good_id", bean.getGoodId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public void updateGoodImportDetail(GoodImportDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGoodImportDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public int deleteGoodImportDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From good_import_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList searchSaleGood(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleGood(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleGoodFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleGoodFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public SaleGoodBean getSaleGood(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from good_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleGoodBean bean = new SaleGoodBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setCustomerId(rs.getInt("customer_id"));
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
    
    public ArrayList getSaleGoodDetail(int saleGoodId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as good_name, s.unit_id, u.name as unit_name"
                + " from good_sale_detail as det, good as s, unit as u"
                + " where det.good_id=s.id and s.unit_id=u.id and det.good_sale_id=" + saleGoodId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleGoodDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleGoodDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleGoodId(rs.getInt("good_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setGoodId(rs.getInt("good_id"));
                bean.setGoodName(rs.getString("good_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertSaleGood(SaleGoodBean bean) throws Exception {
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
            String sql = "{call insertSaleGood(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateSaleGood(SaleGoodBean bean) throws Exception {
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
            String sql = "{call updateSaleGood(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
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
    
    public String getNextSaleGoodNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "good_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteSaleGood(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleGood(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertSaleGoodDetail(SaleGoodDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleGoodDetail(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_good_sale_id", bean.getSaleGoodId());
                spUtil.getCallableStatement().setInt("_good_id", bean.getGoodId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public void updateSaleGoodDetail(SaleGoodDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleGoodDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public int deleteSaleGoodDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From good_sale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList getOilGroups(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil_group where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList agencyList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilGroupFormBean bean = null;
            while (rs.next()) {
                bean = new OilGroupFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                agencyList.add(bean);
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
        return agencyList;
    }
    
    public OilGroupBean getOilGroup(int oilGroupId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil_group where id=" + oilGroupId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilGroupBean bean = new OilGroupBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setStatus(rs.getInt("status"));
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
    
    public OilGroupBean getOilGroupByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil_group where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilGroupBean bean = new OilGroupBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                bean.setStatus(rs.getInt("status"));
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
    
    public void insertOilGroup(OilGroupBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into oil_group(name, note, status) Values ('" + bean.getName() + "','" + bean.getNote() + "'," + bean.getStatus() + ")";
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
    
    public void updateOilGroup(OilGroupBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update oil_group Set "
                    + " name='" + bean.getName() + "'"
                    + ", note='" + bean.getNote() + "'"
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
    
    public OilBean getOil(int oilId) throws Exception {
        ResultSet rs = null;
        String sql = "select p.* from oil as p where p.id=" + oilId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilBean bean = new OilBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setGroupId(rs.getInt("group_id"));
                bean.setWeight(rs.getFloat("weight"));
                bean.setWeightUnitId(rs.getInt("weight_unit_id"));
                bean.setBaseUnitId(rs.getInt("base_unit_id"));
                bean.setSaleUnitId(rs.getInt("sale_unit_id"));
                bean.setEmployeeCommissionId(rs.getInt("employee_commission_id"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setStatus(rs.getInt("status"));
                bean.setPrice(rs.getDouble("price"));
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
    
    public ArrayList getOils(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select p.id, p.code, p.name, b.name as base_unit_name, s.name as sale_unit_name"
                + " from oil as p, unit as b, unit as s"
                + " where p.base_unit_id=b.id and p.sale_unit_id=s.id and b.status=" + EmployeeBean.STATUS_ACTIVE + " and s.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and p.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and p.organization_id in(" + organizationIds + ")";
        }
        sql += " order by p.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilFormBean bean = null;
            while (rs.next()) {
                bean = new OilFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setBaseUnitName(rs.getString("base_unit_name"));
                bean.setSaleUnitName(rs.getString("sale_unit_name"));
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
    
    public OilBean getOilByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilBean bean = new OilBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setGroupId(rs.getInt("group_id"));
                bean.setWeight(rs.getFloat("weight"));
                bean.setWeightUnitId(rs.getInt("weight_unit_id"));
                bean.setBaseUnitId(rs.getInt("base_unit_id"));
                bean.setSaleUnitId(rs.getInt("sale_unit_id"));
                bean.setEmployeeCommissionId(rs.getInt("employee_commission_id"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setStatus(rs.getInt("status"));
                bean.setPrice(rs.getDouble("price"));
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
    
    public void insertOil(OilBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into oil (code,name,group_id,weight_unit_id,weight,base_unit_id,sale_unit_id,employee_commission_id,status,organization_id,price,vendor_id)"
                    + " Values ('" + bean.getCode() + "','" + bean.getName() + "'," + bean.getGroupId() + "," + bean.getWeightUnitId() + "," + bean.getWeight()
                    + "," + bean.getBaseUnitId() + "," + bean.getSaleUnitId() + "," + bean.getEmployeeCommissionId() + "," + bean.getStatus()
                    + "," + bean.getOrganizationId() + "," + bean.getPrice() + "," + bean.getVendorId() + ")";
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
    
    public void updateOil(OilBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update oil Set "
                    + " code='" + bean.getCode() + "'"
                    + ", name='" + bean.getName() + "'"
                    + ", group_id=" + bean.getGroupId()
                    + ", weight_unit_id=" + bean.getWeightUnitId()
                    + ", weight=" + bean.getWeight()
                    + ", base_unit_id=" + bean.getBaseUnitId()
                    + ", sale_unit_id=" + bean.getSaleUnitId()
                    + ", employee_commission_id=" + bean.getEmployeeCommissionId()
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", status=" + bean.getStatus()
                    + ", price=" + bean.getPrice()
                    + ", vendor_id=" + bean.getVendorId()
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
    
    public ArrayList searchOilImport(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchOilImport(?,?)}";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    OilImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new OilImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public OilImportBean getOilImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from oil_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilImportBean bean = new OilImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setRate(rs.getDouble("rate"));
                bean.setTotal(rs.getDouble("total"));
                bean.setTotalBeforeCommission(rs.getDouble("total_before_commission"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getOilImportDetail(int oilImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as oil_name, u.name as unit_name"
                + " from oil_import_detail as det, oil as s, unit as u"
                + " where det.oil_id=s.id and det.unit_id=u.id and det.oil_import_id=" + oilImportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilImportDetailBean bean = null;
            int length = 0;
            while (rs.next()) {
                bean = new OilImportDetailBean();
                bean.setNo(length++);
                bean.setId(rs.getInt("id"));
                bean.setOilImportId(rs.getInt("oil_import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertOilImport(OilImportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertOilImport(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommission());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateOilImport(OilImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateOilImport(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommission());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
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
    
    public String getNextOilImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "oil_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteOilImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteOilImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertOilImportDetail(OilImportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertOilImportDetail(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_oil_import_id", bean.getOilImportId());
                spUtil.getCallableStatement().setInt("_oil_id", bean.getOilId());
                spUtil.getCallableStatement().setInt("_unit_id", bean.getUnitId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateOilImportDetail(OilImportDetailBean bean, String createdDate, int storeId) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateOilImportDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_store_id", storeId);
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
    
    public int deleteOilImportDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From oil_import_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList getOilUnits(int oilId) throws Exception {
        ResultSet rs = null;
        String sql = "select b.id as base_unit_id, b.name as base_unit_name, s.id as sale_unit_id, s.name as sale_unit_name"
                + " from oil as p, unit as b, unit as s"
                + " where p.base_unit_id=b.id and p.sale_unit_id=s.id and b.status=" + EmployeeBean.STATUS_ACTIVE + " and s.status=" + EmployeeBean.STATUS_ACTIVE + " and p.id=" + oilId;
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            UnitBean bean = null;
            while (rs.next()) {
                bean = new UnitBean();
                bean.setId(rs.getInt("sale_unit_id"));
                bean.setName(rs.getString("sale_unit_name"));
                list.add(bean);
                if (bean.getId() != rs.getInt("base_unit_id")) {
                    bean = new UnitBean();
                    bean.setId(rs.getInt("base_unit_id"));
                    bean.setName(rs.getString("base_unit_name"));
                    list.add(bean);
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
        return list;
        
    }
    
    public ArrayList searchSaleOil(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleOil(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleOilFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleOilFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public SaleOilBean getSaleOil(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from oil_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleOilBean bean = new SaleOilBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setCommissionKind(rs.getInt("commission_kind"));
                bean.setCommissionAmount(rs.getFloat("commission_amount"));
                bean.setGapAgencyAmount(rs.getInt("gap_agency_amount"));
                bean.setGapCustomerAmount(rs.getInt("gap_customer_amount"));
                bean.setTotalBeforeCommisison(rs.getDouble("total_before_commission"));
                bean.setIsCalculateAgencyCommission(rs.getInt("is_calculate_agency_commission"));
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
    
    public ArrayList getSaleOilDetail(int saleOilId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, o.name as oil_name, u.name as unit_name, s.name as store_name"
                + " from oil_sale_detail as det, oil as o, unit as u, store as s"
                + " where det.oil_id=o.id and det.unit_id=u.id and det.store_id=s.id and det.oil_sale_id=" + saleOilId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleOilDetailBean bean = null;
            int lenght = 0;
            while (rs.next()) {
                bean = new SaleOilDetailBean();
                bean.setNo(lenght++);
                bean.setId(rs.getInt("id"));
                bean.setSaleOilId(rs.getInt("oil_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPriceBeforeCommission(rs.getDouble("price_before_commission"));
                bean.setCommissionPrice(rs.getFloat("commission_price"));
                bean.setPrice(rs.getDouble("price"));
                bean.setFirstAmount(rs.getDouble("first_amount"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setGapAgencyAmount(rs.getDouble("gap_agency_amount"));
                bean.setGapCustomerAmount(rs.getDouble("gap_customer_amount"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertSaleOil(SaleOilBean bean) throws Exception {
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
            String sql = "{call insertSaleOil(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setInt("_commission_kind", bean.getCommissionKind());
                spUtil.getCallableStatement().setDouble("_commission_amount", bean.getCommissionAmount());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommisison());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setInt("_is_calculate_agency_commission", bean.getIsCalculateAgencyCommission());
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
    
    public void updateSaleOil(SaleOilBean bean) throws Exception {
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
            String sql = "{call updateSaleOil(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setInt("_commission_kind", bean.getCommissionKind());
                spUtil.getCallableStatement().setDouble("_commission_amount", bean.getCommissionAmount());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommisison());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_is_calculate_agency_commission", bean.getIsCalculateAgencyCommission());
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
    
    public String getNextSaleOilNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "oil_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteSaleOil(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleOil(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertSaleOilDetail(SaleOilDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleOilDetail(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_oil_sale_id", bean.getSaleOilId());
                spUtil.getCallableStatement().setInt("_oil_id", bean.getOilId());
                spUtil.getCallableStatement().setInt("_unit_id", bean.getUnitId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_price_before_commission", bean.getPriceBeforeCommission());
                spUtil.getCallableStatement().setFloat("_commssion_price", bean.getCommissionPrice());
                spUtil.getCallableStatement().setDouble("_first_amount", bean.getFirstAmount());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateSaleOilDetail(SaleOilDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleOilDetail(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_price_before_commission", bean.getPriceBeforeCommission());
                spUtil.getCallableStatement().setFloat("_commssion_price", bean.getCommissionPrice());
                spUtil.getCallableStatement().setDouble("_first_amount", bean.getFirstAmount());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public int deleteSaleOilDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From oil_sale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public SaleOilDetailBean getLastSaleOilDetail(int oilId, int customerId) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT oil_sale_tbl.price_before_commission, oil_sale_tbl.commission_price, oil_sale_tbl.price, oil_sale_tbl.commission"
                + ", o.id AS oil_id, o.NAME AS oil_name"
                + " FROM oil AS o"
                + " LEFT JOIN (SELECT osdet.oil_id, osdet.price_before_commission, osdet.commission_price, osdet.price, osdet.commission"
                + " FROM oil_sale AS os, oil_sale_detail AS osdet WHERE osdet.oil_sale_id=os.id AND os.customer_id=" + customerId + " AND osdet.oil_id=" + oilId
                + " ORDER BY osdet.id DESC LIMIT 1) AS oil_sale_tbl ON oil_sale_tbl.oil_id=o.id"
                + " WHERE o.id=" + oilId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleOilDetailBean bean = new SaleOilDetailBean();
                bean.setPriceBeforeCommission(rs.getDouble("price_before_commission"));
                bean.setCommissionPrice(rs.getFloat("commission_price"));
                bean.setPrice(rs.getDouble("price"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
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
    
    public ArrayList getOils(String oilIds) throws Exception {
        ResultSet rs = null;
        String sql = "select p.id, p.code, p.name, b.name as base_unit_name, s.name as sale_unit_name"
                + " from oil as p, unit as b, unit as s"
                + " where p.base_unit_id=b.id and p.sale_unit_id=s.id"
                + " and b.status=" + EmployeeBean.STATUS_ACTIVE + " and s.status=" + EmployeeBean.STATUS_ACTIVE + " and p.status=" + EmployeeBean.STATUS_ACTIVE;
        if (oilIds.isEmpty()) {
            oilIds = "0";
        }
        sql += " and p.id in(" + oilIds + ")";
        sql += " order by p.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilFormBean bean = null;
            while (rs.next()) {
                bean = new OilFormBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setName(rs.getString("name"));
                bean.setBaseUnitName(rs.getString("base_unit_name"));
                bean.setSaleUnitName(rs.getString("sale_unit_name"));
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
    
    public ArrayList getSaleOilPromotionMaterialDetail(int saleOilId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as oil_name, u.name as unit_name, st.name as store_name"
                + " from oil_sale_promotion as det, oil as s, unit as u, store as st"
                + " where det.oil_id=s.id and det.unit_id=u.id and det.store_id=st.id and det.sale_oil_id=" + saleOilId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleOilPromotionMaterialDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleOilPromotionMaterialDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleOilId(rs.getInt("sale_oil_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPromotionMaterialId(rs.getInt("oil_id"));
                bean.setPromotionMaterialName(rs.getString("oil_name"));
                bean.setPromotionMaterialUnitId(rs.getInt("unit_id"));
                bean.setPromotionMaterialUnitId(rs.getInt("store_id"));
                bean.setPromotionMaterialUnitName(rs.getString("unit_name"));
                bean.setPromotionMaterialStoreName(rs.getString("store_name"));
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
    
    public int insertSaleOilPromotionMaterialDetail(SaleOilPromotionMaterialDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleOilPromotionMaterialDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_sale_oil_id", bean.getSaleOilId());
                spUtil.getCallableStatement().setInt("_oil_id", bean.getPromotionMaterialId());
                spUtil.getCallableStatement().setInt("_unit_id", bean.getPromotionMaterialUnitId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getPromotionMaterialStoreId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateSaleOilPromotionMaterialDetail(SaleOilPromotionMaterialDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleOilPromotionMaterialDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public int deleteSaleOilPromotionMaterialDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From oil_sale_promotion Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList searchSaleOilReturn(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleOilReturn(?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleOilFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleOilFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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
    
    public SaleOilReturnBean getSaleOilReturn(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from oil_sale_return where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleOilReturnBean bean = new SaleOilReturnBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setCommissionKind(rs.getInt("commission_kind"));
                bean.setCommissionAmount(rs.getFloat("commission_amount"));
                bean.setGapAgencyAmount(rs.getInt("gap_agency_amount"));
                bean.setGapCustomerAmount(rs.getInt("gap_customer_amount"));
                bean.setTotalBeforeCommisison(rs.getDouble("total_before_commission"));
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
    
    public ArrayList getSaleOilReturnDetail(int saleOilReturnId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, o.name as oil_name, u.name as unit_name, s.name as store_name"
                + " from oil_sale_return_detail as det, oil as o, unit as u, store as s"
                + " where det.oil_id=o.id and det.unit_id=u.id and det.store_id=s.id and det.oil_sale_return_id=" + saleOilReturnId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleOilReturnDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleOilReturnDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleOilReturnId(rs.getInt("oil_sale_return_id"));
                bean.setSaleOilDetailId(rs.getInt("oil_sale_detail_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPriceBeforeCommission(rs.getDouble("price_before_commission"));
                bean.setCommissionPrice(rs.getFloat("commission_price"));
                bean.setPrice(rs.getDouble("price"));
                bean.setFirstAmount(rs.getDouble("first_amount"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setGapAgencyAmount(rs.getDouble("gap_agency_amount"));
                bean.setGapCustomerAmount(rs.getDouble("gap_customer_amount"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public ArrayList getSaleOilReturnDetailBySaleOilId(String saleOilDetailIds, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, o.name as oil_name, u.name as unit_name, s.name as return_store_name, s.id AS return_store_id"
                + " from oil_sale_detail as det, oil as o, unit as u, store as s, oil_return_store AS rs"
                + " where det.oil_id=o.id and det.unit_id=u.id and det.id in(" + saleOilDetailIds + ")"
                + " and '" + organizationIds + "' LIKE CONCAT('%,',rs.organization_id,',%') AND rs.store_id=s.id"
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleOilReturnDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleOilReturnDetailBean();
                bean.setSaleOilDetailId(rs.getInt("id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPriceBeforeCommission(rs.getDouble("price_before_commission"));
                bean.setCommissionPrice(rs.getFloat("commission_price"));
                bean.setPrice(rs.getDouble("price"));
                bean.setFirstAmount(rs.getDouble("first_amount"));
                bean.setCommission(rs.getFloat("commission"));
                bean.setGapAgencyAmount(rs.getDouble("gap_agency_amount"));
                bean.setGapCustomerAmount(rs.getDouble("gap_customer_amount"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setStoreId(rs.getInt("return_store_id"));
                bean.setStoreName(rs.getString("return_store_name"));
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
    
    public String getNextSaleOilReturnNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "oil_sale_return");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public int insertSaleOilReturn(SaleOilReturnBean bean) throws Exception {
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
            String sql = "{call insertSaleOilReturn(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setInt("_commission_kind", bean.getCommissionKind());
                spUtil.getCallableStatement().setDouble("_commission_amount", bean.getCommissionAmount());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommisison());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateSaleOilReturn(SaleOilReturnBean bean) throws Exception {
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
            String sql = "{call updateSaleOilReturn(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setInt("_commission_kind", bean.getCommissionKind());
                spUtil.getCallableStatement().setDouble("_commission_amount", bean.getCommissionAmount());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setDouble("_total_before_commission", bean.getTotalBeforeCommisison());
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
    
    public void deleteSaleOilReturn(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleOilReturn(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertSaleOilReturnDetail(SaleOilReturnDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleOilReturnDetail(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_oil_sale_return_id", bean.getSaleOilReturnId());
                spUtil.getCallableStatement().setInt("_oil_sale_detail_id", bean.getSaleOilDetailId());
                spUtil.getCallableStatement().setInt("_oil_id", bean.getOilId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_price_before_commission", bean.getPriceBeforeCommission());
                spUtil.getCallableStatement().setFloat("_commssion_price", bean.getCommissionPrice());
                spUtil.getCallableStatement().setDouble("_first_amount", bean.getFirstAmount());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public void updateSaleOilReturnDetail(SaleOilReturnDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleOilReturnDetail(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_price_before_commission", bean.getPriceBeforeCommission());
                spUtil.getCallableStatement().setFloat("_commssion_price", bean.getCommissionPrice());
                spUtil.getCallableStatement().setDouble("_first_amount", bean.getFirstAmount());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
                spUtil.getCallableStatement().setDouble("_gap_agency_amount", bean.getGapAgencyAmount());
                spUtil.getCallableStatement().setDouble("_gap_customer_amount", bean.getGapCustomerAmount());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
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
    
    public int deleteSaleOilReturnDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From oil_sale_return_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public SaleOilReturnStoreBean getSaleOilReturnStoreByOrganizationId(int organizationId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil_return_store where organization_id=" + organizationId + " order by store_id limit 1";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleOilReturnStoreBean bean = new SaleOilReturnStoreBean();
                bean.setId(rs.getInt("id"));
                bean.setStoreId(rs.getInt("store_id"));
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
    
    public SaleOilReturnStoreBean getSaleOilReturnStoreByOrganizationId(int storeId, int organizationId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from oil_return_store where store_id=" + storeId + " and  organization_id=" + organizationId + " order by organization_id, store_id limit 1";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleOilReturnStoreBean bean = new SaleOilReturnStoreBean();
                bean.setId(rs.getInt("id"));
                bean.setStoreId(rs.getInt("store_id"));
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
    
    public void insertSaleOilReturnStore(SaleOilReturnStoreBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into oil_return_store(store_id, organization_id) Values (" + bean.getStoreId() + "," + bean.getOrganizationId() + ")";
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
    
    public void updateSaleOilReturnStore(SaleOilReturnStoreBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update oil_return_store Set store_id=" + bean.getStoreId() + " Where id=" + bean.getId();
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
    
    public ArrayList searchOilExport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchOilExport(?,?,?)}";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    OilExportFormBean bean = null;
                    while (rs.next()) {
                        bean = new OilExportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setTotal(rs.getDouble("total"));
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
    
    public OilExportBean getOilExport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select e.*, c.name as customer_name, IF(DATEDIFF(e.created_date,SYSDATE())=0,1,0) as can_edit from oil_export as e, customer as c"
                + " where e.customer_id=c.id and e.id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OilExportBean bean = new OilExportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCustomerName(rs.getString("customer_name"));
                bean.setOilSaleId(rs.getInt("oil_sale_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setTotalText(NumberUtil.formatMoneyDefault(bean.getTotal(), "VND"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
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
    
    public ArrayList getOilExportDetail(int oilExportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as oil_name, u.name as unit_name, sdet.price"
                + " from oil_export_detail as det, oil_sale_detail AS sdet, oil as s, unit as u"
                + " where det.oil_id=s.id and det.oil_sale_detail_id=sdet.id and sdet.unit_id=u.id and det.oil_export_id=" + oilExportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilExportDetailBean bean = null;
            while (rs.next()) {
                bean = new OilExportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setOilExportId(rs.getInt("oil_export_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(bean.getQuantity() * bean.getPrice());
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public ArrayList getOilExportDetailBySaleOilId(String saleOilDetailIds) throws Exception {
        ResultSet rs = null;
        String sql = "select det.id, det.quantity, det.price, det.amount, det.oil_id, o.name as oil_name, u.name as unit_name"
                + " from oil_sale_detail as det, oil as o, unit as u"
                + " where det.oil_id=o.id and det.unit_id=u.id and det.id in(" + saleOilDetailIds + ")"
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OilExportDetailBean bean = null;
            while (rs.next()) {
                bean = new OilExportDetailBean();
                bean.setOilSaleDetailId(rs.getInt("id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setOilId(rs.getInt("oil_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setUnitName(rs.getString("unit_name"));
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
    
    public int insertOilExport(OilExportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertOilExport(?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_oil_sale_id", bean.getOilSaleId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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
    
    public void updateOilExport(OilExportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (com.stepup.core.util.GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateOilExport(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
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
    
    public String getNextOilExportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "oil_export");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public void deleteOilExport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteOilExport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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
    
    public int insertOilExportDetail(OilExportDetailBean bean, String createdDate) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertOilExportDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_oil_export_id", bean.getOilExportId());
                spUtil.getCallableStatement().setInt("_oil_id", bean.getOilId());
                spUtil.getCallableStatement().setInt("_oil_sale_detail_id", bean.getOilSaleDetailId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
    
    public void updateOilExportDetail(OilExportDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateOilExportDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
    
    public int deleteOilExportDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From oil_export_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
    
    public ArrayList getOilExports(String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call getOilExport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    OilExportFormBean bean = null;
                    while (rs.next()) {
                        bean = new OilExportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setTotal(rs.getDouble("total"));
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
}
