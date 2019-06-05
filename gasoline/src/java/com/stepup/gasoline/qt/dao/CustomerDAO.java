/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.agency.AgencyFormBean;
import com.stepup.gasoline.qt.bean.AgencyBean;
import com.stepup.gasoline.qt.bean.AgencyCommissionDetailBean;
import com.stepup.gasoline.qt.bean.AgencyCustomerDetailBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.CustomerDocumentBean;
import com.stepup.gasoline.qt.bean.DiscountBean;
import com.stepup.gasoline.qt.bean.DiscountCommissionDetailBean;
import com.stepup.gasoline.qt.bean.DocumentBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.customerdocument.CustomerDocumentFormBean;
import com.stepup.gasoline.qt.discount.DiscountFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.commons.validator.GenericValidator;

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
//                bean.setKind(rs.getInt("kind"));
//                if (bean.getKind() == CustomerBean.KIND_RETAIL) {
//                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.retail"));
//                } else if (bean.getKind() == CustomerBean.KIND_WHOLESALE) {
//                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
//                }
                if (bean.getCommissionKind() == CustomerBean.COMMISSION_KIND_BILL) {
                    bean.setCommissionKindName(QTUtil.getBundleString("customer.detail.commission.bill"));
                } else if (bean.getCommissionKind() == CustomerBean.COMMISSION_KIND_DIRECTLY) {
                    bean.setCommissionKindName(QTUtil.getBundleString("customer.detail.kind.directly"));
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

    public ArrayList getCustomers(String organizationIds, int customerKind) throws Exception {
        ResultSet rs = null;
        String sql = "select c.*, o.name as organization_name from customer as c, organization as o where c.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE
                + " and c.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and c.organization_id in (" + organizationIds + ")";
        }
        switch (customerKind) {
            case VendorBean.IS_GAS:
                sql += " and c.is_gas=1";
                break;
            case VendorBean.IS_PETRO:
                sql += " and c.is_petro=1";
                break;
            case VendorBean.IS_GOOD:
                sql += " and c.is_good=1";
                break;
            case VendorBean.IS_OIL:
                sql += " and c.is_oil=1";
                break;
            default:
                sql += " and c.is_gas=1 and c.is_petro=1 and c.is_good=1 or c.is_oil=1";
                break;
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
//                bean.setKind(rs.getInt("kind"));
//                if (bean.getKind() == CustomerBean.KIND_RETAIL) {
//                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.retail"));
//                } else if (bean.getKind() == CustomerBean.KIND_WHOLESALE) {
//                    bean.setKindName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
//                }
                if (bean.getCommissionKind() == CustomerBean.COMMISSION_KIND_BILL) {
                    bean.setCommissionKindName(QTUtil.getBundleString("customer.detail.commission.bill"));
                } else if (bean.getCommissionKind() == CustomerBean.COMMISSION_KIND_DIRECTLY) {
                    bean.setCommissionKindName(QTUtil.getBundleString("customer.detail.kind.directly"));
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

    public CustomerFormBean getCustomer(int customerId) throws Exception {
        ResultSet rs = null;
        String sql = "select id, status, organization_id, coalesce(code,'') as code, coalesce(name,'') as name, coalesce(address,'') as address"
                + ", coalesce(phone,'') as phone, coalesce(bank_account,'') as bank_account, coalesce(tax,'') as tax, coalesce(presenter,'') as presenter"
                + ", coalesce(presenter_position,'') as presenter_position, is_gas, is_petro, is_good, is_oil, commission_percentage, commission_kind"
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
//                customer.setDiscount(rs.getString("discount"));
                customer.setCommissionPercentage(rs.getFloat("commission_percentage"));
                if (customer.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    customer.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (customer.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    customer.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                customer.setCommissionKind(rs.getInt("commission_kind"));
//                customer.setKind(rs.getInt("kind"));
//                if (customer.getKind() == CustomerBean.KIND_RETAIL) {
//                    customer.setStatusName(QTUtil.getBundleString("customer.detail.kind.retail"));
//                } else if (customer.getKind() == CustomerBean.KIND_WHOLESALE) {
//                    customer.setStatusName(QTUtil.getBundleString("customer.detail.kind.wholesale"));
//                }
                if (customer.getCommissionKind() == CustomerBean.COMMISSION_KIND_BILL) {
                    customer.setCommissionKindName(QTUtil.getBundleString("customer.detail.commission.bill"));
                } else if (customer.getCommissionKind() == CustomerBean.COMMISSION_KIND_DIRECTLY) {
                    customer.setCommissionKindName(QTUtil.getBundleString("customer.detail.kind.directly"));
                }
                customer.setIsGas(rs.getInt("is_gas") == 1 ? true : false);
                customer.setIsPetro(rs.getInt("is_petro") == 1 ? true : false);
                customer.setIsGood(rs.getInt("is_good") == 1 ? true : false);
                customer.setIsOil(rs.getInt("is_oil") == 1 ? true : false);
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
//                customer.setKind(rs.getInt("kind"));
                customer.setCommissionKind(rs.getInt("commission_kind"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setBankAccount(rs.getString("bank_account"));
                customer.setTax(rs.getString("tax"));
                customer.setPresenter(rs.getString("presenter"));
                customer.setPresenterPosition(rs.getString("presenter_position"));
//                customer.setDiscount(rs.getString("discount"));
                customer.setCommissionPercentage(rs.getFloat("commission_percentage"));
                customer.setIsGas(rs.getInt("is_gas") == 1 ? true : false);
                customer.setIsPetro(rs.getInt("is_petro") == 1 ? true : false);
                customer.setIsGood(rs.getInt("is_good") == 1 ? true : false);
                customer.setIsOil(rs.getInt("is_oil") == 1 ? true : false);
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
            sql = "Insert Into customer (name, code, organization_id, status, phone, bank_account, tax, presenter, presenter_position, address, is_gas, is_petro, is_good, is_oil, commission_kind, commission_percentage)"
                    + " Values ('" + bean.getName() + "','" + bean.getCode() + "'," + bean.getOrganizationId() + "," + bean.getStatus()
                    + ",'" + bean.getPhone() + "','" + bean.getBankAccount() + "','" + bean.getTax() + "','" + bean.getPresenter()
                    + "','" + bean.getPresenterPosition() + "','" + bean.getAddress() + "'," + bean.getIsGas() + "," + bean.getIsPetro() + "," + bean.getIsGood() + "," + bean.getIsOil()
                    + "," + bean.getCommissionKind() + "," + bean.getCommissionPercentage() + ")";
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
                    //                    + ", kind=" + bean.getKind()
                    + ", address='" + bean.getAddress() + "'"
                    + ", phone='" + bean.getPhone() + "'"
                    + ", bank_account='" + bean.getBankAccount() + "'"
                    + ", tax='" + bean.getTax() + "'"
                    + ", presenter='" + bean.getPresenter() + "'"
                    + ", presenter_position='" + bean.getPresenterPosition() + "'"
                    //                    + ", discount='" + bean.getDiscount() + "'"
                    + ", is_gas=" + bean.getIsGas()
                    + ", is_petro=" + bean.getIsPetro()
                    + ", is_good=" + bean.getIsGood()
                    + ", is_oil=" + bean.getIsOil()
                    + ", commission_kind=" + bean.getCommissionKind()
                    + ", commission_percentage=" + bean.getCommissionPercentage()
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

    public ArrayList getDocuments() throws Exception {
        ResultSet rs = null;
        String sql = "select * from document order by name desc";
        ArrayList documentList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            CustomerDocumentFormBean bean = null;
            while (rs.next()) {
                bean = new CustomerDocumentFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setNote(rs.getString("note"));
                documentList.add(bean);
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
        return documentList;
    }

    public CustomerDocumentFormBean getDocument(int customerDocumentId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from document where id=" + customerDocumentId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                CustomerDocumentFormBean bean = new CustomerDocumentFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public CustomerDocumentFormBean getDocumentByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from document where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                CustomerDocumentFormBean bean = new CustomerDocumentFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
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

    public int insertDocument(DocumentBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "";
            sql = "Insert Into document (name, note) Values ('" + bean.getName() + "','" + bean.getNote() + "')";
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

    public void updateDocument(DocumentBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update document Set "
                    + " name='" + bean.getName() + "'"
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

    public int deleteDocument(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From document Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);

            sql = "Delete From customer_document Where document_id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getCustomerDocuments(int customerId) throws Exception {
        ResultSet rs = null;
        String sql = "select cd.id, cd.customer_id, d.id as document_id, d.name, cd.expired_date"
                + " from document as d left join customer_document as cd on cd.document_id=d.id";
        if (customerId != 0) {
            sql += " and cd.customer_id=" + customerId;
        }
        sql += " order by d.name desc";
        ArrayList documentList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            CustomerDocumentBean bean = null;
            while (rs.next()) {
                bean = new CustomerDocumentBean();
                bean.setId(rs.getInt("id"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setDocumentId(rs.getInt("document_id"));
                bean.setExpiredDate(DateUtil.formatDate(rs.getDate("expired_date"), "dd/MM/yyyy"));
                bean.setName(rs.getString("name"));
                documentList.add(bean);
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
        return documentList;
    }

    public int insertCustomerDocument(CustomerDocumentBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String expiredDate = "";
            if (GenericValidator.isBlankOrNull(bean.getExpiredDate())) {
                expiredDate = "null";
            } else {
                expiredDate = bean.getExpiredDate();
            }
            String sql = "";
            sql = "Insert Into customer_document (customer_id, document_id, expired_date) Values (" + bean.getCustomerId() + "," + bean.getDocumentId()
                    + ",STR_TO_DATE('" + expiredDate + "','%d/%m/%Y'))";
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

    public void updateCustomerDocument(CustomerDocumentBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String expiredDate = "";
            if (GenericValidator.isBlankOrNull(bean.getExpiredDate())) {
                expiredDate = "null";
            } else {
                expiredDate = bean.getExpiredDate();
            }
            String sql = "Update customer_document Set expired_date=STR_TO_DATE('" + expiredDate + "','%d/%m/%Y') Where id=" + bean.getId();
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

    public ArrayList getDiscounts() throws Exception {
        ResultSet rs = null;
        String sql = "select * from discount_oil where 1";
        sql += " order by name";
        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            DiscountFormBean bean = null;
            while (rs.next()) {
                bean = new DiscountFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
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

    public DiscountBean getDiscount(int discountId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from discount_oil where id=" + discountId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                DiscountBean bean = new DiscountBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
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

    public DiscountBean getDiscountByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from discount where name='" + name + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                DiscountBean bean = new DiscountBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setCode(rs.getString("code"));
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

    public int insertDiscount(DiscountBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "";
            sql = "Insert Into discount_oil (name, code, note) Values ('" + bean.getName() + "','" + bean.getCode() + "','" + bean.getNote() + "')";
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

    public void updateDiscount(DiscountBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update discount_oil Set "
                    + " name='" + bean.getName() + "'"
                    + ", code='" + bean.getCode() + "'"
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

    public void deleteDiscount(String ids) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteDiscount(?)}";
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

    public ArrayList getAgencys(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from agency where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList agencyList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AgencyFormBean bean = null;
            while (rs.next()) {
                bean = new AgencyFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setPhone(rs.getString("phone"));
                bean.setAddress(rs.getString("address"));
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

    public AgencyBean getAgency(int agencyId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from agency where id=" + agencyId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AgencyBean bean = new AgencyBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setPhone(rs.getString("phone"));
                bean.setAddress(rs.getString("address"));
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

    public AgencyBean getAgencyByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from agency where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AgencyBean bean = new AgencyBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setPhone(rs.getString("phone"));
                bean.setAddress(rs.getString("address"));
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

    public int insertAgency(AgencyBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        try {
            String sql = "Insert Into agency(name, phone, address, note, status) Values ('" + bean.getName() + "','" + bean.getPhone() + "','" + bean.getAddress()
                    + "','" + bean.getNote() + "'," + bean.getStatus() + ")";
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

    public void updateAgency(AgencyBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update agency Set "
                    + " name='" + bean.getName() + "'"
                    + ", phone='" + bean.getPhone() + "'"
                    + ", address='" + bean.getAddress() + "'"
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

    public ArrayList getAgencyCustomerDetail(int agencyId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, c.name as customer_name"
                + " from agency_customer as det, customer as c"
                + " where det.customer_id=c.id and det.agency_id=" + agencyId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AgencyCustomerDetailBean bean = null;
            while (rs.next()) {
                bean = new AgencyCustomerDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCustomerName(rs.getString("customer_name"));
                bean.setAgencyId(rs.getInt("agency_id"));
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

    public ArrayList getAgencyCommissionDetail(int agencyId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.* from agency_commission as det where det.agency_id=" + agencyId + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AgencyCommissionDetailBean bean = null;
            while (rs.next()) {
                bean = new AgencyCommissionDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setAgencyId(rs.getInt("agency_id"));
                bean.setCommissionFrom(rs.getFloat("commission_from"));
                bean.setCommissionTo(rs.getFloat("commission_to"));
                bean.setCommission(rs.getFloat("commission"));
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

    public int insertAgencyCustomerDetail(AgencyCustomerDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertAgencyCustomerDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_agency_id", bean.getAgencyId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
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

    public int deleteAgencyCustomerDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From agency_customer Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertAgencyCommissionDetail(AgencyCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertAgencyCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_agency_id", bean.getAgencyId());
                spUtil.getCallableStatement().setFloat("_commission_from", bean.getCommissionFrom());
                spUtil.getCallableStatement().setFloat("_commission_to", bean.getCommissionTo());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
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

    public void updateAgencyCommissionDetail(AgencyCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateAgencyCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setFloat("_commission_from", bean.getCommissionFrom());
                spUtil.getCallableStatement().setFloat("_commission_to", bean.getCommissionTo());
                spUtil.getCallableStatement().setFloat("_commission", bean.getCommission());
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

    public int deleteAgencyCommissionDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From agency_commission Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getDiscountCommissionDetail(int discountId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.* from discount_oil_detail as det where det.discount_id=" + discountId + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            DiscountCommissionDetailBean bean = null;
            while (rs.next()) {
                bean = new DiscountCommissionDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setDiscountId(rs.getInt("discount_id"));
                bean.setFrom(rs.getFloat("commission_from"));
                bean.setTo(rs.getFloat("commission_to"));
                bean.setCommission(rs.getFloat("commission"));
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

    public int insertDiscountCommissionDetail(DiscountCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertDiscountCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_discount_id", bean.getDiscountId());
                spUtil.getCallableStatement().setDouble("_commission_from", bean.getFrom());
                spUtil.getCallableStatement().setDouble("_commission_to", bean.getTo());
                spUtil.getCallableStatement().setDouble("_commission", bean.getCommission());
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

    public void updateDiscountCommissionDetail(DiscountCommissionDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateDiscountCommissionDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setDouble("_commission_from", bean.getFrom());
                spUtil.getCallableStatement().setDouble("_commission_to", bean.getTo());
                spUtil.getCallableStatement().setDouble("_commission", bean.getCommission());
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

    public int deleteDiscountCommissionDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From discount_oil_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

}
