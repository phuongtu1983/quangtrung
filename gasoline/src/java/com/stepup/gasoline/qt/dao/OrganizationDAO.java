/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Types;

/**
 *
 * @author phuongtu
 */
public class OrganizationDAO extends BasicDAO {
//
//    public ArrayList getEquipments(int status) throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT e.id, e.NAME, e.name_en, e.CODE, e.uni_id, e.STATUS, e.brand, e.capacity, e.specification, e.design, u.NAME AS unit, e.quantity"
//                + ", e.type, et.name as typeName, (SELECT COALESCE(SUM(quantity),0) FROM area_detail WHERE equipment_id=e.id) AS areaQuantity"
//                + " FROM equipment AS e, unit AS u, equipment_type as et WHERE e.uni_id=u.id and e.type=et.id";
//        if (status != 0) {
//            sql += " and e.status=" + status;
//        }
//        sql += " order by e.name";
//        ArrayList equipmentList = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EquipmentFormBean bean = null;
//            while (rs.next()) {
//                bean = new EquipmentFormBean();
//                bean.setId(rs.getInt("id"));
//                bean.setName(rs.getString("name"));
//                bean.setNameEn(rs.getString("name_en"));
//                bean.setCode(rs.getString("code"));
//                bean.setUniId(rs.getInt("uni_id"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setUnitName(rs.getString("unit"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                bean.setBrand(rs.getString("brand"));
//                bean.setCapacity(rs.getString("capacity"));
//                bean.setSpecification(rs.getString("specification"));
//                bean.setDesign(rs.getString("design"));
//                bean.setQuantity(rs.getDouble("quantity"));
//                bean.setType(rs.getInt("type"));
//                bean.setTypeText(rs.getString("typeName"));
//                bean.setAreaQuantity(rs.getDouble("areaQuantity"));
//                equipmentList.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return equipmentList;
//    }
//
//    public ArrayList getEquipmentsOfRoom(int status) throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT e.NAME, e.name_en, e.CODE, e.uni_id, e.STATUS, e.brand, e.capacity, e.specification, e.design, u.NAME AS unit, e.TYPE"
//                + ", r.NAME AS areaName, et.name as typeName, re.quantity"
//                + " FROM area AS r, area_detail AS re, equipment AS e, unit AS u, equipment_type as et"
//                + " WHERE e.uni_id=u.id AND r.id=re.area_id AND re.equipment_id=e.id and e.type=et.id";
//        if (status != 0) {
//            sql += " and e.status=" + status;
//        }
//        sql += " order by r.NAME";
//        ArrayList equipmentList = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EquipmentAreaFormBean bean = null;
//            while (rs.next()) {
//                bean = new EquipmentAreaFormBean();
//                bean.setName(rs.getString("name"));
//                bean.setNameEn(rs.getString("name_en"));
//                bean.setCode(rs.getString("code"));
//                bean.setUniId(rs.getInt("uni_id"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setUnitName(rs.getString("unit"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                bean.setBrand(rs.getString("brand"));
//                bean.setCapacity(rs.getString("capacity"));
//                bean.setSpecification(rs.getString("specification"));
//                bean.setDesign(rs.getString("design"));
//                bean.setQuantity(rs.getDouble("quantity"));
//                bean.setType(rs.getInt("type"));
//                bean.setAreaName(rs.getString("areaName"));
//                bean.setTypeText(rs.getString("typeName"));
//                equipmentList.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return equipmentList;
//    }
//
//    public EquipmentFormBean getEquipment(int equipmentId) throws Exception {
//        ResultSet rs = null;
//        String sql = "select e.*, u.name as unit"
//                + " from equipment as e, unit as u where e.uni_id=u.id and e.id=" + equipmentId;
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                EquipmentFormBean bean = new EquipmentFormBean();
//                bean.setId(rs.getInt("id"));
//                bean.setName(rs.getString("name"));
//                bean.setNameEn(rs.getString("name_en"));
//                bean.setCode(rs.getString("code"));
//                bean.setUniId(rs.getInt("uni_id"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setUnitName(rs.getString("unit"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                bean.setBrand(rs.getString("brand"));
//                bean.setCapacity(rs.getString("capacity"));
//                bean.setSpecification(rs.getString("specification"));
//                bean.setDesign(rs.getString("design"));
//                bean.setQuantity(rs.getDouble("quantity"));
//                bean.setType(rs.getInt("type"));
//                bean.setAccountId(rs.getInt("account_id"));
//                bean.setPrice(rs.getDouble("price"));
//                return bean;
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return null;
//    }
//
//    public EquipmentFormBean getEquipmentByName(String name) throws Exception {
//        ResultSet rs = null;
//        String sql = "select e.*, u.name as unit from equipment as e, unit as u"
//                + " where e.uni_id=u.id and e.name='" + name + "'";
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                EquipmentFormBean bean = new EquipmentFormBean();
//                bean.setId(rs.getInt("id"));
//                bean.setName(rs.getString("name"));
//                bean.setNameEn(rs.getString("name_en"));
//                bean.setCode(rs.getString("code"));
//                bean.setUniId(rs.getInt("uni_id"));
//                bean.setStatus(rs.getInt("status"));
//                bean.setUnitName(rs.getString("unit"));
//                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.active"));
//                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
//                    bean.setStatusName(PNUtil.getBundleString("employee.detail.status.inactive"));
//                }
//                bean.setBrand(rs.getString("brand"));
//                bean.setCapacity(rs.getString("capacity"));
//                bean.setSpecification(rs.getString("specification"));
//                bean.setDesign(rs.getString("design"));
//                bean.setQuantity(rs.getDouble("quantity"));
//                bean.setType(rs.getInt("type"));
//                return bean;
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return null;
//    }
//
//    public int insertEquipment(EquipmentBean bean) throws Exception {
//        if (bean == null) {
//            return 0;
//        }
//        int result = 0;
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call insertEquipment(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setString("_name", bean.getName());
//                spUtil.getCallableStatement().setString("_name_en", bean.getNameEn());
//                spUtil.getCallableStatement().setString("_code", bean.getCode());
//                spUtil.getCallableStatement().setInt("_uni_id", bean.getUniId());
//                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
//                spUtil.getCallableStatement().setString("_brand", bean.getBrand());
//                spUtil.getCallableStatement().setString("_capacity", bean.getCapacity());
//                spUtil.getCallableStatement().setString("_specification", bean.getSpecification());
//                spUtil.getCallableStatement().setString("_design", bean.getDesign());
//                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
//                spUtil.getCallableStatement().setInt("_type", bean.getType());
//                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
//                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
////                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
//                spUtil.execute();
////                result = spUtil.getCallableStatement().getInt("_id");
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//        return result;
//    }
//
//    public void updateEquipment(EquipmentBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call updateEquipment(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setString("_name", bean.getName());
//                spUtil.getCallableStatement().setString("_name_en", bean.getNameEn());
//                spUtil.getCallableStatement().setString("_code", bean.getCode());
//                spUtil.getCallableStatement().setInt("_uni_id", bean.getUniId());
//                spUtil.getCallableStatement().setInt("_status", bean.getStatus());
//                spUtil.getCallableStatement().setString("_brand", bean.getBrand());
//                spUtil.getCallableStatement().setString("_capacity", bean.getCapacity());
//                spUtil.getCallableStatement().setString("_specification", bean.getSpecification());
//                spUtil.getCallableStatement().setString("_design", bean.getDesign());
//                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
//                spUtil.getCallableStatement().setInt("_type", bean.getType());
//                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
//                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
//                spUtil.getCallableStatement().setInt("_id", bean.getId());
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }
//
//    public ArrayList getEquipmentBrokenInvoices(String fromDate, String endDate) throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT i.*, e.fullname, p.area_name"
//                + " FROM equipment_broken_invoice AS i"
//                + " left join serve as s on i.service_position=s.id"
//                + " left join view_serve_position as p on s.kind=p.kind and s.parent_id=p.id"
//                + ", user as u, employee as e"
//                + " WHERE i.created_user_id=u.id and u.emp_id=e.id ";
//
//        if (!StringUtil.isBlankOrNull(fromDate)) {
//            sql = sql + " and DATE(i.created_date) >= STR_TO_DATE('" + fromDate + "','%d/%m/%Y')";
//        }
//        if (!StringUtil.isBlankOrNull(endDate)) {
//            sql = sql + " and DATE(i.created_date) <= STR_TO_DATE('" + endDate + "','%d/%m/%Y')";
//        }
//        sql += " order by i.id desc";
//        ArrayList list = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EquipmentBrokenInvoiceFormBean bean = null;
//            while (rs.next()) {
//                bean = new EquipmentBrokenInvoiceFormBean();
//                bean.setId(rs.getInt("id"));
//                bean.setCode(rs.getString("code"));
//                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
//                bean.setCreatedUserId(rs.getInt("created_user_id"));
//                bean.setService(rs.getString("service"));
//                bean.setServicePosition(rs.getInt("service_position"));
//                bean.setServicePositionText(rs.getString("area_name"));
//                bean.setTotal(rs.getDouble("total"));
//                bean.setEmployee(rs.getString("fullname"));
//                list.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return list;
//    }
//
//    public EquipmentBrokenInvoiceBean getEquipmentBrokenInvoice(int equipmentBrokenInvoiceId) throws Exception {
//        ResultSet rs = null;
//        String sql = "select i.* from equipment_broken_invoice as i where i.id=" + equipmentBrokenInvoiceId;
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                EquipmentBrokenInvoiceBean bean = new EquipmentBrokenInvoiceBean();
//                bean.setId(rs.getInt("id"));
//                bean.setCode(rs.getString("code"));
//                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
//                bean.setCreatedUserId(rs.getInt("created_user_id"));
//                bean.setService(rs.getString("service"));
//                bean.setServicePosition(rs.getInt("service_position"));
//                bean.setTotal(rs.getDouble("total"));
//                bean.setNote(rs.getString("note"));
//                return bean;
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return null;
//    }
//
//    public ArrayList getEquipmentBrokenInvoiceDetail(int equipmentBrokenInvoiceId) throws Exception {
//        ResultSet rs = null;
//        String sql = "select det.*, e.name as equipmentName, e.code as equipmentCode, u.name as unitName"
//                + " from equipment_broken_invoice_detail as det, equipment as e, unit as u"
//                + " where det.equipment_id=e.id and det.unit_id=u.id and det.equipment_broken_invoice_id=" + equipmentBrokenInvoiceId;
//        ArrayList detailList = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            EquipmentBrokenInvoiceDetailFormBean bean = null;
//            while (rs.next()) {
//                bean = new EquipmentBrokenInvoiceDetailFormBean();
//                bean.setId(rs.getInt("id"));
//                bean.setMinibarInvoiceId(rs.getInt("equipment_broken_invoice_id"));
//                bean.setEquipmentId(rs.getInt("equipment_id"));
//                bean.setEquipmentName(rs.getString("equipmentName"));
//                bean.setEquipmentCode(rs.getString("equipmentCode"));
//                bean.setUnitId(rs.getInt("unit_id"));
//                bean.setUnitName(rs.getString("unitName"));
//                bean.setQuantity(rs.getDouble("quantity"));
//                bean.setPrice(rs.getDouble("price"));
//                bean.setTotal(rs.getDouble("total"));
//                detailList.add(bean);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//        }
//        return detailList;
//    }
//
//    public String getNextEquipmentBrokenInvoiceNumber(String prefix, int length) throws Exception {
//        String result = "";
//        try {
//            result = this.getNextNumber(prefix, length, "code", "equipment_broken_invoice");
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        }
//        return result;
//    }
//
//    public int insertEquipmentBrokenInvoice(EquipmentBrokenInvoiceBean bean) throws Exception {
//        if (bean == null) {
//            return 0;
//        }
//        int result = 0;
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call insertEquipmentBrokenInvoice(?,?,?,?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setString("_code", bean.getCode());
//                spUtil.getCallableStatement().setInt("_created_user_id", bean.getCreatedUserId());
//                spUtil.getCallableStatement().setString("_service", bean.getService());
//                spUtil.getCallableStatement().setInt("_service_position", bean.getServicePosition());
//                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
//                spUtil.getCallableStatement().setString("_note", bean.getNote());
//                spUtil.getCallableStatement().registerOutParameter("_id", Types.INTEGER);
//                spUtil.execute();
//                result = spUtil.getCallableStatement().getInt("_id");
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//        return result;
//    }
//
//    public void updateEquipmentBrokenInvoice(EquipmentBrokenInvoiceBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        try {
//            String sql = "";
//            sql += "update equipment_broken_invoice set"
//                    + " service='" + bean.getService() + "'"
//                    + ", service_position=" + bean.getServicePosition()
//                    + ", total=" + bean.getTotal()
//                    + ", note='" + bean.getNote() + "'"
//                    + " where id=" + bean.getId();
//            DBUtil.executeUpdate(sql);
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//
//        }
//    }
//
//    public void insertEquipmentBrokenInvoiceDetail(EquipmentBrokenInvoiceDetailBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call insertEquipmentBrokenInvoiceDetail(?,?,?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setInt("_ebi_id", bean.getEquipmentBrokenInvoiceId());
//                spUtil.getCallableStatement().setInt("_equipment_id", bean.getEquipmentId());
//                spUtil.getCallableStatement().setInt("_unit_id", bean.getUnitId());
//                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
//                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
//                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }
//
//    public void updateEquipmentBrokenInvoiceDetail(EquipmentBrokenInvoiceDetailBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call updateEquipmentBrokenInvoiceDetail(?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setInt("_id", bean.getId());
//                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
//                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
//                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }
//
//    public void deleteEquipmentBrokenInvoiceDetail(String ids) throws Exception {
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call deleteEquipmentBrokenInvoiceDetail(?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setString("_ids", ids);
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }
//
//    public void deleteEquipmentBrokenInvoice(int id) throws Exception {
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call deleteEquipmentBrokenInvoice(?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setInt("_id", id);
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }

    public ArrayList getOrganizations(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organization where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            OrganizationBean bean = null;
            while (rs.next()) {
                bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
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

    public OrganizationBean getOrganization(int organizationId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organizationBean where id=" + organizationId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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

    public OrganizationBean getOrganizationByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organization where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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

    public void insertOrganization(OrganizationBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into organizationBean (name, code, address, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "','" + bean.getAddress() + "'," + bean.getStatus() + ")";
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

    public void updateOrganization(OrganizationBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update organization Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + ", address='" + bean.getAddress() + "'"
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

//    public void insertEquipmentFromExcel(EquipmentUploadBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        SPUtil spUtil = null;
//        try {
//            String sql = "{call insertEquipmentFromExcel(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
//            spUtil = new SPUtil(sql);
//            if (spUtil != null) {
//                spUtil.getCallableStatement().setString("_code", bean.getCode());
//                spUtil.getCallableStatement().setString("_name", bean.getName());
//                spUtil.getCallableStatement().setString("_name_en", bean.getNameEn());
//                spUtil.getCallableStatement().setString("_unit_name", bean.getUnitName());
//                spUtil.getCallableStatement().setString("_unit_code", bean.getUnitCode());
//                spUtil.getCallableStatement().setString("_brand", bean.getBrand());
//                spUtil.getCallableStatement().setString("_capacity", bean.getCapacity());
//                spUtil.getCallableStatement().setString("_specification", bean.getSpecification());
//                spUtil.getCallableStatement().setString("_design", bean.getDesign());
//                spUtil.getCallableStatement().setDouble("_quantity", bean.getQuantity());
//                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
//                spUtil.getCallableStatement().setString("_account", bean.getAccountCode());
//                spUtil.getCallableStatement().setString("_equipment_type", bean.getEquipmentType());
//                spUtil.getCallableStatement().setString("_equipment_type_code", bean.getEquipmentTypeCode());
//                spUtil.execute();
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            try {
//                if (spUtil != null) {
//                    spUtil.closeConnection();
//                }
//            } catch (Exception e) {
//                throw new Exception(e.getMessage());
//            }
//        }
//    }
}
