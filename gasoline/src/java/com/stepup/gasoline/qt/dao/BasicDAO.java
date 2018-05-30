/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author phuongtu
 */
public class BasicDAO {

    public String getNextNumber(String prefix, int length, String colName, String tableName) throws Exception {
        String result = "";
        ResultSet rs = null;
        try {
            String t = "";
            String y = "-";
            for (int i = 0; i < length; i++) {
                t += "_";
            }
            for (int i = 1; i < length; i++) {
                y += "_";
            }
            String sql = "select max(" + colName + ") as number from " + tableName + " where " + colName + " like '" + prefix + t + "'"
                    + " and " + colName + " not like '" + prefix + y + "'";

            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                result = rs.getString("number");
                break;
            }
            if (result == null || result.equals("")) {
                result = "";
                for (int i = 0; i < length - 1; i++) {
                    result += "0";
                }
                result += "1";
            } else {
                int num = Integer.parseInt(result.substring(prefix.length())) + 1;
                result = num + "";
                while (result.length() < length) {
                    result = "0" + result;
                }
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
        return result;
    }

    public static void tryToConnectServer() throws Exception {
        ResultSet rs = null;
        String sql = "SELECT SYSDATE()";
        try {
            rs = DBUtil.executeQuery(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            if (rs != null) {
                DBUtil.closeConnection(rs);

            }
        }
    }

    public static String START_DATE = "01/01/2018";
}
