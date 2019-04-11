/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.UnitBean;
import com.stepup.gasoline.qt.bean.UnitRateBean;
import com.stepup.gasoline.qt.unit.UnitFormBean;
import com.stepup.gasoline.qt.unitrate.UnitRateFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class UnitDAO extends BasicDAO {

    public ArrayList getUnits(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from unit where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList unitList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            UnitFormBean bean = null;
            while (rs.next()) {
                bean = new UnitFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                unitList.add(bean);
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
        return unitList;
    }

    public UnitBean getUnit(int unitId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from unit where id=" + unitId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UnitBean bean = new UnitBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public UnitBean getUnitByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from unit where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UnitBean bean = new UnitBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public void insertUnit(UnitBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into unit(name, status) Values ('" + bean.getName() + "'," + bean.getStatus() + ")";
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

    public void updateUnit(UnitBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update unit Set "
                    + " name='" + bean.getName() + "'"
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

    public ArrayList getUnitRates() throws Exception {
        ResultSet rs = null;
        String sql = "select ur.*, b.name as base_unit_name, p.name as parent_unit_name from unit_rate as ur, unit as b, unit as p"
                + " where ur.base_unit_id=b.id and ur.parent_unit_id=p.id and b.status=" + EmployeeBean.STATUS_ACTIVE + " and p.status=" + EmployeeBean.STATUS_ACTIVE;

        ArrayList unitRateList = new ArrayList();

        try {
            rs = DBUtil.executeQuery(sql);
            UnitRateFormBean bean = null;
            while (rs.next()) {
                bean = new UnitRateFormBean();
                bean.setId(rs.getInt("id"));
                bean.setBaseUnitId(rs.getInt("base_unit_id"));
                bean.setParentUnitId(rs.getInt("parent_unit_id"));
                bean.setBaseUnitName(rs.getString("base_unit_name"));
                bean.setParentUnitName(rs.getString("parent_unit_name"));
                bean.setRate(rs.getFloat("rate"));
                unitRateList.add(bean);
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
        return unitRateList;
    }

    public UnitRateBean getUnitRate(int unitRateId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from unit_rate where id=" + unitRateId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UnitRateBean bean = new UnitRateBean();
                bean.setId(rs.getInt("id"));
                bean.setBaseUnitId(rs.getInt("base_unit_id"));
                bean.setParentUnitId(rs.getInt("parent_unit_id"));
                bean.setRate(rs.getFloat("rate"));
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

    public UnitRateBean getUnitRate(int baseUnitId, int parentUnitId) throws Exception {
        ResultSet rs = null;
        String sql = "select ur.* from unit_rate as ur, unit as b, unit as p"
                + " where ur.base_unit_id=b.id and ur.parent_unit_id=p.id and b.id=" + baseUnitId + " and p.id=" + parentUnitId
                + " and b.status=" + EmployeeBean.STATUS_ACTIVE + " and p.status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                UnitRateBean bean = new UnitRateBean();
                bean.setId(rs.getInt("id"));
                bean.setBaseUnitId(rs.getInt("base_unit_id"));
                bean.setParentUnitId(rs.getInt("parent_unit_id"));
                bean.setRate(rs.getFloat("rate"));
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

    public void insertUnitRate(UnitRateBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into unit_rate(base_unit_id, parent_unit_id, rate) Values (" + bean.getBaseUnitId() + "," + bean.getParentUnitId() + "," + bean.getRate() + ")";
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

    public void updateUnitRate(UnitRateBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update unit_rate Set "
                    + " base_unit_id=" + bean.getBaseUnitId()
                    + ", parent_unit_id=" + bean.getParentUnitId()
                    + ", rate=" + bean.getRate()
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

    public int deleteUnitRate(int id) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From unit_rate Where id=" + id;
            result = DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

}
