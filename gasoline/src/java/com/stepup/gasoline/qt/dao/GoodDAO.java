/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.accessory.AccessoryFormBean;
import com.stepup.gasoline.qt.accessorykind.AccessoryKindFormBean;
import com.stepup.gasoline.qt.bean.AccessoryBean;
import com.stepup.gasoline.qt.bean.AccessoryKindBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.PromotionMaterialBean;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.bean.ShellKindBean;
import com.stepup.gasoline.qt.promotionmaterial.PromotionMaterialFormBean;
import com.stepup.gasoline.qt.shell.ShellFormBean;
import com.stepup.gasoline.qt.shellkind.ShellKindFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
                bean.setWeight(rs.getFloat("weight"));
                bean.setCommission(rs.getFloat("commission"));
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
                bean.setWeight(rs.getFloat("weight"));
                bean.setCommission(rs.getFloat("commission"));
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
                bean.setWeight(rs.getFloat("weight"));
                bean.setCommission(rs.getFloat("commission"));
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
        String sql = "select * from shell where id=" + shellId;
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

    public void insertShell(ShellBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into shell (name, code, kind_id, unit_id, price, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getKindId() + "," + bean.getUnitId() + "," + bean.getPrice() + "," + bean.getStatus() + ")";
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
                bean.setCommission(rs.getFloat("commission"));
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
                bean.setCommission(rs.getFloat("commission"));
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
                bean.setCommission(rs.getFloat("commission"));
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
        String sql = "select * from accessory where id=" + accessoryId;
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
        String sql = "select * from promotion_material where id=" + promotionMaterialId;
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
}
