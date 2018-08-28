package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.gasoline.qt.bean.ParameterBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author Mai Vinh Loc
 */
public class ParameterDAO extends BasicDAO {

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
    
    public ParameterBean getParametersByCode(String code) throws Exception {
        ResultSet rs = null;
        String sql = "SELECT * FROM parameter where code='" + code + "'";
        try {
            rs = DBUtil.executeQuery(sql);
            ParameterBean param = null;
            while (rs.next()) {
                param = new ParameterBean();
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
}
