/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.gasoline.qt.report.LpgImportReportBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class ReportDAO extends BasicDAO {
    
    public ArrayList getLpgImportReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_import(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = BasicDAO.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                
                rs = spUtil.executeQuery();

                if (rs != null) {
                    LpgImportReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new LpgImportReportBean();
                        bean.setCount(count++);
                        bean.setDate(DateUtil.formatDate(rs.getDate("import_date"), "dd/MM/yyyy"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setPaperQuantity(rs.getFloat("paper_quantity"));
                        bean.setActualQuantity(rs.getFloat("actual_quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
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
}
