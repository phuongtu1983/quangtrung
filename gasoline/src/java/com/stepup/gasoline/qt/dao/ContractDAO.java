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
import com.stepup.gasoline.qt.contract.ContractFormBean;
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

    public ArrayList searchContract(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchContract(?,?)}";
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
            String sql = "{call insertContract(?,?,?,?,?,?,?,?,?,?)}";
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
}
