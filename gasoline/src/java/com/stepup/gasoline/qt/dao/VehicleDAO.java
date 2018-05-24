/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.RouteBean;
import com.stepup.gasoline.qt.bean.VehicleBean;
import com.stepup.gasoline.qt.route.RouteFormBean;
import com.stepup.gasoline.qt.vehicle.VehicleFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class VehicleDAO extends BasicDAO {

    public ArrayList getVehicles() throws Exception {
        ResultSet rs = null;
        String sql = "select * from vehicle where 1";
        sql += " order by plate";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleFormBean bean = null;
            while (rs.next()) {
                bean = new VehicleFormBean();
                bean.setId(rs.getInt("id"));
                bean.setPlate(rs.getString("plate"));
                bean.setNote(rs.getString("note"));
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

    public VehicleBean getVehicle(int vehicleId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vehicle where id=" + vehicleId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VehicleBean bean = new VehicleBean();
                bean.setId(rs.getInt("id"));
                bean.setPlate(rs.getString("plate"));
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

    public VehicleBean getVehicleByPlate(String plate) throws Exception {
        ResultSet rs = null;
        String sql = "select * from vehicle where plate='" + plate + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VehicleBean bean = new VehicleBean();
                bean.setId(rs.getInt("id"));
                bean.setPlate(rs.getString("plate"));
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

    public void insertVehicle(VehicleBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into vehicle (plate, note)"
                    + " Values ('" + bean.getPlate() + "','" + bean.getNote() + "')";
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

    public void updateVehicle(VehicleBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update vehicle Set "
                    + " plate='" + bean.getPlate() + "'"
                    + ", note='" + bean.getNote() + "'"
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

    public int deleteVehicle(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getRoutes() throws Exception {
        ResultSet rs = null;
        String sql = "select * from route where 1";
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            RouteFormBean bean = null;
            while (rs.next()) {
                bean = new RouteFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setDistance(rs.getFloat("distance"));
                bean.setNote(rs.getString("note"));
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

    public RouteBean getRoute(int routeId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from route where id=" + routeId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                RouteBean bean = new RouteBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setDistance(rs.getFloat("distance"));
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

    public RouteBean getRouteByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from route where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                RouteBean bean = new RouteBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setDistance(rs.getFloat("distance"));
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

    public void insertRoute(RouteBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into route (name, distance, note)"
                    + " Values ('" + bean.getName() + "'," + bean.getDistance() + ",'" + bean.getNote() + "')";
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

    public void updateRoute(RouteBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update route Set "
                    + " name='" + bean.getName() + "'"
                    + ", distance=" + bean.getDistance()
                    + ", note='" + bean.getNote() + "'"
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

    public int deleteRoute(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From route Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
}
