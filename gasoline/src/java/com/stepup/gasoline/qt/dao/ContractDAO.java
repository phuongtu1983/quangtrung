/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.attachmentfile.UploadFileUtil;
import com.stepup.gasoline.qt.bean.ContractBean;
import com.stepup.gasoline.qt.bean.InvoiceBean;
import com.stepup.gasoline.qt.bean.InvoiceDetailBean;
import com.stepup.gasoline.qt.bean.InvoicePaidDetailBean;
import com.stepup.gasoline.qt.contract.ContractFormBean;
import com.stepup.gasoline.qt.invoice.InvoiceFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import org.apache.commons.validator.GenericValidator;

/**
 *
 * @author Administrator
 */
public class ContractDAO extends BasicDAO {

    public ArrayList searchContract(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchContract(?,?,?)}";
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
                    ContractFormBean bean = null;
                    while (rs.next()) {
                        bean = new ContractFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerName(rs.getString("customer_name"));
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

    public ContractBean getContract(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from contract where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ContractBean bean = new ContractBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setShell12Price(rs.getDouble("shell_12_price"));
                bean.setShell45Price(rs.getDouble("shell_45_price"));
                bean.setCreditDate(rs.getInt("credit_date"));
                bean.setCreditAmount(rs.getDouble("credit_amount"));
                bean.setNote(rs.getString("note"));
                bean.setEmployeeId(rs.getInt("employee_id"));
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

    public int insertContract(ContractBean bean) throws Exception {
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
            String sql = "{call insertContract(?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_shell_12_price", bean.getShell12Price());
                spUtil.getCallableStatement().setDouble("_shell_45_price", bean.getShell45Price());
                spUtil.getCallableStatement().setInt("_credit_date", bean.getCreditDate());
                spUtil.getCallableStatement().setDouble("_credit_amount", bean.getCreditAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
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

    public void updateContract(ContractBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateContract(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_shell_12_price", bean.getShell12Price());
                spUtil.getCallableStatement().setDouble("_shell_45_price", bean.getShell45Price());
                spUtil.getCallableStatement().setInt("_credit_date", bean.getCreditDate());
                spUtil.getCallableStatement().setDouble("_credit_amount", bean.getCreditAmount());
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

    public String getNextContractNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "contract");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteContract(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From contract Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);

            sql = "Delete From attachment_file Where type=" + UploadFileUtil.ATTACH_FILE_CONTRACT + " and parent_id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ContractBean getContractByCode(String code) throws Exception {
        ResultSet rs = null;
        String sql = "select * from contract where code='" + code + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ContractBean bean = new ContractBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setShell12Price(rs.getDouble("shell_12_price"));
                bean.setShell45Price(rs.getDouble("shell_45_price"));
                bean.setCreditDate(rs.getInt("credit_date"));
                bean.setCreditAmount(rs.getDouble("credit_amount"));
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

    public ArrayList searchInvoice(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchInvoice(?,?,?)}";
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
                    InvoiceFormBean bean = null;
                    while (rs.next()) {
                        bean = new InvoiceFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setNumber(rs.getString("number"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setNote(rs.getString("note"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setAmountPaid(rs.getDouble("amount_paid"));
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

    public InvoiceBean getInvoice(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from invoice where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                InvoiceBean bean = new InvoiceBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setNumber(rs.getString("number"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAmountPaid(rs.getDouble("amount_paid"));
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

    public int insertInvoice(InvoiceBean bean) throws Exception {
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
            String sql = "{call insertInvoice(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_number", bean.getNumber());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_amount_paid", bean.getAmountPaid());
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

    public void updateInvoice(InvoiceBean bean) throws Exception {
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
            String sql = "{call updateInvoice(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_number", bean.getNumber());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setDouble("_amount_paid", bean.getAmountPaid());
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

    public String getNextInvoiceNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "invoice");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteInvoice(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteInvoice(?)}";
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

    public InvoiceBean getInvoiceByNumber(String number) throws Exception {
        ResultSet rs = null;
        String sql = "select * from invoice where number='" + number + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                InvoiceBean bean = new InvoiceBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setNumber(rs.getString("number"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAmountPaid(rs.getDouble("amount_paid"));
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

    public ArrayList getInvoiceDetail(int invoiceId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, o.name as oil_name, s.code as oil_sale_code, s.created_date as oil_sale_date, sdet.amount as amount"
                + " from invoice_detail as det, oil_sale_detail as sdet, oil_sale as s, oil as o"
                + " where det.oil_sale_detail_id=sdet.id and sdet.oil_sale_id=s.id and sdet.oil_id=o.id and det.invoice_id=" + invoiceId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            InvoiceDetailBean bean = null;
            while (rs.next()) {
                bean = new InvoiceDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setInvoiceId(rs.getInt("invoice_id"));
                bean.setOilName(rs.getString("oil_name"));
                bean.setOilSaleCode(rs.getString("oil_sale_code"));
                bean.setOilSaleDate(DateUtil.formatDate(rs.getDate("oil_sale_date"), "dd/MM/yyyy"));
                bean.setOilSaleDetailId(rs.getInt("oil_sale_detail_id"));
                bean.setOilSaleDetailPaid(rs.getInt("paid"));
                bean.setOilSaleDetailCommissioned(rs.getInt("commissioned"));
                bean.setOilSaleDetailAmount(rs.getDouble("amount"));
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

    public int insertInvoiceDetail(InvoiceDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertInvoiceDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_invoice_id", bean.getInvoiceId());
                spUtil.getCallableStatement().setInt("_oil_sale_detail_id", bean.getOilSaleDetailId());
                spUtil.getCallableStatement().setInt("_paid", bean.getOilSaleDetailPaid());
                spUtil.getCallableStatement().setInt("_commissioned", bean.getOilSaleDetailCommissioned());
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

    public void updateInvoiceDetail(InvoiceDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateInvoiceDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_paid", bean.getOilSaleDetailPaid());
                spUtil.getCallableStatement().setInt("_commissioned", bean.getOilSaleDetailCommissioned());
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

    public int deleteInvoiceDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From invoice_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getInvoicePaidDetail(int invoiceId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.* from invoice_paid_detail as det where det.invoice_id=" + invoiceId + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            InvoicePaidDetailBean bean = null;
            while (rs.next()) {
                bean = new InvoicePaidDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setInvoiceId(rs.getInt("invoice_id"));
                bean.setPaidDate(DateUtil.formatDate(rs.getDate("paid_date"), "dd/MM/yyyy"));
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

    public int insertInvoicePaidDetail(InvoicePaidDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String paidDate = "";
            if (GenericValidator.isBlankOrNull(bean.getPaidDate())) {
                paidDate = "null";
            } else {
                paidDate = bean.getPaidDate();
            }
            String sql = "{call insertInvoicePaidDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_invoice_id", bean.getInvoiceId());
                spUtil.getCallableStatement().setString("_paid_date", paidDate);
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

    public void updateInvoicePaidDetail(InvoicePaidDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String paidDate = "";
            if (GenericValidator.isBlankOrNull(bean.getPaidDate())) {
                paidDate = "null";
            } else {
                paidDate = bean.getPaidDate();
            }
            String sql = "{call updateInvoicePaidDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
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

    public int deleteInvoicePaidDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From invoice_paid_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
}
