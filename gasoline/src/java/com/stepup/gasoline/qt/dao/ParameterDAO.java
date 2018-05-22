package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.ParameterBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author Mai Vinh Loc
 */
public class ParameterDAO {

    public ParameterDAO() {
    }
//
//    public ArrayList getParameters() throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT * FROM parameter";
//
//        ArrayList list = new ArrayList();
//        try {
//            rs = DBUtil.executeQuery(sql);
//            ParameterBean param = null;
//            while (rs.next()) {
//                param = new ParameterBean();
//                param.setId(rs.getInt("id"));
//                param.setName(rs.getString("name"));
//                param.setValue(rs.getString("value"));
//                list.add(param);
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//
//        }
//        return list;
//    }

    public ParameterBean getParameter(String code) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT * FROM parameter where code='" + code + "'";

        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ParameterBean param = new ParameterBean();
                param.setId(rs.getInt("id"));
                param.setCode(rs.getString("code"));
                param.setName(rs.getString("name"));
                param.setValue(rs.getString("value"));
                return param;
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

    public ParameterBean getParameter(int id) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT * FROM parameter where id=" + id;

        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ParameterBean param = new ParameterBean();
                param.setId(rs.getInt("id"));
                param.setCode(rs.getString("code"));
                param.setName(rs.getString("name"));
                param.setValue(rs.getString("value"));
                return param;
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

//    public int insertParameter(ParameterBean bean) throws Exception {
//        if (bean == null) {
//            return 0;
//        }
//        int result = 0;
//        try {
//            String sql = "";
//
//            sql = "insert into parameter(name,value)"
//                    + " values ('" + bean.getName() + "','" + bean.getValue() + "')";
//
//            ////System.out.println("sql ====" + sql);
//            result = DBUtil.executeInsert(sql);
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        }
//        return result;
//    }
//
//    public void updateParameter(ParameterBean bean) throws Exception {
//        if (bean == null) {
//            return;
//        }
//        try {
//            String sql = "update parameter set "
//                    + " value='" + bean.getValue() + "'"
//                    + " where name='" + bean.getName() + "'";
//            ////System.out.println("sql=" + sql);
//            DBUtil.executeUpdate(sql);
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        }
//    }
    public void updateParameter(int id, String value) throws Exception {
        try {
            String sql = "update parameter set value='" + value + "' where id=" + id;
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

//    public int deleteParameter(String name) throws Exception {
//        int result = 0;
//        try {
//            String sql = "delete from parameter where name='" + name + "'";
//            result = DBUtil.executeUpdate(sql);
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        }
//        return result;
//    }
//
//    public String getParameters(String names) throws Exception {
//        ResultSet rs = null;
//        String sql = "SELECT * FROM parameter where name in (" + names + ")";
//        String result = "";
//        try {
//            rs = DBUtil.executeQuery(sql);
//            while (rs.next()) {
//                result += "," + rs.getString("value");
//            }
//        } catch (SQLException sqle) {
//            throw new Exception(sqle.getMessage());
//        } catch (Exception ex) {
//            throw new Exception(ex.getMessage());
//        } finally {
//            if (rs != null) {
//                DBUtil.closeConnection(rs);
//            }
//
//        }
//        result = result.substring(1);
//        return result;
//    }
    public ArrayList getParametersByCodes(String codes) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT * FROM parameter where code in (" + codes + ")";

        ArrayList list = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ParameterBean param = null;
            while (rs.next()) {
                param = new ParameterBean();
                param.setId(rs.getInt("id"));
                param.setCode(rs.getString("code"));
                param.setName(rs.getString("name"));
                param.setValue(rs.getString("value"));
                list.add(param);
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
}
