/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class AutoDAO {

    public boolean hasAutoSalaryEmployee() throws Exception {
        ResultSet rs = null;
        String sql = "SELECT id FROM auto WHERE MONTH(auto_date)=MONTH(SYSDATE()) AND YEAR(auto_date)=YEAR(SYSDATE()) AND auto_name='" + AUTO_EMPLOYEE_SALARY + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return false;
    }

    public boolean hasAutoInStock() throws Exception {
        ResultSet rs = null;
        String sql = "SELECT id FROM auto WHERE MONTH(auto_date)=MONTH(SYSDATE()) AND YEAR(auto_date)=YEAR(SYSDATE()) AND auto_name='" + AUTO_IN_STOCK + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);
            }
        }
        return false;
    }

    public void insertAutoSalaryEmployee() throws Exception {
        try {
            String sql = "";
            sql = "Insert Into auto (auto_date, auto_name) Values (sysdate(),'" + AUTO_EMPLOYEE_SALARY + "')";
            DBUtil.executeInsert(sql);
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public void insertAutoInStock() throws Exception {
        try {
            String sql = "";
            sql = "Insert Into auto (auto_date, auto_name) Values (sysdate(),'" + AUTO_IN_STOCK + "')";
            DBUtil.executeInsert(sql);
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public void insertInStockDay() throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call insertInStockDay()}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
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

    private String AUTO_EMPLOYEE_SALARY = "employee_salary";
    private String AUTO_IN_STOCK = "in_stock";
}
