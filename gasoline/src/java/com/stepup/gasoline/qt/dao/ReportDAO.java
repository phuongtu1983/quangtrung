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
import com.stepup.gasoline.qt.report.LpgStockOrganizationReportBean;
import com.stepup.gasoline.qt.report.LpgStockReportBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
                    int countPre = 0;
                    int countSub = 1;
                    while (rs.next()) {
                        bean = new LpgImportReportBean();
                        if (rs.getInt("sale_id") == 0) {
                            bean.setCount(count++ + "");
                            bean.setDate(DateUtil.formatDate(rs.getDate("import_date"), "dd/MM/yyyy"));
                            bean.setVendorName(rs.getString("vendor_name"));
                            bean.setPaperQuantity(rs.getFloat("paper_quantity"));
                            bean.setActualQuantity(rs.getFloat("actual_quantity"));
                            bean.setPrice(rs.getDouble("price"));
                            bean.setRate(rs.getDouble("rate"));
                            bean.setAmount(rs.getDouble("amount"));
                            bean.setPaid(rs.getDouble("paid"));
                            bean.setNote(rs.getString("note"));
                            countPre = count - 1;
                            countSub = 1;
                        } else {
                            bean.setCount(countPre + "." + countSub++ + "");
                            bean.setDate(DateUtil.formatDate(rs.getDate("sale_date"), "dd/MM/yyyy"));
                            bean.setCustomerName(rs.getString("customer_name"));
                            bean.setActualQuantity(rs.getFloat("sale_quantity"));
                            bean.setPrice(rs.getDouble("sale_price"));
                            bean.setAmount(rs.getDouble("sale_amount"));
                            bean.setPaid(rs.getDouble("sale_paid"));
                            bean.setNote(rs.getString("sale_note"));
                        }
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

    public ArrayList getLpgStockReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock(?,?,?)}";
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
                    LpgStockReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockReportBean();
                        if (rs.getInt("sale_id") == 0) {
                            bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                            bean.setContent(rs.getString("content"));
                            bean.setOpeningStock(rs.getFloat("paper_quantity"));
                            bean.setImportQuantity(rs.getFloat("actual_quantity"));
                            bean.setExport12Quantity(rs.getFloat("price"));
                            bean.setExport45Quantity(rs.getFloat("rate"));
                            bean.setConvertQuantity(bean.getExport12Quantity() * 12 + bean.getExport45Quantity() * 45);
                            bean.setReturnQuantity(rs.getFloat("paid"));
                            bean.setClosingStock(bean.getOpeningStock() + bean.getImportQuantity() - bean.getConvertQuantity() + bean.getReturnQuantity());
                            bean.setNote(rs.getString("note"));
                        }
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

    public ArrayList getLpgStockSumReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock_sum(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_gas_12_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_45_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_final_stock", Types.INTEGER);
                rs = spUtil.executeQuery();
                int gas12Stock = spUtil.getCallableStatement().getInt("_gas_12_stock");
                int gas45Stock = spUtil.getCallableStatement().getInt("_gas_45_stock");
                int gasStock = spUtil.getCallableStatement().getInt("_gas_stock");
                int finalStock = spUtil.getCallableStatement().getInt("_final_stock");
                if (rs != null) {
                    LpgStockOrganizationReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockOrganizationReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setContent(DateUtil.formatDate(rs.getDate("content"), "dd/MM"));
                        bean.setGas12Stock(gas12Stock);
                        bean.setGas45Stock(gas45Stock);
                        bean.setFraction12(rs.getInt("fraction_12"));
                        bean.setFraction45(rs.getInt("fraction_45"));
                        bean.setVehicleOut12(rs.getInt("vehicle_out_12"));
                        bean.setVehicleOut45(rs.getInt("vehicle_out_45"));
                        bean.setVehicleIn12(rs.getInt("vehicle_in_12"));
                        bean.setVehicleIn45(rs.getInt("vehicle_in_45"));
                        bean.setClosingStock12(bean.getGas12Stock() + bean.getFraction12() - bean.getVehicleOut12() + bean.getVehicleIn12());
                        bean.setClosingStock45(bean.getGas45Stock() + bean.getFraction45() - bean.getVehicleOut45() + bean.getVehicleIn45());
                        bean.setClosingStock(gasStock + rs.getInt("import_quantity") - bean.getFraction12() * 12 - bean.getFraction45() * 45);
                        bean.setShieldImport(rs.getInt("shield_import"));
                        bean.setShieldDecrease(rs.getInt("shield_decrease"));
                        bean.setFinalStock(finalStock + bean.getShieldImport() - (bean.getFraction12() + bean.getFraction45()) - bean.getShieldDecrease());
                        gas12Stock = bean.getClosingStock12();
                        gas45Stock = bean.getClosingStock45();
                        gasStock = bean.getClosingStock();
                        finalStock = bean.getFinalStock();
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
