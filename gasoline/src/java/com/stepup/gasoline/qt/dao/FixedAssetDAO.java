/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.FixedAssetBean;
import com.stepup.gasoline.qt.bean.FixedAssetDepreciationBean;
import com.stepup.gasoline.qt.bean.FixedAssetDepreciationDetailBean;
import com.stepup.gasoline.qt.bean.FixedAssetGroupBean;
import com.stepup.gasoline.qt.fixedasset.FixedAssetFormBean;
import com.stepup.gasoline.qt.fixedassetdepreciation.FixedAssetDepreciationFormBean;
import com.stepup.gasoline.qt.fixedassetgroup.FixedAssetGroupFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class FixedAssetDAO extends BasicDAO {

    public ArrayList getFixedAssetGroups(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select a.*, o.name as organization_name from fixed_asset_group as a, organization as o where a.organization_id=o.id";
        if (!organizationIds.isEmpty()) {
            sql += " and a.organization_id in(" + organizationIds + ")";
        }
        sql += " order by a.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            FixedAssetGroupFormBean bean = null;
            while (rs.next()) {
                bean = new FixedAssetGroupFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setOrganizationName(rs.getString("organization_name"));
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

    public FixedAssetGroupBean getFixedAssetGroup(int fixedAssetGroupId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from fixed_asset_group where id=" + fixedAssetGroupId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FixedAssetGroupBean bean = new FixedAssetGroupBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public FixedAssetGroupBean getFixedAssetGroupByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from fixed_asset_group where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FixedAssetGroupBean bean = new FixedAssetGroupBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public int insertFixedAssetGroup(FixedAssetGroupBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int id = 0;
        try {
            String sql = "";
            sql = "Insert Into fixed_asset_group (name, organization_id)"
                    + " Values ('" + bean.getName() + "'," + bean.getOrganizationId() + ")";
            id = DBUtil.executeInsert(sql);
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
        return id;
    }

    public void updateFixedAssetGroup(FixedAssetGroupBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update fixed_asset_group Set "
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

    public void deleteFixedAssetGroup(String ids) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteFixedAssetGroup(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_ids", ids);
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

    public ArrayList getFixedAssets(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select a.*, o.name as group_name from fixed_asset as a, fixed_asset_group as o where a.group_id=o.id";
        if (!organizationIds.isEmpty()) {
            sql += " and o.organization_id in(" + organizationIds + ")";
        }
        sql += " order by a.name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            FixedAssetFormBean bean = null;
            while (rs.next()) {
                bean = new FixedAssetFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setGroupName(rs.getString("group_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setGroupId(rs.getInt("group_id"));
                bean.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setRate(rs.getInt("rate"));
                bean.setMonthCount(rs.getInt("month_count"));
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

    public FixedAssetBean getFixedAsset(int fixedAssetId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from fixed_asset where id=" + fixedAssetId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FixedAssetBean bean = new FixedAssetBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setGroupId(rs.getInt("group_id"));
                bean.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setRate(rs.getInt("rate"));
                bean.setMonthCount(rs.getInt("month_count"));
                bean.setPrice(rs.getDouble("price"));
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

    public FixedAssetBean getFixedAssetByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from fixed_asset where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FixedAssetBean bean = new FixedAssetBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setGroupId(rs.getInt("group_id"));
                bean.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setRate(rs.getInt("rate"));
                bean.setMonthCount(rs.getInt("month_count"));
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

    public int insertFixedAsset(FixedAssetBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int id = 0;
        try {
            String startDate = "";
            if (GenericValidator.isBlankOrNull(bean.getStartDate())) {
                startDate = "null";
            } else {
                startDate = "STR_TO_DATE('" + bean.getStartDate() + "','%d/%m/%Y')";
            }
            String sql = "";
            sql = "Insert Into fixed_asset (name, group_id, unit_id, start_date, quantity, rate, month_count, status,price)"
                    + " Values ('" + bean.getName() + "'," + bean.getGroupId() + "," + bean.getUnitId() + "," + startDate + "," + bean.getQuantity()
                    + "," + bean.getRate() + "," + bean.getMonthCount() + "," + bean.getStatus() + "," + bean.getPrice() + ")";
            id = DBUtil.executeInsert(sql);
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
        return id;
    }

    public void updateFixedAsset(FixedAssetBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String startDate = "";
            if (GenericValidator.isBlankOrNull(bean.getStartDate())) {
                startDate = "null";
            } else {
                startDate = "STR_TO_DATE('" + bean.getStartDate() + "','%d/%m/%Y')";
            }
            String sql = "Update fixed_asset Set "
                    + " name='" + bean.getName() + "'"
                    + ", group_id=" + bean.getGroupId()
                    + ", unit_id=" + bean.getUnitId()
                    + ", start_date=" + startDate
                    + ", quantity=" + bean.getQuantity()
                    + ", rate=" + bean.getRate()
                    + ", month_count=" + bean.getMonthCount()
                    + ", status=" + bean.getStatus()
                    + ", price=" + bean.getPrice()
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

    public void deleteFixedAsset(String ids) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteFixedAsset(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_ids", ids);
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

    public ArrayList searchFixedAssetDepreciation(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchFixedAssetDepreciation(?,?)}";
            if (org.apache.commons.validator.GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (org.apache.commons.validator.GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    FixedAssetDepreciationFormBean bean = null;
                    while (rs.next()) {
                        bean = new FixedAssetDepreciationFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
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

    public void deleteFixedAssetDepreciation(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteFixedAssetDepreciation(?)}";
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

    public FixedAssetDepreciationBean getFixedAssetDepreciation(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from fixed_asset_depreciation where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FixedAssetDepreciationBean bean = new FixedAssetDepreciationBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
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

    public ArrayList getFixedAssetDepreciationDetail(int fixedAssetDepreciationId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call getFixedAssetDepreciationDetail(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_fixed_asset_depreciation_id", fixedAssetDepreciationId);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    FixedAssetDepreciationDetailBean bean = null;
                    while (rs.next()) {
                        bean = new FixedAssetDepreciationDetailBean();
                        bean.setId(rs.getInt("id"));
                        bean.setFixedAssetDepreciationId(rs.getInt("fixed_asset_depreciation_id"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setFixedAssetId(rs.getInt("fixed_asset_id"));
                        bean.setFixedAssetName(rs.getString("fixed_asset_name"));
                        bean.setUnitId(rs.getInt("unit_id"));
                        bean.setUnitName(rs.getString("unit_name"));
                        bean.setIsCalculate(rs.getInt("is_calculate"));
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

    public String getNextFixedAssetDepreciationNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "fixed_asset_depreciation");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertFixedAssetDepreciation(FixedAssetDepreciationBean bean) throws Exception {
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
            String sql = "{call insertFixedAssetDepreciation(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public void updateFixedAssetDepreciation(FixedAssetDepreciationBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateFixedAssetDepreciation(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
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

    public int insertFixedAssetDepreciationDetail(FixedAssetDepreciationDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertFixedAssetDepreciationDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_fixed_asset_depreciation_id", bean.getFixedAssetDepreciationId());
                spUtil.getCallableStatement().setInt("_fixed_asset_id", bean.getFixedAssetId());
                spUtil.getCallableStatement().setDouble("_is_calculate", bean.getIsCalculate());
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

    public void updateFixedAssetDepreciationDetail(FixedAssetDepreciationDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateFixedAssetDepreciationDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_is_calculate", bean.getIsCalculate());
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

    public void autoCreateFixedAssetDepreciation(String code) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call autoCreateFixedAssetDepreciation(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", code);
                rs = spUtil.executeQuery();
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
    }

}
