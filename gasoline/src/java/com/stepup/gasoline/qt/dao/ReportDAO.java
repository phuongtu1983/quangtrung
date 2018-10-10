/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.gasoline.qt.report.compare.CompareReportBean;
import com.stepup.gasoline.qt.report.compare.CompareReportOutBean;
import com.stepup.gasoline.qt.report.LpgImportReportBean;
import com.stepup.gasoline.qt.report.LpgStockSumReportBean;
import com.stepup.gasoline.qt.report.LpgStockReportBean;
import com.stepup.gasoline.qt.report.LpgStockReportOutBean;
import com.stepup.gasoline.qt.report.LpgStockSumReportOutBean;
import com.stepup.gasoline.qt.report.SaleCustomerReportBean;
import com.stepup.gasoline.qt.report.SaleReportBean;
import com.stepup.gasoline.qt.report.SumReportBean;
import com.stepup.gasoline.qt.report.lpgstocksumorganization.LpgStockSumOrganizationReportOutBean;
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
                            bean.setPaperQuantity(rs.getInt("paper_quantity"));
                            bean.setActualQuantity(rs.getInt("actual_quantity"));
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
                            bean.setActualQuantity(rs.getInt("sale_quantity"));
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

    public ArrayList getLpgStockReport(String fromDate, String endDate, String organizationIds, String vendorIds, LpgStockReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_vendor_ids", vendorIds);
                spUtil.getCallableStatement().registerOutParameter("_gas_stock", Types.INTEGER);

                rs = spUtil.executeQuery();

                int gasStock = spUtil.getCallableStatement().getInt("_gas_stock");
                outBean.setGasStock(gasStock);
                if (rs != null) {
                    LpgStockReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setContent(DateUtil.formatDate(rs.getDate("content"), "dd/MM"));
                        bean.setOpeningStock(gasStock);
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setExport12Quantity(rs.getInt("export_12_quantity"));
                        bean.setExport45Quantity(rs.getInt("export_45_quantity"));
                        bean.setConvertQuantity(bean.getExport12Quantity() * 12 + bean.getExport45Quantity() * 45);
                        bean.setReturnQuantity(rs.getInt("return_quantity"));
                        bean.setClosingStock(bean.getOpeningStock() + bean.getImportQuantity() - bean.getConvertQuantity() + bean.getReturnQuantity());
                        gasStock = bean.getClosingStock();
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

    public ArrayList getLpgStockSumReport(String fromDate, String endDate, String vendorIds, LpgStockSumReportOutBean outBean) throws Exception {
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
                spUtil.getCallableStatement().setString("_vendor_ids", vendorIds);
                spUtil.getCallableStatement().registerOutParameter("_gas_12_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_45_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_final_stock", Types.INTEGER);
                rs = spUtil.executeQuery();
                int gas12Stock = spUtil.getCallableStatement().getInt("_gas_12_stock");
                int gas45Stock = spUtil.getCallableStatement().getInt("_gas_45_stock");
                int gasStock = spUtil.getCallableStatement().getInt("_gas_stock");
                int finalStock = spUtil.getCallableStatement().getInt("_final_stock");
                outBean.setGasStock(gasStock);
                outBean.setShieldStock(finalStock);
                if (rs != null) {
                    LpgStockSumReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockSumReportBean();
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

    public ArrayList getSumReport(String fromDate, String endDate, String vendorIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_sum(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_vendor_ids", vendorIds);
                spUtil.getCallableStatement().registerOutParameter("_gas_12_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_45_stock", Types.INTEGER);

                rs = spUtil.executeQuery();

                int gas12Stock = spUtil.getCallableStatement().getInt("_gas_12_stock");
                int gas45Stock = spUtil.getCallableStatement().getInt("_gas_45_stock");
                if (rs != null) {
                    SumReportBean bean = null;
                    while (rs.next()) {
                        bean = new SumReportBean();
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
                        bean.setShell12Return(rs.getInt("shell_12_return"));
                        bean.setShell45Return(rs.getInt("shell_45_return"));
                        bean.setSell12(bean.getVehicleOut12() - bean.getVehicleIn12());
                        bean.setSell45(bean.getVehicleOut45() - bean.getVehicleIn45());
                        bean.setShell12Diff(bean.getShell12Return() - bean.getSell12());
                        bean.setShell45Diff(bean.getShell45Return() - bean.getSell45());
                        gas12Stock = bean.getClosingStock12();
                        gas45Stock = bean.getClosingStock45();
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

    public ArrayList getCompareReport(String fromDate, String endDate, String organizationIds, int customerId, CompareReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_customer_id", customerId);
                spUtil.getCallableStatement().registerOutParameter("_shell_12_debt", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_shell_45_debt", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_amount_debt", Types.DOUBLE);

                rs = spUtil.executeQuery();

                int shell12Debt = spUtil.getCallableStatement().getInt("_shell_12_debt");
                int shell45Debt = spUtil.getCallableStatement().getInt("_shell_45_debt");
                double amountDebt = spUtil.getCallableStatement().getDouble("_amount_debt");
                outBean.setOpening12Stock(shell12Debt);
                outBean.setOpening45Stock(shell45Debt);
                outBean.setOpeningAmountStock(amountDebt);
                if (rs != null) {
                    CompareReportBean bean = null;
                    while (rs.next()) {
                        bean = new CompareReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setBuy12(rs.getInt("quantity_12"));
                        bean.setBuy45(rs.getInt("quantity_45"));
                        bean.setReturn12(rs.getInt("shell_return_12"));
                        bean.setReturn12T(rs.getInt("shell_return_12t"));
                        bean.setReturn45(rs.getInt("shell_return_45"));
                        bean.setWeight(bean.getBuy12() * 12 + bean.getBuy45() * 45);
                        bean.setPrice12(rs.getDouble("price_12"));
                        bean.setPrice45(rs.getDouble("price_45"));
                        bean.setAmount(rs.getDouble("total_pay"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt12(bean.getBuy12() - bean.getReturn12() - bean.getReturn12T());
                        bean.setDebt45(bean.getBuy45() - bean.getReturn45());
                        bean.setDebtAmount(bean.getAmount() - bean.getPaid());
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

    public ArrayList getSaleReport(String fromDate, String endDate, String organizationIds, String vendorIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_sale(?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_vendor_ids", vendorIds);

                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleReportBean bean = null;
                    while (rs.next()) {
                        bean = new SaleReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerCode(rs.getString("customer_code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setPaymentMethod(rs.getString("account"));
                        bean.setNote(rs.getString("note"));
                        bean.setQuantity12(rs.getInt("quantity_12"));
                        bean.setQuantity45(rs.getInt("quantity_45"));
                        bean.setShellReturn12(rs.getInt("shell_return_12"));
                        bean.setShellReturn12T(rs.getInt("shell_return_12t"));
                        bean.setShellReturn45(rs.getInt("shell_return_45"));
                        bean.setPrice12(rs.getDouble("price_12"));
                        bean.setPrice45(rs.getDouble("price_45"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setAmount(bean.getQuantity12() * bean.getPrice12() + bean.getQuantity45() * bean.getPrice45());
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

    public ArrayList getSaleCustomerReport(String fromDate, String endDate, String organizationIds, String vendorIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_sale_customer(?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_vendor_ids", vendorIds);

                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleCustomerReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new SaleCustomerReportBean();
                        bean.setCount(count++);
                        bean.setCustomerCode(rs.getString("customer_code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setGas12(rs.getInt("quantity_12"));
                        bean.setGas45(rs.getInt("quantity_45"));
                        bean.setRevenue(rs.getDouble("amount"));
                        bean.setOpeningDebt12(rs.getDouble("opening_debt_12"));
                        bean.setOpeningDebt45(rs.getDouble("opening_debt_45"));
                        bean.setOpeningDebt(rs.getDouble("opening_debt"));
                        bean.setDebt12(bean.getOpeningDebt12() + bean.getGas12() - rs.getInt("shell_return_12"));
                        bean.setDebt45(bean.getOpeningDebt45() + bean.getGas45() - rs.getInt("shell_return_45"));
                        bean.setDebt(bean.getOpeningDebt() + rs.getDouble("debt"));
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

    public ArrayList getCashBookReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_cash_book(?,?,?)}";
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
                    SaleCustomerReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new SaleCustomerReportBean();
                        bean.setCount(count++);
                        bean.setCustomerCode(rs.getString("customer_code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setGas12(rs.getInt("quantity_12"));
                        bean.setGas45(rs.getInt("quantity_45"));
                        bean.setRevenue(rs.getDouble("amount"));
                        bean.setOpeningDebt12(rs.getDouble("opening_debt_12"));
                        bean.setOpeningDebt45(rs.getDouble("opening_debt_45"));
                        bean.setOpeningDebt(rs.getDouble("opening_debt"));
                        bean.setDebt12(bean.getOpeningDebt12() + bean.getGas12() - rs.getInt("shell_return_12"));
                        bean.setDebt45(bean.getOpeningDebt45() + bean.getGas45() - rs.getInt("shell_return_45"));
                        bean.setDebt(bean.getOpeningDebt() + rs.getDouble("debt"));
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

    public ArrayList getLpgStockSumOrganizationReport(String fromDate, String endDate, int vendorId, LpgStockSumOrganizationReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock_sum_organization(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
                spUtil.getCallableStatement().registerOutParameter("_gas_12_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_45_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_gas_stock", Types.INTEGER);
                spUtil.getCallableStatement().registerOutParameter("_final_stock", Types.INTEGER);
                rs = spUtil.executeQuery();
                int gas12Stock = spUtil.getCallableStatement().getInt("_gas_12_stock");
                int gas45Stock = spUtil.getCallableStatement().getInt("_gas_45_stock");
                int gasStock = spUtil.getCallableStatement().getInt("_gas_stock");
                int finalStock = spUtil.getCallableStatement().getInt("_final_stock");
                outBean.setGasStock(gasStock);
                outBean.setShieldStock(finalStock);
                if (rs != null) {
                    LpgStockSumReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockSumReportBean();
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
