/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.gasoline.qt.openingstock.accessory.AccessoryOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.accessory.AccessoryOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.customer.CustomerOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.customer.CustomerOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.good.GoodOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.good.GoodOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.lpg.LpgOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.lpg.LpgOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.money.MoneyOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.money.MoneyOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.petro.PetroOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.petro.PetroOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.promotionmaterial.PromotionMaterialOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.promotionmaterial.PromotionMaterialOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.shell.ShellOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.shell.ShellOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.shellgas.ShellGasOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.shellgas.ShellGasOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.shield.ShieldOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.shield.ShieldOpeningStockUploadBean;
import com.stepup.gasoline.qt.openingstock.vendor.VendorOpeningStockBean;
import com.stepup.gasoline.qt.openingstock.vendor.VendorOpeningStockUploadBean;
import com.stepup.gasoline.qt.report.CashBookReportBean;
import com.stepup.gasoline.qt.report.CashBookReportOutBean;
import com.stepup.gasoline.qt.report.EmployeeOffReportBean;
import com.stepup.gasoline.qt.report.EmployeeSalaryReportBean;
import com.stepup.gasoline.qt.report.EmployeeWorkingTimeReportBean;
import com.stepup.gasoline.qt.report.GasCommissionReportBean;
import com.stepup.gasoline.qt.report.GasCommissionReportOutBean;
import com.stepup.gasoline.qt.report.GasEmployeeCommissionReportBean;
import com.stepup.gasoline.qt.report.compare.CompareReportBean;
import com.stepup.gasoline.qt.report.compare.CompareReportOutBean;
import com.stepup.gasoline.qt.report.LpgImportReportBean;
import com.stepup.gasoline.qt.report.LpgSaleReportBean;
import com.stepup.gasoline.qt.report.LpgStockSumReportBean;
import com.stepup.gasoline.qt.report.LpgStockReportBean;
import com.stepup.gasoline.qt.report.LpgStockReportOutBean;
import com.stepup.gasoline.qt.report.LpgStockSumReportOutBean;
import com.stepup.gasoline.qt.report.OilImportReportBean;
import com.stepup.gasoline.qt.report.OilSaleReportBean;
import com.stepup.gasoline.qt.report.OilStockReportBean;
import com.stepup.gasoline.qt.report.OilStockReportOutBean;
import com.stepup.gasoline.qt.report.PetroImportReportBean;
import com.stepup.gasoline.qt.report.PetroSaleReportBean;
import com.stepup.gasoline.qt.report.PetroStockReportBean;
import com.stepup.gasoline.qt.report.PetroStockReportOutBean;
import com.stepup.gasoline.qt.report.SaleCustomerReportBean;
import com.stepup.gasoline.qt.report.SaleReportBean;
import com.stepup.gasoline.qt.report.ShellReportBean;
import com.stepup.gasoline.qt.report.SumReportBean;
import com.stepup.gasoline.qt.report.TransportFeeReportBean;
import com.stepup.gasoline.qt.report.TransportSaleReportBean;
import com.stepup.gasoline.qt.report.VendorDebtReportBean;
import com.stepup.gasoline.qt.report.compareagencycommission.CompareAgencyCommissionReportBean;
import com.stepup.gasoline.qt.report.comparegas.CompareGasReportBean;
import com.stepup.gasoline.qt.report.comparegas.CompareGasReportOutBean;
import com.stepup.gasoline.qt.report.comparegood.CompareGoodReportBean;
import com.stepup.gasoline.qt.report.comparegood.CompareGoodReportOutBean;
import com.stepup.gasoline.qt.report.comparelpg.CompareLPGReportBean;
import com.stepup.gasoline.qt.report.comparelpg.CompareLPGReportOutBean;
import com.stepup.gasoline.qt.report.comparelpgvendorcustomer.CompareLPGVendorCustomerReportBean;
import com.stepup.gasoline.qt.report.comparelpgvendorcustomer.CompareLPGVendorCustomerReportOutBean;
import com.stepup.gasoline.qt.report.comparevendor.CompareVendorReportBean;
import com.stepup.gasoline.qt.report.comparevendor.CompareVendorReportOutBean;
import com.stepup.gasoline.qt.report.lpgstocksumorganization.LpgStockSumOrganizationReportBean;
import com.stepup.gasoline.qt.report.lpgstocksumorganization.LpgStockSumOrganizationReportOutBean;
import com.stepup.gasoline.qt.report.oilcompare.OilCompareReportBean;
import com.stepup.gasoline.qt.report.oilcompare.OilCompareReportOutBean;
import com.stepup.gasoline.qt.report.oilvendorstock.OilVendorStockReportBean;
import com.stepup.gasoline.qt.report.transportservice.TransportServiceReportBean;
import com.stepup.gasoline.qt.report.transportservice.TransportServiceReportOutBean;
import com.stepup.gasoline.qt.report.vehiclefee.VehicleFeeReportBean;
import com.stepup.gasoline.qt.saleoil.SaleOilReportBean;
import com.stepup.gasoline.qt.report.OilVendorDebtReportBean;
import com.stepup.gasoline.qt.report.comparecustomercommission.CompareCustomerCommissionReportBean;
import com.stepup.gasoline.qt.report.oilcustomerdebt.OilCustomerDebtReportBean;
import com.stepup.gasoline.qt.report.oilcustomerdebt.OilCustomerDebtReportOutBean;
import com.stepup.gasoline.qt.util.QTUtil;
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
                    while (rs.next()) {
                        bean = new LpgImportReportBean();
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
                        bean.setExportQuantity(rs.getInt("export_quantity"));
                        bean.setStockQuantity(bean.getImportQuantity() - bean.getExportQuantity());
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

    public ArrayList getLpgStockSumReport(String fromDate, String endDate, String organizationIds, String vendorIds, LpgStockSumReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock_sum(?,?,?,?,?,?,?,?)}";
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
                        bean.setSale12(rs.getInt("sale_12"));
                        bean.setSale45(rs.getInt("sale_45"));
                        bean.setClosingStock12(bean.getGas12Stock() + bean.getFraction12() - bean.getVehicleOut12() - bean.getSale12() + bean.getVehicleIn12());
                        bean.setClosingStock45(bean.getGas45Stock() + bean.getFraction45() - bean.getVehicleOut45() - bean.getSale45() + bean.getVehicleIn45());
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

    public ArrayList getSumReport(String fromDate, String endDate, String organizatinIds, String vendorIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_sum(?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_organization_ids", organizatinIds);
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
                        bean.setGasReturnAmount(rs.getDouble("gas_return_amount"));
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

    public ArrayList getCashBookReport(String fromDate, String endDate, String organizationIds, CashBookReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_cash_book(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_account_opening_stock", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_cash_opening_stock", Types.DOUBLE);

                rs = spUtil.executeQuery();

                outBean.setAccountOpeningStock(spUtil.getCallableStatement().getDouble("_account_opening_stock"));
                outBean.setCashOpeningStock(spUtil.getCallableStatement().getDouble("_cash_opening_stock"));
                double accountOpeningStock = outBean.getAccountOpeningStock();
                double cashOpeningStock = outBean.getCashOpeningStock();
                if (rs != null) {
                    CashBookReportBean bean = null;
                    while (rs.next()) {
                        bean = new CashBookReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setAccountIncome(rs.getDouble("account_income_amount"));
                        bean.setAccountOutcome(rs.getDouble("account_outcome_amount"));
                        bean.setAccountStock(accountOpeningStock + bean.getAccountIncome() - bean.getAccountOutcome());
                        accountOpeningStock = bean.getAccountStock();
                        bean.setAccountNote(rs.getString("account_note"));
                        bean.setCashIncome(rs.getDouble("cash_income_amount"));
                        bean.setCashOutcome(rs.getDouble("cash_outcome_amount"));
                        bean.setCashStock(cashOpeningStock + bean.getCashIncome() - bean.getCashOutcome());
                        cashOpeningStock = bean.getCashStock();
                        bean.setCashNote(rs.getString("cash_note"));
                        bean.setContent(QTUtil.getBundleString("content.title"));
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

    public ArrayList getLpgStockSumOrganizationReport(String fromDate, String endDate, String organizationIds, int vendorId, LpgStockSumOrganizationReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_stock_sum_organization(?,?,?,?,?,?,?,?)}";
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
                    LpgStockSumOrganizationReportBean bean = null;
                    while (rs.next()) {
                        bean = new LpgStockSumOrganizationReportBean();
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
                        bean.setSale12(rs.getInt("sale_12"));
                        bean.setSale45(rs.getInt("sale_45"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setClosingStock12(bean.getGas12Stock() + bean.getFraction12() - bean.getVehicleOut12() - bean.getSale12() + bean.getVehicleIn12());
                        bean.setClosingStock45(bean.getGas45Stock() + bean.getFraction45() - bean.getVehicleOut45() - bean.getSale45() + bean.getVehicleIn45());
                        bean.setClosingStock(gasStock + bean.getImportQuantity() - bean.getFraction12() * 12 - bean.getFraction45() * 45);
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

    public ArrayList getPetroImportReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_petro_import(?,?,?)}";
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
                    PetroImportReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new PetroImportReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setPetroName(rs.getString("petroName"));
                        bean.setStoreName(rs.getString("storeName"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
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

    public ArrayList getPetroSaleReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_petro_sale(?,?,?)}";
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
                    PetroSaleReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new PetroSaleReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerCode(rs.getString("customerCode"));
                        bean.setCustomerName(rs.getString("customerName"));
                        bean.setPetroCode(rs.getString("petroCode"));
                        bean.setStoreName(rs.getString("storeName"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setPaymentMethod(rs.getString("account"));
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

    public ArrayList getPetroStockReport(String fromDate, String endDate, String organizationIds, int petroId, String session_id, PetroStockReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_petro_stock(?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_petro_id", petroId);
                spUtil.getCallableStatement().setString("_session_id", session_id);
                spUtil.getCallableStatement().registerOutParameter("_petro_ids", Types.VARCHAR);

                rs = spUtil.executeQuery();

                outBean.setPetroIds(spUtil.getCallableStatement().getString("_petro_ids"));
                if (rs != null) {
                    PetroStockReportBean bean = null;
                    int stock = 0;
                    boolean firstTime = true;
                    while (rs.next()) {
                        bean = new PetroStockReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setPetroId(rs.getInt("petro_id"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setSaleQuantity(rs.getInt("export_quantity"));
                        if (firstTime) {
                            stock = rs.getInt("opening_stock");
                            outBean.setOpeningStock(stock);
                            firstTime = false;
                        }
                        bean.setStock(stock + bean.getImportQuantity() - bean.getSaleQuantity());
                        stock = bean.getStock();
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

    public ArrayList getPetroStockStoreReport(String fromDate, String endDate, String organizationIds, int storeId, int petroId, String session_id, PetroStockReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_petro_stock_store(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_store_id", storeId);
                spUtil.getCallableStatement().setInt("_petro_id", petroId);
                spUtil.getCallableStatement().setString("_session_id", session_id);
                spUtil.getCallableStatement().registerOutParameter("_petro_ids", Types.VARCHAR);

                rs = spUtil.executeQuery();

                if (outBean != null) {
                    outBean.setPetroIds(spUtil.getCallableStatement().getString("_petro_ids"));
                }
                if (rs != null) {
                    PetroStockReportBean bean = null;
                    int stock = 0;
                    boolean firstTime = true;
                    while (rs.next()) {
                        bean = new PetroStockReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setPetroId(rs.getInt("petro_id"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setSaleQuantity(rs.getInt("export_quantity"));
                        if (firstTime) {
                            stock = rs.getInt("opening_stock");
                            outBean.setOpeningStock(stock);
                            firstTime = false;
                        }
                        bean.setStock(stock + bean.getImportQuantity() - bean.getSaleQuantity());
                        stock = bean.getStock();
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

    public void clearPetroStockReport(String session_id) throws Exception {
        SPUtil spUtil = null;
        ResultSet rs = null;
        try {
            String sql = "{call clear_petro_stock_report(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_session_id", session_id);

                rs = spUtil.executeQuery();
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
    }

    public ArrayList getCompareGoodReport(String fromDate, String endDate, String organizationIds, int customerId, CompareGoodReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_good(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_opening_stock", Types.INTEGER);

                rs = spUtil.executeQuery();

                int openingStock = spUtil.getCallableStatement().getInt("_opening_stock");
                outBean.setOpeningStock(openingStock);
                if (rs != null) {
                    CompareGoodReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new CompareGoodReportBean();
                        bean.setCount(count++);
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setGoodCode(rs.getString("goodCode"));
                        bean.setGoodName(rs.getString("goodName"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
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

    public ArrayList getGasCommissionReport(String fromDate, String endDate, String organizationIds, int employeeId, int accessoryId, int employeeOilCommissionId, String session_id, GasCommissionReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_gas_commission(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_employee_id", employeeId);
                spUtil.getCallableStatement().setInt("_accessory_kind_id", accessoryId);
                spUtil.getCallableStatement().setInt("_employee_oil_commission_id", employeeOilCommissionId);
                spUtil.getCallableStatement().setString("_session_id", session_id);
                spUtil.getCallableStatement().registerOutParameter("_employee_ids", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_accessory_kind_ids", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_employee_oil_commission_ids", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_commission_12", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_commission_45", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_commission_lovo", Types.DOUBLE);

                rs = spUtil.executeQuery();

                if (outBean != null) {
                    outBean.setEmployeeIds(spUtil.getCallableStatement().getString("_employee_ids"));
                    outBean.setAccessoryKindIds(spUtil.getCallableStatement().getString("_accessory_kind_ids"));
                    outBean.setEmployeeOilCommissionIds(spUtil.getCallableStatement().getString("_employee_oil_commission_ids"));
                    outBean.setCommission12(spUtil.getCallableStatement().getDouble("_commission_12"));
                    outBean.setCommission45(spUtil.getCallableStatement().getDouble("_commission_45"));
                    outBean.setCommissionLoVo(spUtil.getCallableStatement().getDouble("_commission_lovo"));
                }

                if (rs != null) {
                    GasCommissionReportBean bean = null;
                    while (rs.next()) {
                        bean = new GasCommissionReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setEmployeeId(rs.getInt("employee_id"));
                        bean.setQuantity12(rs.getInt("quantity_12"));
                        bean.setQuantity45(rs.getInt("quantity_45"));
                        bean.setQuantityLoVo(rs.getInt("quantity_lovo"));
                        bean.setAccessoryKindId(rs.getInt("accessory_kind_id"));
                        bean.setQuantityAccessory(rs.getInt("quantity_accessory"));
                        bean.setCommissionAccessory(rs.getDouble("commission_accessory"));
                        bean.setEmployeeOilCommissionId(rs.getInt("employee_oil_commission_id"));
                        bean.setQuantityEmployeeOilCommission(rs.getInt("quantity_employee_oil_commission"));
                        bean.setCommissionEmployeeOilCommission(rs.getDouble("commission_employee_oil_commission"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setVehiclePlate(rs.getString("vehicle_plate"));
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

    public void clearGasCommissionReport(String session_id) throws Exception {
        SPUtil spUtil = null;
        ResultSet rs = null;
        try {
            String sql = "{call clear_gas_commission_report(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_session_id", session_id);

                rs = spUtil.executeQuery();
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
    }

    public ArrayList getGasEmployeeCommissionReport(String fromDate, String endDate, String organizationIds, String sessionId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_gas_employee_commission(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setString("_session_id", sessionId);
                spUtil.getCallableStatement().setInt("_need_delete", 1);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    GasEmployeeCommissionReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new GasEmployeeCommissionReportBean();
                        bean.setCount(count++ + "");
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setCommission(rs.getDouble("amount"));
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

    public ArrayList getVendorDebtReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_vendor_debt(?,?,?)}";
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
                    VendorDebtReportBean bean = null;
                    while (rs.next()) {
                        bean = new VendorDebtReportBean();
                        bean.setVendorCode(rs.getString("vendor_code"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
                        bean.setAmount(rs.getInt("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setEndingStock(bean.getOpeningStock() + bean.getAmount() - bean.getPaid());
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

    public ArrayList exportAccessoryOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_accessory_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    AccessoryOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new AccessoryOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setAccessoryName(rs.getString("accessory_name"));
                        bean.setAccessoryId(rs.getInt("accessory_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importAccessoryOpeningStock(String date, AccessoryOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importAccessoryOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_accessory_id", bean.getAccessoryId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportCustomerOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_customer_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    CustomerOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new CustomerOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setOpeningStock(rs.getDouble("opening_stock"));
                        bean.setOpeningStock12(rs.getInt("opening_stock_12"));
                        bean.setOpeningStock45(rs.getInt("opening_stock_45"));
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

    public void importCustomerOpeningStock(String date, CustomerOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importCustomerOpeningStock(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.getCallableStatement().setInt("_in_stock_12", bean.getOpeningStock12());
                spUtil.getCallableStatement().setInt("_in_stock_45", bean.getOpeningStock45());
                spUtil.execute();
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
    }

    public ArrayList exportGoodOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_good_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    GoodOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new GoodOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setStoreName(rs.getString("store_name"));
                        bean.setStoreId(rs.getInt("store_id"));
                        bean.setGoodName(rs.getString("good_name"));
                        bean.setGoodId(rs.getInt("good_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importGoodOpeningStock(String date, GoodOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importGoodOpeningStock(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setInt("_good_id", bean.getGoodId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportLpgOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_lpg_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    LpgOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new LpgOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importLpgOpeningStock(String date, LpgOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importLpgOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportMoneyOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_money_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    MoneyOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new MoneyOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setAccountName(rs.getString("account_name"));
                        bean.setAccountId(rs.getInt("account_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importMoneyOpeningStock(String date, MoneyOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importMoneyOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportPetroOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_petro_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    PetroOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new PetroOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setStoreName(rs.getString("store_name"));
                        bean.setStoreId(rs.getInt("store_id"));
                        bean.setPetroName(rs.getString("petro_name"));
                        bean.setPetroId(rs.getInt("petro_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importPetroOpeningStock(String date, PetroOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importPetroOpeningStock(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setInt("_petro_id", bean.getPetroId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportPromotionMaterialOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_promotion_material_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    PromotionMaterialOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new PromotionMaterialOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setPromotionMaterialName(rs.getString("promotion_material_name"));
                        bean.setPromotionMaterialId(rs.getInt("promotion_material_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importPromotionMaterialOpeningStock(String date, PromotionMaterialOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importPromotionMaterialOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_promotion_material_id", bean.getPromotionMaterialId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportShellGasOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_shell_gas_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    ShellGasOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new ShellGasOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setShellName(rs.getString("shell_name"));
                        bean.setShellId(rs.getInt("shell_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importShellGasOpeningStock(String date, ShellGasOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importShellGasOpeningStock(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportShellOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_shell_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    ShellOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new ShellOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setShellName(rs.getString("shell_name"));
                        bean.setShellId(rs.getInt("shell_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importShellOpeningStock(String date, ShellOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importShellOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportShieldOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_shield_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    ShieldOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new ShieldOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importShieldOpeningStock(String date, ShieldOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importShieldOpeningStock(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.execute();
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
    }

    public ArrayList exportVendorOpeningStock(String date) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call export_vendor_opening_stock(?)}";
            if (GenericValidator.isBlankOrNull(date)) {
                date = DateUtil.today("dd/MM/yyyy");
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    VendorOpeningStockBean bean = null;
                    while (rs.next()) {
                        bean = new VendorOpeningStockBean();
                        bean.setOrganizationName(rs.getString("organization_name"));
                        bean.setOrganizationId(rs.getInt("organization_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
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

    public void importVendorOpeningStock(String date, VendorOpeningStockUploadBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call importVendorOpeningStock(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_date", date);
                spUtil.getCallableStatement().setInt("_organization_id", bean.getOrganizationId());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setDouble("_in_stock", bean.getOpeningStock());
                spUtil.getCallableStatement().setDouble("_in_stock_transport", bean.getOpeningStockTransport());
                spUtil.execute();
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
    }

    public ArrayList getTransportFeeReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_transport_fee(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_p100_km", Types.FLOAT);
                spUtil.getCallableStatement().registerOutParameter("_p1000_kg", Types.FLOAT);

                rs = spUtil.executeQuery();

                float p100km = spUtil.getCallableStatement().getFloat("_p100_km");
                float p1000kg = spUtil.getCallableStatement().getFloat("_p1000_kg");

                if (rs != null) {
                    TransportFeeReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new TransportFeeReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setRouteName(rs.getString("route_name"));
                        bean.setDistance(rs.getInt("distance"));
                        bean.setPaperQuantity(rs.getInt("paper_quantity"));
                        bean.setActualQuantity(rs.getInt("actual_quantity"));
                        bean.setDiff(bean.getActualQuantity() - bean.getPaperQuantity());
                        bean.setTotal(bean.getDistance() * p100km / 1000 + bean.getPaperQuantity() * p1000kg / 1000);
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(bean.getTotal() * bean.getPrice());
                        bean.setStoreName(rs.getString("store_name"));
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

    public ArrayList getVehicleFeeReport(String fromDate, String endDate, String organizationIds, int vehicleId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_vehicle_fee(?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vehicle_id", vehicleId);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    VehicleFeeReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new VehicleFeeReportBean();
                        bean.setCount(count++);
                        bean.setContent(rs.getString("content"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(bean.getQuantity() * bean.getPrice());
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

    public ArrayList getCompareVendorReport(String fromDate, String endDate, String organizationIds, int vendorId, CompareVendorReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_vendor(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
                spUtil.getCallableStatement().registerOutParameter("_opening_debt", Types.DOUBLE);

                rs = spUtil.executeQuery();

                double openingDebt = spUtil.getCallableStatement().getDouble("_opening_debt");
                outBean.setOpeningStockAmount(openingDebt);
                if (rs != null) {
                    CompareVendorReportBean bean = null;
                    while (rs.next()) {
                        bean = new CompareVendorReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setContent(rs.getString("content"));
                        bean.setQuantity(rs.getDouble("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(openingDebt + bean.getAmount() - bean.getPaid());
                        openingDebt = bean.getDebt();
                        list.add(bean);
                    }
                }
                outBean.setEndingStockAmount(openingDebt);
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

    public ArrayList getTransportSaleReport(String fromDate, String endDate, String organizationIds, String vendorIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_transport_sale(?,?,?,?)}";
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
                    TransportSaleReportBean bean = null;
                    while (rs.next()) {
                        bean = new TransportSaleReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVehiclePlate(rs.getString("plate"));
                        bean.setEmployeeName(rs.getString("employee_names"));
                        bean.setQuantity12(rs.getInt("quantity_12"));
                        bean.setQuantity45(rs.getInt("quantity_45"));
                        bean.setShellReturn12(rs.getInt("shell_return_12"));
                        bean.setShellReturn12T(rs.getInt("shell_return_12t"));
                        bean.setShellReturn45(rs.getInt("shell_return_45"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setAmount(rs.getDouble("total"));
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

    public ArrayList getCompareLPGReport(String fromDate, String endDate, String organizationIds, int customerId, CompareLPGReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_lpg(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_amount_debt", Types.DOUBLE);

                rs = spUtil.executeQuery();

                double amountDebt = spUtil.getCallableStatement().getDouble("_amount_debt");
                outBean.setOpeningAmountStock(amountDebt);
                if (rs != null) {
                    CompareLPGReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new CompareLPGReportBean();
                        bean.setCount(count++);
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setContent(rs.getString("note"));
                        bean.setQuantity(rs.getDouble("quantity"));
                        bean.setVat(rs.getDouble("vat"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setPriceTransport(rs.getDouble("price_transport"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setAmount(bean.getQuantity() * bean.getPrice() * bean.getRate() * (100 + bean.getVat()) / 100 / 1000);
                        bean.setAmountTransport(bean.getQuantity() * bean.getPriceTransport() * bean.getRate() * (100 + bean.getVat()) / 100 / 1000);
                        bean.setTotal(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(amountDebt + bean.getTotal() - rs.getDouble("paid"));
                        amountDebt = bean.getDebt();
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

    public ArrayList getLpgSaleReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_lpg_sale(?,?,?)}";
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
                    LpgSaleReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new LpgSaleReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("sale_date"), "dd/MM/yyyy"));
                        bean.setCustomerCode(rs.getString("customer_code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setPriceTransport(rs.getDouble("price_transport"));
                        bean.setVat(rs.getDouble("vat"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setAccount(rs.getString("account"));
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

    public ArrayList getTransportServiceReport(int organizationId, String fromDate, String endDate, String organizationIds, int vendorId, int customerId, int transporterId, TransportServiceReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_transport_service(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
                spUtil.getCallableStatement().setInt("_customer_id", customerId);
                spUtil.getCallableStatement().setInt("_transporter_id", transporterId);
                spUtil.getCallableStatement().setInt("_organization_id_log", organizationId);
                spUtil.getCallableStatement().registerOutParameter("_amount_debt", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_customer_name", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_customer_address", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_customer_tax", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_customer_phone", Types.VARCHAR);
                spUtil.getCallableStatement().registerOutParameter("_customer_fax", Types.VARCHAR);

                rs = spUtil.executeQuery();

                double amountDebt = spUtil.getCallableStatement().getDouble("_amount_debt");
                outBean.setAmountDebt(amountDebt);
                outBean.setCustomerName(spUtil.getCallableStatement().getString("_customer_name"));
                outBean.setCustomerAddress(spUtil.getCallableStatement().getString("_customer_address"));
                outBean.setCustomerTax(spUtil.getCallableStatement().getString("_customer_tax"));
                outBean.setCustomerPhone(spUtil.getCallableStatement().getString("_customer_phone"));
                outBean.setCustomerFax(spUtil.getCallableStatement().getString("_customer_fax"));
                if (rs != null) {
                    TransportServiceReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new TransportServiceReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setCount(count++);
                        bean.setCustomerName(rs.getString("customer"));
                        bean.setContent(rs.getString("content"));
                        bean.setInQuantity(rs.getInt("in_quantity"));
                        bean.setOutQuantity(rs.getInt("out_quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setPriceDiff(rs.getDouble("price_diff"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setRateDiff(rs.getDouble("rate_diff"));
                        bean.setAmount(bean.getInQuantity() * bean.getPrice() * bean.getRate() / 1000);
                        bean.setAmountDiff((bean.getOutQuantity() - bean.getInQuantity()) * bean.getPriceDiff() * bean.getRateDiff() / 1000);
                        bean.setTotal(bean.getAmount() + bean.getAmountDiff());
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(amountDebt + bean.getTotal() - rs.getDouble("paid"));
                        amountDebt = bean.getDebt();
                        bean.setNote(rs.getString("note"));
                        list.add(bean);
                    }
                    outBean.setClosingDebt(amountDebt);
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

    public ArrayList getCompareGasReport(String fromDate, String endDate, String organizationIds, int vendorId, CompareGasReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_gas(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
                spUtil.getCallableStatement().registerOutParameter("_shell12_debt", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_shell45_debt", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_amount_debt", Types.DOUBLE);

                rs = spUtil.executeQuery();

                double amountDebt = spUtil.getCallableStatement().getDouble("_amount_debt");
                int shell12Debt = spUtil.getCallableStatement().getInt("_shell12_debt");
                int shell45Debt = spUtil.getCallableStatement().getInt("_shell45_debt");
                outBean.setAmountDebt(amountDebt);
                outBean.setShell12Debt(shell12Debt);
                outBean.setShell45Debt(shell45Debt);
                if (rs != null) {
                    CompareGasReportBean bean = null;
                    while (rs.next()) {
                        bean = new CompareGasReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setQuantity12(rs.getInt("quantity_12"));
                        bean.setQuantity45(rs.getInt("quantity_45"));
                        bean.setQuantitySum(bean.getQuantity12() + bean.getQuantity45());
                        bean.setAmount12(rs.getDouble("amount_12"));
                        bean.setAmount45(rs.getDouble("amount_45"));
                        bean.setAmount(bean.getAmount12() + bean.getAmount45());
                        if (bean.getQuantity12() != 0) {
                            bean.setPrice12(bean.getAmount12() / bean.getQuantity12());
                        }
                        if (bean.getQuantity45() != 0) {
                            bean.setPrice45(bean.getAmount45() / bean.getQuantity45());
                        }
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(amountDebt + bean.getAmount() - rs.getDouble("paid"));
                        bean.setReturnShell12(rs.getInt("shell_return_12"));
                        bean.setReturnShell45(rs.getInt("shell_return_45"));
                        bean.setDebtShell12(shell12Debt + bean.getQuantity12() - bean.getReturnShell12());
                        bean.setDebtShell45(shell45Debt + bean.getQuantity45() - bean.getReturnShell45());
                        amountDebt = bean.getDebt();
                        shell12Debt = bean.getDebtShell12();
                        shell45Debt = bean.getDebtShell45();
                        list.add(bean);
                    }
                    outBean.setClosingAmountDebt(amountDebt);
                    outBean.setClosingShell12Debt(shell12Debt);
                    outBean.setClosingShell45Debt(shell45Debt);
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

    public ArrayList getCompareLPGVendorCustomerReport(String fromDate, String endDate, String organizationIds, int vendorCustomerId, CompareLPGVendorCustomerReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_lpg_vendor_customer(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_customer_id", vendorCustomerId);
                spUtil.getCallableStatement().registerOutParameter("_opening_stock", Types.DOUBLE);

                rs = spUtil.executeQuery();

                double openingStock = spUtil.getCallableStatement().getDouble("_opening_stock");
                outBean.setOpeningStock(openingStock);
                if (rs != null) {
                    CompareLPGVendorCustomerReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new CompareLPGVendorCustomerReportBean();
                        bean.setCount(count++);
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setContent(rs.getString("content"));
                        bean.setNote(rs.getString("note"));
                        bean.setInQuantity(rs.getDouble("in_quantity"));
                        if ("MUON".equals(rs.getString("content_code"))) {
                            bean.setOutQuantity(rs.getDouble("link_lpg_quantity") + bean.getInQuantity());
                        }
                        bean.setTransportQuantity(rs.getDouble("transport_quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(openingStock + bean.getAmount() - rs.getDouble("paid"));
                        openingStock = bean.getDebt();
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

    public ArrayList getGasShellReport(String fromDate, String endDate, String organizationIds, String sessionId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_shell(?,?,?)}";
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
                    ShellReportBean bean = null;
                    while (rs.next()) {
                        bean = new ShellReportBean();
                        bean.setShellVendorId(rs.getInt("shell_vendor_id"));
                        bean.setName(rs.getString("shell_name"));
                        bean.setOpeningStock(rs.getDouble("opening_stock"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setChangeCreatedDate(DateUtil.formatDate(rs.getDate("change_created_date"), "dd/MM"));
                        bean.setChangeQuantity(rs.getInt("change_quantity"));
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

    public ArrayList getEmployeeSalaryReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_employee_salary(?,?,?)}";
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
                    EmployeeSalaryReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new EmployeeSalaryReportBean();
                        bean.setCount(count++);
                        bean.setFullname(rs.getString("employee_name"));
                        bean.setWorkingDay(rs.getInt("working_day"));
                        bean.setBasicSalary(rs.getDouble("basic_salary"));
                        bean.setRealSalary(rs.getDouble("real_salary"));
                        bean.setSalaryField(rs.getDouble("salary_field"));
                        bean.setCommission(rs.getDouble("commission"));
                        bean.setBonus(rs.getDouble("bonus"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setAdvance(rs.getDouble("advance"));
                        bean.setBhxh(rs.getDouble("bhxh"));
                        bean.setPanelty(rs.getDouble("panelty"));
                        bean.setActualReceived(rs.getDouble("actual_received"));
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

    public ArrayList getEmployeeOffReport(int year, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_employee_off(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_year", year);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);

                rs = spUtil.executeQuery();
                if (rs != null) {
                    EmployeeOffReportBean bean = null;
                    while (rs.next()) {
                        bean = new EmployeeOffReportBean();
                        bean.setEmployeeId(rs.getInt("id"));
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setMonth01(rs.getFloat("month_01"));
                        bean.setMonth02(rs.getFloat("month_02"));
                        bean.setMonth03(rs.getFloat("month_03"));
                        bean.setMonth04(rs.getFloat("month_04"));
                        bean.setMonth05(rs.getFloat("month_05"));
                        bean.setMonth06(rs.getFloat("month_06"));
                        bean.setMonth07(rs.getFloat("month_07"));
                        bean.setMonth08(rs.getFloat("month_08"));
                        bean.setMonth09(rs.getFloat("month_09"));
                        bean.setMonth10(rs.getFloat("month_10"));
                        bean.setMonth11(rs.getFloat("month_11"));
                        bean.setMonth12(rs.getFloat("month_12"));
                        bean.setTotalYear(rs.getFloat("total"));
                        bean.setDayoffQuantity(rs.getFloat("dayoff_quantity"));
                        bean.setDayoffName(rs.getString("dayoff_name"));
                        bean.setDayoffId(rs.getInt("dayoff_id"));
                        bean.setDayoffQuantityTotal(rs.getFloat("dayoff_quantity_total"));
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

    public ArrayList getEmployeeWorkingTimeReport(String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_employee_working_time(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    EmployeeWorkingTimeReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new EmployeeWorkingTimeReportBean();
                        bean.setCount(count++);
                        bean.setEmployeeName(rs.getString("employee_name"));
                        bean.setStartDate(DateUtil.formatDate(rs.getDate("start_date"), "dd/MM/yyyy"));
                        bean.setYearCount(rs.getFloat("year_count"));
                        bean.setEnought2(rs.getFloat("enought2"));
                        bean.setSeniority(rs.getFloat("seniority") * bean.getEnought2());
                        bean.setNotEnought2(rs.getFloat("not_enought2"));
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

    public ArrayList getOilImportReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_import(?,?,?)}";
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
                    OilImportReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new OilImportReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setOilName(rs.getString("oilName"));
                        bean.setStoreName(rs.getString("storeName"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
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

    public ArrayList getOilStockStoreReport(String fromDate, String endDate, String organizationIds, int storeId, int oilId, String session_id, OilStockReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_stock_store(?,?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_store_id", storeId);
                spUtil.getCallableStatement().setInt("_oil_id", oilId);
                spUtil.getCallableStatement().setString("_session_id", session_id);
                spUtil.getCallableStatement().registerOutParameter("_oil_ids", Types.VARCHAR);

                rs = spUtil.executeQuery();

                if (outBean != null) {
                    outBean.setOilIds(spUtil.getCallableStatement().getString("_oil_ids"));
                }
                if (rs != null) {
                    OilStockReportBean bean = null;
                    int stock = 0;
                    boolean firstTime = true;
                    while (rs.next()) {
                        bean = new OilStockReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setOilId(rs.getInt("oil_id"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setSaleQuantity(rs.getInt("export_quantity"));
                        if (firstTime) {
                            stock = rs.getInt("opening_stock");
                            outBean.setOpeningStock(stock);
                            firstTime = false;
                        }
                        bean.setStock(stock + bean.getImportQuantity() - bean.getSaleQuantity());
                        stock = bean.getStock();
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

    public void clearOilStockReport(String session_id) throws Exception {
        SPUtil spUtil = null;
        ResultSet rs = null;
        try {
            String sql = "{call clear_oil_stock_report(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_session_id", session_id);

                rs = spUtil.executeQuery();
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
    }

    public ArrayList getOilStockReport(String fromDate, String endDate, String organizationIds, int oilId, String session_id, OilStockReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_stock(?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_oil_id", oilId);
                spUtil.getCallableStatement().setString("_session_id", session_id);
                spUtil.getCallableStatement().registerOutParameter("_oil_ids", Types.VARCHAR);

                rs = spUtil.executeQuery();

                outBean.setOilIds(spUtil.getCallableStatement().getString("_oil_ids"));
                if (rs != null) {
                    OilStockReportBean bean = null;
                    int stock = 0;
                    boolean firstTime = true;
                    while (rs.next()) {
                        bean = new OilStockReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setOilId(rs.getInt("oil_id"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setSaleQuantity(rs.getInt("export_quantity"));
                        if (firstTime) {
                            stock = rs.getInt("opening_stock");
                            outBean.setOpeningStock(stock);
                            firstTime = false;
                        }
                        bean.setStock(stock + bean.getImportQuantity() - bean.getSaleQuantity());
                        stock = bean.getStock();
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

    public ArrayList getOilSaleReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_sale(?,?,?)}";
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
                    OilSaleReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new OilSaleReportBean();
                        bean.setCount(count++ + "");
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerCode(rs.getString("customerCode"));
                        bean.setCustomerName(rs.getString("customerName"));
                        bean.setOilCode(rs.getString("oilCode"));
                        bean.setStoreName(rs.getString("storeName"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setCommission(rs.getDouble("commission"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setAgencyCommission(rs.getDouble("agency_commission"));
                        bean.setActualTotal(rs.getDouble("actual_total"));
                        bean.setPaymentMethod(rs.getString("account"));
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

    public ArrayList getCompareAgencyCommissionReport(String fromDate, String endDate, String organizationIds, int agencyId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_agency_commission(?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_agency_id", agencyId);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    CompareAgencyCommissionReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new CompareAgencyCommissionReportBean();
                        bean.setCount(count++);
                        bean.setCustomerCode(rs.getString("customer_code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setUnitName(rs.getString("unit_name"));
                        bean.setOilExportCode(rs.getString("oil_export_code"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setCommission(rs.getDouble("commission"));
                        bean.setAmount(rs.getDouble("amount"));
                        if (rs.getInt("is_paid") == 1) {
                            bean.setPaid(bean.getCommission());
                        }
                        bean.setDebt(bean.getCommission() - bean.getPaid());
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

    public ArrayList getOilCompareReport(String fromDate, String endDate, String organizationIds, int customerId, OilCompareReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_compare(?,?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_amount_debt", Types.DOUBLE);
                spUtil.getCallableStatement().registerOutParameter("_customer_commission", Types.FLOAT);

                rs = spUtil.executeQuery();

                outBean.setOpeningAmountStock(spUtil.getCallableStatement().getDouble("_amount_debt"));
                outBean.setCustomerCommission(spUtil.getCallableStatement().getFloat("_customer_commission"));
                if (rs != null) {
                    OilCompareReportBean bean = null;
                    int count = 1;
                    double commission = 0;
                    while (rs.next()) {
                        bean = new OilCompareReportBean();
                        bean.setDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM"));
                        bean.setCount(count++);
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        commission += rs.getDouble("commission");
                        list.add(bean);
                    }
                    outBean.setCustomerCommissionAmount(commission);
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

    public ArrayList getOilExportReport(int oilExportId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_export(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_oil_export_id", oilExportId);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    SaleOilReportBean bean = null;
                    while (rs.next()) {
                        bean = new SaleOilReportBean();
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setUnitName(rs.getString("unit_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setAmount(rs.getDouble("amount"));
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

    public ArrayList getOilVendorStockReport(String fromDate, String endDate, String organizationIds, int vendorId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_vendor_stock(?,?,?,?)}";
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
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);

                rs = spUtil.executeQuery();

                if (rs != null) {
                    OilVendorStockReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new OilVendorStockReportBean();
                        bean.setCount(count++);
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
                        bean.setImportQuantity(rs.getInt("import_quantity"));
                        bean.setExportQuantity(rs.getInt("export_quantity"));
                        bean.setPrice(rs.getDouble("import_price"));
                        bean.setAmount(rs.getDouble("import_amount"));
                        bean.setClosingStock(bean.getOpeningStock() + bean.getImportQuantity() - bean.getExportQuantity());
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

    public ArrayList getOilVendorDebtReport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_vendor_debt(?,?,?)}";
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
                    OilVendorDebtReportBean bean = null;
                    while (rs.next()) {
                        bean = new OilVendorDebtReportBean();
                        bean.setVendorCode(rs.getString("vendor_code"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setOpeningStock(rs.getInt("opening_stock"));
                        bean.setAmount(rs.getInt("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setEndingStock(bean.getOpeningStock() + bean.getAmount() - bean.getPaid());
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

    public ArrayList getCompareCustomerCommissionReport(String fromDate, String endDate, String organizationIds, int customerId) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_compare_customer_commission(?,?,?,?)}";
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

                rs = spUtil.executeQuery();

                if (rs != null) {
                    CompareCustomerCommissionReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new CompareCustomerCommissionReportBean();
                        bean.setCount(count++);
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setUnitName(rs.getString("unit_name"));
                        bean.setOilExportCode(rs.getString("oil_export_code"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setCommission(rs.getDouble("commission"));
                        bean.setAmount(rs.getDouble("amount"));
                        if (rs.getInt("is_paid") == 1) {
                            bean.setPaid(bean.getCommission());
                        }
                        bean.setDebt(bean.getCommission() - bean.getPaid());
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

    public ArrayList getOilCustomerDebtReport(String fromDate, String endDate, String organizationIds, int customerId, OilCustomerDebtReportOutBean outBean) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call report_oil_customer_debt(?,?,?,?,?)}";
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
                spUtil.getCallableStatement().registerOutParameter("_opening_debt", Types.DOUBLE);

                rs = spUtil.executeQuery();

                double openingDebt = spUtil.getCallableStatement().getDouble("_opening_debt");
                outBean.setOpeningDebt(openingDebt);
                if (rs != null) {
                    OilCustomerDebtReportBean bean = null;
                    int count = 1;
                    while (rs.next()) {
                        bean = new OilCustomerDebtReportBean();
                        bean.setCount(count++);
                        bean.setOilExportCode(rs.getString("oil_export_code"));
                        bean.setOilCode(rs.getString("oil_code"));
                        bean.setOilName(rs.getString("oil_name"));
                        bean.setUnitName(rs.getString("unit_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setOpeningDebt(openingDebt);
                        bean.setAmount(rs.getDouble("amount"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(bean.getAmount() - bean.getPaid());
                        bean.setClosingDebt(openingDebt + bean.getDebt());
                        openingDebt = bean.getClosingDebt();
                        list.add(bean);
                    }
                }
                outBean.setClosingDebt(openingDebt);
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
