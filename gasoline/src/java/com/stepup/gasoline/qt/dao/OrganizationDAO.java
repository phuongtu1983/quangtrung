/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.bean.OrganizationTimesheetFieldBean;
import com.stepup.gasoline.qt.bean.StoreBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueFormBean;
import com.stepup.gasoline.qt.store.StoreFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class OrganizationDAO extends BasicDAO {

    public ArrayList getOrganizations(int status, String ids) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organization where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        if (!ids.isEmpty()) {
            sql += " and id in(" + ids + ")";
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

    public ArrayList getOrganizations(String ids) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organization where id in (" + ids + ") and status=" + EmployeeBean.STATUS_ACTIVE;
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
        String sql = "select * from organization where id=" + organizationId + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                bean.setPhone(rs.getString("phone"));
                bean.setFax(rs.getString("fax"));
                bean.setBankAccount(rs.getString("bank_account"));
                bean.setTax(rs.getString("tax"));
                bean.setPresenter(rs.getString("presenter"));
                bean.setPresenterPosition(rs.getString("presenter_position"));
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

    public OrganizationBean getOrganization(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select * from organization where id in(" + organizationIds + ") and status=" + EmployeeBean.STATUS_ACTIVE +" limit 1";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                bean.setPhone(rs.getString("phone"));
                bean.setFax(rs.getString("fax"));
                bean.setBankAccount(rs.getString("bank_account"));
                bean.setTax(rs.getString("tax"));
                bean.setPresenter(rs.getString("presenter"));
                bean.setPresenterPosition(rs.getString("presenter_position"));
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

    public OrganizationBean getOrganizationByEmployee(int employeeId) throws Exception {
        ResultSet rs = null;
        String sql = "select o.id, o.status, coalesce(o.name,'') as name, coalesce(o.code,'') as code, coalesce(o.address,'') as address"
                + ", coalesce(o.phone,'') as phone, coalesce(o.fax,'') as fax, coalesce(o.bank_account,'') as bank_account, coalesce(o.tax,'') as tax"
                + ", coalesce(o.presenter,'') as presenter, coalesce(o.presenter_position,'') as presenter_position"
                + " from organization as o, employee as e where o.id=e.organization_id and e.id=" + employeeId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                bean.setPhone(rs.getString("phone"));
                bean.setFax(rs.getString("fax"));
                bean.setBankAccount(rs.getString("bank_account"));
                bean.setTax(rs.getString("tax"));
                bean.setPresenter(rs.getString("presenter"));
                bean.setPresenterPosition(rs.getString("presenter_position"));
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
        String sql = "select * from organization where name='" + name + "'"
                + " and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OrganizationBean bean = new OrganizationBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setAddress(rs.getString("address"));
                bean.setStatus(rs.getInt("status"));
                bean.setPhone(rs.getString("phone"));
                bean.setFax(rs.getString("fax"));
                bean.setBankAccount(rs.getString("bank_account"));
                bean.setTax(rs.getString("tax"));
                bean.setPresenter(rs.getString("presenter"));
                bean.setPresenterPosition(rs.getString("presenter_position"));
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

    public int insertOrganization(OrganizationBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int id = 0;
        try {
            String sql = "";
            sql = "Insert Into organization (name, code, address, status, phone, fax, bank_account, tax, presenter, presenter_position)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "','" + bean.getAddress() + "'," + bean.getStatus() + ",'" + bean.getPhone() + "','"
                    + bean.getFax() + "','" + bean.getBankAccount() + "','" + bean.getTax() + "','" + bean.getPresenter() + "','" + bean.getPresenterPosition() + "')";
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

    public void updateOrganization(OrganizationBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update organization Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + ", address='" + bean.getAddress() + "'"
                    + ", phone='" + bean.getPhone() + "'"
                    + ", fax='" + bean.getFax() + "'"
                    + ", bank_account='" + bean.getBankAccount() + "'"
                    + ", tax='" + bean.getTax() + "'"
                    + ", presenter='" + bean.getPresenter() + "'"
                    + ", presenter_position='" + bean.getPresenterPosition() + "'"
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

    public ArrayList getStores(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT s.id, s.code, s.name, s.status, o.name as organization_name"
                + " FROM store AS s, organization as o WHERE s.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and s.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and s.organization_id in(" + organizationIds + ")";
        }
        sql += " order by s.name";
        ArrayList equipmentList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            StoreFormBean bean = null;
            while (rs.next()) {
                bean = new StoreFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                bean.setOrganizationName(rs.getString("organization_name"));
                equipmentList.add(bean);
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
        return equipmentList;
    }

    public ArrayList getStores(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT s.id, s.code, s.name, s.status, o.name as organization_name"
                + " FROM store AS s, organization as o WHERE s.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE + " and s.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and o.id in (" + organizationIds + ")";
        }
        sql += " order by s.name";
        ArrayList equipmentList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            StoreFormBean bean = null;
            while (rs.next()) {
                bean = new StoreFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                bean.setOrganizationName(rs.getString("organization_name"));
                equipmentList.add(bean);
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
        return equipmentList;
    }

    public StoreFormBean getStore(int storeId) throws Exception {
        ResultSet rs = null;
        String sql = "select s.* from store as s where s.id=" + storeId + " and s.status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                StoreFormBean bean = new StoreFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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

    public StoreFormBean getStoreByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select s.* from store as s where s.name='" + name + "' and s.status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                StoreFormBean bean = new StoreFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
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

    public void insertStore(StoreBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into store (name, code, organization_id, status)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getOrganizationId() + "," + bean.getStatus() + ")";
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

    public void updateStore(StoreBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update store Set "
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

    public ArrayList getOrganizationTimesheetField(int employeeId, int organizationId, String tableName) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT COALESCE(s.id,0) AS id, f.id AS field_id, f.NAME, s.amount AS VALUE"
                + " FROM dynamic_field AS f LEFT JOIN salary_timesheet_field AS s ON f.id=s.field_id AND s.organization_id=" + organizationId
                + " WHERE f.organization_id=" + organizationId + " AND table_name='" + tableName + "'"
                + " order by s.field_id";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            DynamicFieldValueFormBean bean = null;
            while (rs.next()) {
                bean = new DynamicFieldValueFormBean();
                bean.setId(rs.getInt("id"));
                bean.setFieldId(rs.getInt("field_id"));
                bean.setName(rs.getString("name"));
                bean.setValue(rs.getString("value"));
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

    public void insertOrganizationTimesheetField(OrganizationTimesheetFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into salary_timesheet_field (organization_id, field_id, amount)"
                    + " Values (" + bean.getOrganizationId() + "," + bean.getFieldId() + "," + bean.getAmount() + ")";
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

    public void updateOrganizationTimesheetField(OrganizationTimesheetFieldBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update salary_timesheet_field Set amount=" + bean.getAmount() + " Where id=" + bean.getId();
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
