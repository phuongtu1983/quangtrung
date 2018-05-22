/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.core.database;

import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.LogUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author tunguyen
 */
public class DBUtil {

    /**
     * Executes the given SQL statement, which may be an INSERT, UPDATE, or DELETE statement or an SQL statement that returns nothing, such as an SQL DDL statement. 
     * 
     * @param sql an SQL INSERT, UPDATE or DELETE statement or an SQL statement that returns nothing 
     * @return either the row count for INSERT, UPDATE  or DELETE statements, or 0 for SQL statements that return nothing 
     * @throws java.sql.SQLException
     */
    public static int executeUpdate(String sql) throws SQLException {
        Connection myConnection = null;
        Statement stmt = null;
        int result = 0;
        try {
            myConnection = DBInit.dataSource.getConnection();
            stmt = myConnection.createStatement();
            System.out.println(myConnection.hashCode() + " : executeUpdate: " + sql);
            LogUtil.info(sql);
            result = stmt.executeUpdate(sql);
        } catch (SQLException ex) {
//            LogUtil.error(ex.getMessage());
            throw new SQLException(ex.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
            } catch (SQLException e) {
//                LogUtil.error(e.getMessage());
                throw new SQLException(e.getMessage());
            }
        }
        return result;
    }

    /**
     * Executes the given SQL statement, which may be an INSERT, UPDATE, or DELETE statement or an SQL statement that returns nothing, such as an SQL DDL statement. 
     * This function will call excuteUpdate with Statement.RETURN_GENERATED_KEYS
     * @param sql an SQL INSERT, UPDATE or DELETE statement or an SQL statement that returns nothing 
     * @return either the row count for INSERT, UPDATE  or DELETE statements, or 0 for SQL statements that return nothing 
     * @throws java.sql.SQLException
     */
    public static int executeInsert(String sql) throws SQLException {
        Connection myConnection = null;
        Statement stmt = null;
        int result = 0;
        try {
            myConnection = DBInit.dataSource.getConnection();
            stmt = myConnection.createStatement();
            System.out.println(myConnection.hashCode() + " : executeInsert: " + sql);
            LogUtil.info(sql);
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                result = rs.getInt(Statement.RETURN_GENERATED_KEYS);
                break;
            }
        } catch (SQLException ex) {
//            LogUtil.error(ex.getMessage());
            throw new SQLException(ex.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
            } catch (SQLException e) {
//                LogUtil.error(e.getMessage());
                throw new SQLException(e.getMessage());
            }
        }
        return result;
    }

    /**
     * Executes the given SQL statement, which may be an INSERT, UPDATE, or DELETE statement or an SQL statement that returns nothing, such as an SQL DDL statement. 
     * @param sql an SQL INSERT, UPDATE or DELETE statement or an SQL statement that returns nothing 
     * @return either the row count for INSERT, UPDATE  or DELETE statements, or 0 for SQL statements that return nothing 
     * @throws java.sql.SQLException
     */
    public static int executeInsertNoGenKeys(String sql) throws SQLException {
        Connection myConnection = null;
        Statement stmt = null;
        int result = 0;
        try {
            myConnection = DBInit.dataSource.getConnection();
            stmt = myConnection.createStatement();
            System.out.println(myConnection.hashCode() + " : executeInsert: " + sql);
            LogUtil.info(sql);
            result = stmt.executeUpdate(sql, Statement.NO_GENERATED_KEYS);
        } catch (SQLException ex) {
            //LogUtil.error(ex.getMessage());
            throw new SQLException(ex.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
            } catch (SQLException e) {
//                LogUtil.error(e.getMessage());
                throw new SQLException(e.getMessage());
            }
        }
        return result;
    }

    /**
     * Executes the given SQL statement and signals the driver with the given flag about whether the auto-generated keys produced by this Statement object should be made available for retrieval. 
     * @param sql must be an SQL INSERT, UPDATE or DELETE statement or an SQL statement that returns nothing
     * @param autoGeneratedKeys a flag indicating whether auto-generated keys should be made available for retrieval; one of the following constants: Statement.RETURN_GENERATED_KEYS  Statement.NO_GENERATED_KEYS
     * @return either the row count for INSERT, UPDATE  or DELETE statements, or 0 for SQL statements that return nothing 
     * @throws java.sql.SQLException
     */
    public static int executeInsert(String sql, int autoGeneratedKeys) throws SQLException {
        Connection myConnection = null;
        Statement stmt = null;
        int result = 0;
        try {
            myConnection = DBInit.dataSource.getConnection();
            stmt = myConnection.createStatement();
            System.out.println(myConnection.hashCode() + " : executeInsert: " + sql);
            LogUtil.info(sql);
            int ret = stmt.executeUpdate(sql, autoGeneratedKeys);
            if (autoGeneratedKeys == Statement.RETURN_GENERATED_KEYS) {
                ResultSet rs = stmt.getGeneratedKeys();
                while (rs.next()) {
                    result = rs.getInt(Statement.RETURN_GENERATED_KEYS);
                    break;
                }
            }
        } catch (SQLException ex) {
//            LogUtil.error(ex.getMessage());
            throw new SQLException(ex.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
            } catch (SQLException e) {
//                LogUtil.error(e.getMessage());
                throw new SQLException(e.getMessage());
            }
        }
        return result;
    }

    /**
     * Remember call  close connection after call this function. Example:
     * <br><code> ResultSet DBUtil db = new DBUtil();             rs = db.executeQuery(sql);
     * <br> while (rs.next()) {...}
     * <br> if (rs!=null) rs.getStatement().getConnection().close() </code>
     * @param sql
     * @return ResultSet 
     * @throws java.sql.SQLException
     */
    public static ResultSet executeQuery(String sql) throws SQLException {
        Connection myConnection = null;
        Statement stmt = null;
        try {
            myConnection = DBInit.dataSource.getConnection();
            stmt = myConnection.createStatement();
            System.out.println(myConnection.hashCode() + " : executeQuery: " + sql);
            return stmt.executeQuery(sql);
        } catch (SQLException ex) {
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
            if (myConnection != null) {
                myConnection.close();
                myConnection = null;
            }
            throw new SQLException(ex.getMessage());
        }
    }

    /**
     * This function call sql directly. 
     * 
     * @param sql
     * @return true if value is existed in field otherwise return false
     * @throws java.sql.SQLException
     * @deprecated please use checkFieldExisted function
     * @see #checkFieldExisted
     */
    @Deprecated
    public static boolean checkExisted(String sql) throws SQLException {
        boolean result = false;
        ResultSet rs = null;
        try {
            rs = executeQuery(sql);
            if (rs.next()) {
                result = true;
            } else {
                result = false;
            }
        } catch (SQLException ex) {
            throw new SQLException(ex.getMessage());
        } finally {
            closeConnection(rs);
        }
        return result;
    }

    /**
     * This function check value is existed in field (String value)
     * @param table a table name
     * @param fieldName a field name
     * @param fieldValue a value
     * @return true if value is existed in field otherwise return false
     */
    public static boolean checkFieldExisted(String table, String fieldName, String fieldValue) {
        if (GenericValidator.isBlankOrNull(table)
                || GenericValidator.isBlankOrNull(fieldName)
                || GenericValidator.isBlankOrNull(fieldValue)) {
            return false;
        }

        String sql = "select " + fieldName + " from " + table + " where " + fieldName + "='" + fieldValue + "'";
        try {
            return checkExisted(sql);
        } catch (Exception ex) {
            return false;
        }
    }

    /**
     * This function check value is existed in field (int value)
     * @param table a table name
     * @param fieldName a field name
     * @param fieldValue a value
     * @return true if value is existed in field otherwise return false
     */
    public static boolean checkFieldExisted(String table, String fieldName, int fieldValue) {
        if (GenericValidator.isBlankOrNull(table)
                || GenericValidator.isBlankOrNull(fieldName)) {
            return false;
        }

        String sql = "select " + fieldName + " from " + table + " where " + fieldName + "=" + fieldValue;
        try {
            return checkExisted(sql);
        } catch (Exception ex) {
            return false;
        }
    }

    private static String outputToLog(String sql) {
        String result = "";
        String lowercase = sql.toLowerCase();
        if (lowercase.indexOf("update ") == 0) {
            int setInd = lowercase.indexOf("set");
            int whereInd = lowercase.indexOf("where");
            String fromStr = "";
            String setStr = "";
            String whereStr = "";
            if (setInd > -1) {
                String[] cols = null;
                String[] types = null;
                fromStr = lowercase.substring(6, setInd).trim();
                if (whereInd > -1) {
                    setStr = sql.substring(setInd + 3, whereInd);
                    whereStr = lowercase.substring(whereInd + 5);
                } else {
                    setStr = lowercase.substring(setInd + 3);
                }
                if (!setStr.equals("")) {
                    String[] pairs = setStr.split(",");
                    cols = new String[pairs.length];
                    types = new String[pairs.length];
                    String str = "";
                    int index = 0;
                    for (int i = 0; i < pairs.length; i++) {
                        str = pairs[i];
                        index = str.indexOf("=");
                        if (index > -1) {
                            cols[i] = str.substring(0, index).trim();
                            if (str.substring(index + 1, index + 2).equals("'")) {
                                types[i] = "'";
                            } else {
                                types[i] = "";
                            }
                        }
                    }
                }
                if (cols.length > 0) {
                    result = "select ";
                    for (int i = 0; i < cols.length; i++) {
                        result += cols[i];
                        if (i < cols.length - 1) {
                            result += ",";
                        }
                    }
                    result += " from " + fromStr + " where " + whereStr;
                    try {
                        result = "Before update : " + executeSelect(result, cols, types);
                    } catch (Exception ex) {
                    }
                }
            }
        }
        return result;
    }

    private static String executeSelect(String sql, String[] cols, String[] types) throws SQLException {
        ResultSet rs = null;
        String result = "";
        try {
            rs = executeQuery(sql);
            String value = "";
            while (rs.next()) {
                for (int i = 0; i < cols.length; i++) {
                    value = rs.getString(cols[i]);
                    result += ", " + cols[i] + " = " + types[i] + value + types[i];
                }
            }
        } catch (SQLException ex) {
            throw new SQLException(ex.getMessage());
        } finally {
            closeConnection(rs);
        }
        if (!result.equals("")) {
            result = result.substring(2);
        }
        return result;
    }

    public static void closeConnection(ResultSet rs) throws SQLException {
        try {
            if (rs != null) {
                Connection myConnection = null;
                if (rs.getStatement() != null) {
                    myConnection = rs.getStatement().getConnection();
                    Statement stmt = rs.getStatement();
                    stmt.close();
                    stmt = null;
                }
                if (myConnection != null) {
                    myConnection.close();
                    myConnection = null;
                }
                rs.close();
                rs = null;
            }
        } catch (Exception ex) {
        }
    }
}
