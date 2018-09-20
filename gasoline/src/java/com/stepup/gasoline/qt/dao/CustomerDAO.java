/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class CustomerDAO extends BasicDAO {

    public ArrayList getCustomers(int status, String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select c.*, o.name as organization_name from customer as c, organization as o where c.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (status != 0) {
            sql += " and c.status=" + status;
        }
        if (!organizationIds.isEmpty()) {
            sql += " and c.organization_id in(" + organizationIds + ")";
        }
        sql += " order by c.name desc";
        ArrayList customerList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            CustomerFormBean bean = null;
            while (rs.next()) {
                bean = new CustomerFormBean();
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
                bean.setKind(rs.getInt("kind"));
                if (bean.getKind() == CustomerBean.KIND_RETAIL) {
                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.retail"));
                } else if (bean.getKind() == CustomerBean.KIND_WHOLESALE) {
                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
                }
                customerList.add(bean);
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
        return customerList;
    }

    public ArrayList getCustomers(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "select c.*, o.name as organization_name from customer as c, organization as o where c.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE
                + " and c.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and c.organization_id in (" + organizationIds + ")";
        }
        sql += " order by c.name desc";
        ArrayList customerList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            CustomerFormBean bean = null;
            while (rs.next()) {
                bean = new CustomerFormBean();
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
                bean.setKind(rs.getInt("kind"));
                if (bean.getKind() == CustomerBean.KIND_RETAIL) {
                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.retail"));
                } else if (bean.getKind() == CustomerBean.KIND_WHOLESALE) {
                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
                }
                customerList.add(bean);
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
        return customerList;
    }

    public ArrayList getCustomers(String organizationIds, int kind) throws Exception {
        ResultSet rs = null;
        String sql = "select c.*, o.name as organization_name from customer as c, organization as o where c.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE
                + " and c.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and c.organization_id in (" + organizationIds + ")";
        }
        if (kind != 0) {
            sql += " and c.kind=" + kind;
        }
        sql += " order by c.name desc";
        ArrayList customerList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            CustomerFormBean bean = null;
            while (rs.next()) {
                bean = new CustomerFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
                bean.setOrganizationId(rs.getInt("organization_id"));
                bean.setOrganizationName(rs.getString("organization_name"));
                bean.setStatus(rs.getInt("status"));
                bean.setKind(rs.getInt("kind"));
                customerList.add(bean);
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
        return customerList;
    }

    public CustomerFormBean getCustomer(int customerId) throws Exception {
        ResultSet rs = null;
        String sql = "select id, status, organization_id, kind, coalesce(code,'') as code, coalesce(name,'') as name, coalesce(address,'') as address"
                + ", coalesce(phone,'') as phone, coalesce(bank_account,'') as bank_account, coalesce(tax,'') as tax, coalesce(presenter,'') as presenter"
                + ", coalesce(presenter_position,'') as presenter_position"
                + " from customer where id=" + customerId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                CustomerFormBean customer = new CustomerFormBean();
                customer.setId(rs.getInt("id"));
                customer.setCode(rs.getString("code"));
                customer.setName(rs.getString("name"));
                customer.setStatus(rs.getInt("status"));
                customer.setOrganizationId(rs.getInt("organization_id"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setBankAccount(rs.getString("bank_account"));
                customer.setTax(rs.getString("tax"));
                customer.setPresenter(rs.getString("presenter"));
                customer.setPresenterPosition(rs.getString("presenter_position"));
                if (customer.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    customer.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (customer.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    customer.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                customer.setKind(rs.getInt("kind"));
                if (customer.getKind() == CustomerBean.KIND_RETAIL) {
                    customer.setStatusName(QTUtil.getBundleString("customer.detail.kind.retail"));
                } else if (customer.getKind() == CustomerBean.KIND_WHOLESALE) {
                    customer.setStatusName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
                }
                return customer;
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

    public CustomerFormBean getCustomerByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from customer where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                CustomerFormBean customer = new CustomerFormBean();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setCode(rs.getString("code"));
                customer.setOrganizationId(rs.getInt("organization_id"));
                customer.setStatus(rs.getInt("status"));
                customer.setKind(rs.getInt("kind"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setBankAccount(rs.getString("bank_account"));
                customer.setTax(rs.getString("tax"));
                customer.setPresenter(rs.getString("presenter"));
                customer.setPresenterPosition(rs.getString("presenter_position"));
                return customer;
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

    public int insertCustomer(CustomerBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "";
            sql = "Insert Into customer (name, code, organization_id, status, kind, phone, bank_account, tax, presenter, presenter_position, address)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getOrganizationId() + "," + bean.getStatus() + "," + bean.getKind()
                    + ",'" + bean.getPhone() + "','" + bean.getBankAccount() + "','" + bean.getTax() + "','" + bean.getPresenter()
                    + "','" + bean.getPresenterPosition() + "','" + bean.getAddress() + "')";
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

    public void updateCustomer(CustomerBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update customer Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
                    + ", organization_id=" + bean.getOrganizationId()
                    + ", status=" + bean.getStatus()
                    + ", kind=" + bean.getKind()
                    + ", address='" + bean.getAddress() + "'"
                    + ", phone='" + bean.getPhone() + "'"
                    + ", bank_account='" + bean.getBankAccount() + "'"
                    + ", tax='" + bean.getTax() + "'"
                    + ", presenter='" + bean.getPresenter() + "'"
                    + ", presenter_position='" + bean.getPresenterPosition() + "'"
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
