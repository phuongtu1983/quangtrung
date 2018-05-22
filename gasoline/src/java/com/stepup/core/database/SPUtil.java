/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.core.database;

import com.stepup.core.util.LogUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author phuongtu
 */
public class SPUtil {

    CallableStatement cs = null;

    public SPUtil(String sql) {
        try {
            Connection myConnection = DBInit.dataSource.getConnection();
            cs = myConnection.prepareCall(sql);
            System.out.println(" SPUtil - executeQuery: " + sql);
        } catch (SQLException ex) {
            LogUtil.error(ex.getMessage());
            closeConnection();
        }
    }

    public CallableStatement getCallableStatement() {
        return cs;
    }

    public void execute() {
        try {
            if (cs != null) {
                cs.execute();
            }
        } catch (SQLException ex) {
            LogUtil.error(ex.getMessage());
            closeConnection();
        }
    }

    public ResultSet executeQuery() {
        try {
            if (cs != null) {
                return cs.executeQuery();
            }
        } catch (SQLException ex) {
            LogUtil.error(ex.getMessage());
            closeConnection();
        }
        return null;
    }

    public void closeConnection() {
        try {
            if (cs != null) {
                Connection myConnection = cs.getConnection();
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
                cs.close();
                cs = null;
            }
        } catch (Exception ex) {
            LogUtil.error(ex.getMessage());
        }
    }
}
