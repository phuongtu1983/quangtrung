/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.account.AccountFormBean;
import com.stepup.gasoline.qt.bean.AccountBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class AccountDAO extends BasicDAO {

    public ArrayList getAccounts(String organizationIds) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT a.*, o.name as organization_name"
                + " FROM account AS a, organization as o WHERE a.organization_id=o.id and o.status=" + EmployeeBean.STATUS_ACTIVE;
        if (!StringUtil.isBlankOrNull(organizationIds)) {
            sql += " and a.organization_id in(" + organizationIds + ")";
        }
        sql += " order by a.number";
        ArrayList equipmentList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            AccountFormBean bean = null;
            while (rs.next()) {
                bean = new AccountFormBean();
                bean.setId(rs.getInt("id"));
                bean.setNumber(rs.getString("number"));
                bean.setHolder(rs.getString("holder"));
                bean.setBank(rs.getString("bank"));
                bean.setBranch(rs.getString("branch"));
                bean.setNote(rs.getString("note"));
                bean.setOrganizationId(rs.getInt("organization_id"));
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

    public AccountFormBean getAccount(int accountId) throws Exception {
        ResultSet rs = null;
        String sql = "select a.* from account as a where a.id=" + accountId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccountFormBean bean = new AccountFormBean();
                bean.setId(rs.getInt("id"));
                bean.setNumber(rs.getString("number"));
                bean.setHolder(rs.getString("holder"));
                bean.setBank(rs.getString("bank"));
                bean.setBranch(rs.getString("branch"));
                bean.setNote(rs.getString("note"));
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

    public AccountFormBean getStoreByNumberAndBank(String number, String bank) throws Exception {
        ResultSet rs = null;
        String sql = "select a.* from account as a where a.number='" + number + "' and a.bank='" + bank + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                AccountFormBean bean = new AccountFormBean();
                bean.setId(rs.getInt("id"));
                bean.setNumber(rs.getString("number"));
                bean.setHolder(rs.getString("holder"));
                bean.setBank(rs.getString("bank"));
                bean.setBranch(rs.getString("branch"));
                bean.setNote(rs.getString("note"));
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

    public void insertAccount(AccountBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "";
            sql = "Insert Into account (number, holder, bank, branch, note, organization_id)"
                    + " Values ('" + bean.getNumber() + "','" + bean.getHolder() + "','" + bean.getBank() + "','" + bean.getBranch() + "','" + bean.getNote() + "'," + bean.getOrganizationId() + ")";
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

    public void updateAccount(AccountBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update account Set "
                    + " number='" + bean.getNumber() + "'"
                    + ", holder='" + bean.getHolder() + "'"
                    + ", bank='" + bean.getBank() + "'"
                    + ", branch='" + bean.getBranch() + "'"
                    + ", note='" + bean.getNote() + "'"
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
}
