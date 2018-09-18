/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.FileAttachmentBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class FileAttachmentDAO extends BasicDAO {

    public ArrayList getAttachmentFiles(int fileType, int parentId) throws Exception {
        ArrayList fileList = new ArrayList();
        if (parentId == 0) {
            return fileList;
        }
        ResultSet rs = null;
        try {
            String sql = "select f.*, e.fullname as employee_name from attachment_file as f, employee as e"
                    + " where f.employee_id=e.id and f.type=" + fileType + " and f.parent_id=" + parentId;

            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FileAttachmentBean fileBean = new FileAttachmentBean();
                fileBean.setType(fileType);
                fileBean.setId(rs.getInt("id"));
                fileBean.setParentId(rs.getInt("parent_id"));
                fileBean.setEmployeeId(rs.getInt("employee_id"));
                fileBean.setEmployeeName(rs.getString("employee_name"));
                fileBean.setName(rs.getString("name"));
                fileBean.setSource(rs.getString("source"));
                fileBean.setHref(rs.getString("link"));
                fileBean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy") + " " + DateUtil.formatDate(rs.getTime("created_date"), "HH:mm:ss"));
                fileList.add(fileBean);
            }

            return fileList;
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

    public int insertAttachmentFile(FileAttachmentBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertAttachmentFile(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_name", bean.getName());
                spUtil.getCallableStatement().setString("_source", bean.getSource());
                spUtil.getCallableStatement().setString("_link", bean.getHref());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setInt("_type", bean.getType());
                spUtil.getCallableStatement().setInt("_parent_id", bean.getParentId());
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

    public FileAttachmentBean getAttachmentFile(int id) throws Exception {
        ResultSet rs = null;
        try {
            String sql = "select f.*, e.fullname as employee_name from attachment_file as f, employee as e where f.employee_id=e.id and f.id=" + id;
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FileAttachmentBean fileBean = new FileAttachmentBean();
                fileBean.setType(rs.getInt("type"));
                fileBean.setId(rs.getInt("id"));
                fileBean.setParentId(rs.getInt("parent_id"));
                fileBean.setEmployeeId(rs.getInt("employee_id"));
                fileBean.setEmployeeName(rs.getString("employee_name"));
                fileBean.setName(rs.getString("name"));
                fileBean.setSource(rs.getString("source"));
                fileBean.setHref(rs.getString("link"));
                fileBean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy HH:mm:ss"));
                return fileBean;
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

    public int deleteAttachmentFile(int id) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From attachment_file Where id=" + id;
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }
}
