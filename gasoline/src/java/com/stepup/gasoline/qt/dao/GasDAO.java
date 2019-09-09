/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dao;

import com.stepup.core.database.DBUtil;
import com.stepup.core.database.SPUtil;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleDetailBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleReturnShellDetailBean;
import com.stepup.gasoline.qt.bean.FractionBean;
import com.stepup.gasoline.qt.bean.FractionDetailBean;
import com.stepup.gasoline.qt.bean.GasImportBean;
import com.stepup.gasoline.qt.bean.GasImportDetailBean;
import com.stepup.gasoline.qt.bean.GasPriceBean;
import com.stepup.gasoline.qt.bean.GasRetailBean;
import com.stepup.gasoline.qt.bean.GasRetailDetailBean;
import com.stepup.gasoline.qt.bean.GasRetailPromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.GasRetailReturnShellDetailBean;
import com.stepup.gasoline.qt.bean.GasReturnBean;
import com.stepup.gasoline.qt.bean.GasReturnDetailBean;
import com.stepup.gasoline.qt.bean.GasWholeSaleFeeBean;
import com.stepup.gasoline.qt.bean.GasWholesaleBean;
import com.stepup.gasoline.qt.bean.GasWholesaleDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesaleFeeDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesalePromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesaleReturnShellDetailBean;
import com.stepup.gasoline.qt.bean.LoVoBean;
import com.stepup.gasoline.qt.bean.LoVoEmployeeDetailBean;
import com.stepup.gasoline.qt.bean.LpgImportBean;
import com.stepup.gasoline.qt.bean.LpgSaleBean;
import com.stepup.gasoline.qt.bean.OldShellBean;
import com.stepup.gasoline.qt.bean.PetroImportBean;
import com.stepup.gasoline.qt.bean.PetroImportDetailBean;
import com.stepup.gasoline.qt.bean.SaleInnerBean;
import com.stepup.gasoline.qt.bean.SaleInnerDetailBean;
import com.stepup.gasoline.qt.bean.SaleShellBean;
import com.stepup.gasoline.qt.bean.SaleShellDetailBean;
import com.stepup.gasoline.qt.bean.ShellReturnBean;
import com.stepup.gasoline.qt.bean.ShellReturnDetailBean;
import com.stepup.gasoline.qt.bean.ShellReturnSupplierBean;
import com.stepup.gasoline.qt.bean.ShellReturnSupplierDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInAccessoryDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInBean;
import com.stepup.gasoline.qt.bean.VehicleInDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInOilExportDetailBean;
import com.stepup.gasoline.qt.bean.VehicleInReturnShellDetailBean;
import com.stepup.gasoline.qt.bean.VehicleOutBean;
import com.stepup.gasoline.qt.bean.VehicleOutDetailBean;
import com.stepup.gasoline.qt.bean.VehicleOutEmployeeDetailBean;
import com.stepup.gasoline.qt.exportwholesale.ExportWholesaleFormBean;
import com.stepup.gasoline.qt.fraction.FractionFormBean;
import com.stepup.gasoline.qt.gasimport.GasImportFormBean;
import com.stepup.gasoline.qt.gasprice.GasPriceFormBean;
import com.stepup.gasoline.qt.gasretail.GasRetailFormBean;
import com.stepup.gasoline.qt.gasreturn.GasReturnFormBean;
import com.stepup.gasoline.qt.gaswholesale.GasWholesaleFormBean;
import com.stepup.gasoline.qt.gaswholesalefee.GasWholeSaleFeeFormBean;
import com.stepup.gasoline.qt.lovo.LoVoFormBean;
import com.stepup.gasoline.qt.lpgimport.LpgImportFormBean;
import com.stepup.gasoline.qt.lpgsale.LpgSaleFormBean;
import com.stepup.gasoline.qt.oldshell.OldShellFormBean;
import com.stepup.gasoline.qt.petroimport.PetroImportFormBean;
import com.stepup.gasoline.qt.saleinner.SaleInnerFormBean;
import com.stepup.gasoline.qt.saleshell.SaleShellFormBean;
import com.stepup.gasoline.qt.shellreturn.ShellReturnFormBean;
import com.stepup.gasoline.qt.shellreturnsupplier.ShellReturnSupplierFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vehiclein.VehicleInFormBean;
import com.stepup.gasoline.qt.vehicleout.VehicleOutFormBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class GasDAO extends BasicDAO {

    public ArrayList searchLpgImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchLpgImport(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    LpgImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new LpgImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setImportDate(DateUtil.formatDate(rs.getDate("import_date"), "dd/MM/yyyy"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setActualQuantity(rs.getInt("actual_quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setTotal(rs.getDouble("amount"));
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

    public LpgImportBean getLpgImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),import_date)=0,1,0) as can_edit from lpg_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                LpgImportBean bean = new LpgImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setKind(rs.getInt("kind"));
                bean.setImportDate(DateUtil.formatDate(rs.getDate("import_date"), "dd/MM/yyyy"));
                bean.setPaperQuantity(rs.getInt("paper_quantity"));
                bean.setActualQuantity(rs.getInt("actual_quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setVat(rs.getDouble("vat"));
                bean.setTotal(rs.getDouble("amount"));
                bean.setInvoiceTotal(rs.getDouble("invoice_amount"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setRate(rs.getDouble("rate"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setRouteId(rs.getInt("route_id"));
                bean.setNote(rs.getString("note"));
                bean.setLinkLpgCodes(rs.getString("link_lpg_codes"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public int insertLpgImport(LpgImportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getImportDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getImportDate();
            }
            String sql = "{call insertLpgImport(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_kind", bean.getKind());
                spUtil.getCallableStatement().setString("_import_date", createdDate);
                spUtil.getCallableStatement().setInt("_paper_quantity", bean.getPaperQuantity());
                spUtil.getCallableStatement().setInt("_actual_quantity", bean.getActualQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_vat", bean.getVat());
                spUtil.getCallableStatement().setDouble("_invoice_amount", bean.getInvoiceTotal());
                spUtil.getCallableStatement().setDouble("_amount", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setInt("_route_id", bean.getRouteId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setString("_link_lpg_codes", bean.getLinkLpgCodes());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateLpgImport(LpgImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getImportDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getImportDate();
            }
            String sql = "{call updateLpgImport(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_import_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_kind", bean.getKind());
                spUtil.getCallableStatement().setInt("_paper_quantity", bean.getPaperQuantity());
                spUtil.getCallableStatement().setInt("_actual_quantity", bean.getActualQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_vat", bean.getVat());
                spUtil.getCallableStatement().setDouble("_invoice_amount", bean.getInvoiceTotal());
                spUtil.getCallableStatement().setDouble("_amount", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setInt("_route_id", bean.getRouteId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setString("_link_lpg_codes", bean.getLinkLpgCodes());
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

    public String getNextLpgImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "lpg_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteLpgImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteLpgImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public ArrayList searchFraction(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchFraction(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    FractionFormBean bean = null;
                    while (rs.next()) {
                        bean = new FractionFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
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

    public FractionBean getFraction(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from fraction_gas where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                FractionBean bean = new FractionBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getFractionDetail(int fractionId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, v.code as vendor_code, sv.id as shell_vendor_id"
                + " from fraction_gas_detail as det, shell_vendor as sv, vendor as v, shell as s"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and sv.vendor_id=v.id and det.fraction_id=" + fractionId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            FractionDetailBean bean = null;
            while (rs.next()) {
                bean = new FractionDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setFractionId(rs.getInt("fraction_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertFraction(FractionBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertFraction(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateFraction(FractionBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateFraction(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextFractionNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "fraction_gas");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteFraction(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteFraction(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertFractionDetail(FractionDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertFractionDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_fraction_id", bean.getFractionId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateFractionDetail(FractionDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateFractionDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteFractionDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From fraction_gas_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchGasPrice(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGasPrice(?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GasPriceFormBean bean = null;
                    while (rs.next()) {
                        bean = new GasPriceFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setFromDate(DateUtil.formatDate(rs.getDate("from_date"), "dd/MM/yyyy"));
                        bean.setToDate(DateUtil.formatDate(rs.getDate("to_date"), "dd/MM/yyyy"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setPrice(rs.getDouble("price"));
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

    public GasPriceBean getGasPrice(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select * from gas_price_list where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasPriceBean bean = new GasPriceBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setFromDate(DateUtil.formatDate(rs.getDate("from_date"), "dd/MM/yyyy"));
                bean.setToDate(DateUtil.formatDate(rs.getDate("to_date"), "dd/MM/yyyy"));
                bean.setPrice(rs.getDouble("price"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setNote(rs.getString("note"));
                return bean;
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

    public int insertGasPrice(GasPriceBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String fromDate = "";
            String toDate = "";
            if (GenericValidator.isBlankOrNull(bean.getFromDate())) {
                fromDate = "null";
            } else {
                fromDate = bean.getFromDate();
            }
            if (GenericValidator.isBlankOrNull(bean.getToDate())) {
                toDate = "null";
            } else {
                toDate = bean.getToDate();
            }
            String sql = "{call insertGasPrice(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_from_date", fromDate);
                spUtil.getCallableStatement().setString("_to_date", toDate);
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public void updateGasPrice(GasPriceBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String fromDate = "";
            String toDate = "";
            if (GenericValidator.isBlankOrNull(bean.getFromDate())) {
                fromDate = "null";
            } else {
                fromDate = bean.getFromDate();
            }
            if (GenericValidator.isBlankOrNull(bean.getToDate())) {
                toDate = "null";
            } else {
                toDate = bean.getToDate();
            }
            String sql = "{call updateGasPrice(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_from_date", fromDate);
                spUtil.getCallableStatement().setString("_to_date", toDate);
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextGasPriceNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_price_list");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteGasPrice(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_price_list Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchGasImport(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGasImport(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GasImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new GasImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setStoreId(rs.getInt("store_id"));
//                        bean.setStoreName(rs.getString("store_name"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public GasImportBean getGasImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from gas_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasImportBean bean = new GasImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setRate(rs.getDouble("rate"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getGasImportDetail(int gasImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, u.name as unit_name"
                + " from gas_import_detail as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.gas_import_id=" + gasImportId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasImportDetailBean bean = null;
            while (rs.next()) {
                bean = new GasImportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasImportId(rs.getInt("gas_import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasImport(GasImportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertGasImport(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateGasImport(GasImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateGasImport(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextGasImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteGasImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteGasImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertGasImportDetail(GasImportDetailBean bean, int vendorId) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasImportDetail(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_import_id", bean.getGasImportId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
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
        return result;
    }

    public void updateGasImportDetail(GasImportDetailBean bean, int vendorId) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasImportDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setInt("_vendor_id", vendorId);
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

    public ArrayList searchPetroImport(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchPetroImport(?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    PetroImportFormBean bean = null;
                    while (rs.next()) {
                        bean = new PetroImportFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setStoreId(rs.getInt("store_id"));
                        bean.setStoreName(rs.getString("store_name"));
                        bean.setRate(rs.getDouble("rate"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public PetroImportBean getPetroImport(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from petro_import where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                PetroImportBean bean = new PetroImportBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setStoreId(rs.getInt("store_id"));
                bean.setRate(rs.getDouble("rate"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getPetroImportDetail(int petroImportId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as petro_name"
                + " from petro_import_detail as det, petro as s"
                + " where det.petro_id=s.id and det.petro_import_id=" + petroImportId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            PetroImportDetailBean bean = null;
            while (rs.next()) {
                bean = new PetroImportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setPetroImportId(rs.getInt("petro_import_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setPetroId(rs.getInt("petro_id"));
                bean.setPetroName(rs.getString("petro_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertPetroImport(PetroImportBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertPetroImport(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updatePetroImport(PetroImportBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updatePetroImport(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_store_id", bean.getStoreId());
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

    public String getNextPetroImportNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "petro_import");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deletePetroImport(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deletePetroImport(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertPetroImportDetail(PetroImportDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertPetroImportDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_petro_import_id", bean.getPetroImportId());
                spUtil.getCallableStatement().setInt("_petro_id", bean.getPetroId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updatePetroImportDetail(PetroImportDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updatePetroImportDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deletePetroImportDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From petro_import_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchGasWholesale(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGasWholesale(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GasWholesaleFormBean bean = null;
                    while (rs.next()) {
                        bean = new GasWholesaleFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public GasWholesaleBean getGasWholesale(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from gas_wholesale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasWholesaleBean bean = new GasWholesaleBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setVehicleOutId(rs.getInt("vehicle_out_id"));
                bean.setGasReturn(rs.getInt("gas_return"));
                bean.setGasReturnPrice(rs.getDouble("gas_return_price"));
                bean.setGasReturnAmount(rs.getDouble("gas_return_amount"));
                bean.setOldDebt(rs.getDouble("paid_old_debt_amount"));
                return bean;
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

    public ArrayList getGasWholesaleDetail(int gasWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name, v.code as vendor_code, sv.id as shell_vendor_id, sk.weight"
                + " from gas_wholesale_detail as det, shell_vendor as sv, vendor as v, shell as s, unit as u, shell_kind AS sk"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and sv.vendor_id=v.id and s.unit_id=u.id and s.kind_id=sk.id and det.gas_wholesale_id=" + gasWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasWholesaleDetailBean bean = null;
            while (rs.next()) {
                bean = new GasWholesaleDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasWholesaleId(rs.getInt("gas_wholesale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setShellWeight(rs.getDouble("weight"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasWholesale(GasWholesaleBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertGasWholesale(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_gas_return", bean.getGasReturn());
                spUtil.getCallableStatement().setDouble("_gas_return_price", bean.getGasReturnPrice());
                spUtil.getCallableStatement().setDouble("_gas_return_amount", bean.getGasReturnAmount());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
                spUtil.getCallableStatement().setDouble("_old_paid_debt", bean.getOldDebt());
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

    public void updateGasWholesale(GasWholesaleBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateGasWholesale(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_gas_return", bean.getGasReturn());
                spUtil.getCallableStatement().setDouble("_gas_return_price", bean.getGasReturnPrice());
                spUtil.getCallableStatement().setDouble("_gas_return_amount", bean.getGasReturnAmount());
                spUtil.getCallableStatement().setDouble("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_old_paid_debt", bean.getOldDebt());
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

    public String getNextGasWholesaleNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_wholesale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteGasWholesale(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteGasWholesale(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertGasWholesaleDetail(GasWholesaleDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasWholesaleDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_wholesale_id", bean.getGasWholesaleId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateGasWholesaleDetail(GasWholesaleDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasWholesaleDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteGasWholesaleDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_wholesale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getGasWholesalePromotionMaterialDetail(int gasWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as promotion_material_name, s.unit_id, u.name as unit_name"
                + " from gas_wholesale_promotion as det, promotion_material as s, unit as u"
                + " where det.promotion_material_id=s.id and s.unit_id=u.id and det.gas_wholesale_id=" + gasWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasWholesalePromotionMaterialDetailBean bean = null;
            while (rs.next()) {
                bean = new GasWholesalePromotionMaterialDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasWholesaleId(rs.getInt("gas_wholesale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPromotionMaterialId(rs.getInt("promotion_material_id"));
                bean.setPromotionMaterialName(rs.getString("promotion_material_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public ArrayList getGasWholesaleFeeDetail(int gasWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, f.name as fee_name"
                + " from gas_wholesale_fee_detail as det, gas_wholesale_fee f"
                + " where det.fee_id=f.id and det.gas_wholesale_id=" + gasWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasWholesaleFeeDetailBean bean = null;
            while (rs.next()) {
                bean = new GasWholesaleFeeDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasWholesaleId(rs.getInt("gas_wholesale_id"));
                bean.setKind(rs.getInt("kind"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setFeeId(rs.getInt("fee_id"));
                bean.setFeeName(rs.getString("fee_name"));
                bean.setNote(rs.getString("note"));
                detailList.add(bean);
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
        return detailList;
    }

    public ArrayList getGasWholesaleReturnShellDetail(int gasWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from gas_wholesale_return_shell as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.gas_wholesale_id=" + gasWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasWholesaleReturnShellDetailBean bean = null;
            while (rs.next()) {
                bean = new GasWholesaleReturnShellDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasWholesaleId(rs.getInt("gas_wholesale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasWholesalePromotionMaterialDetail(GasWholesalePromotionMaterialDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasWholesalePromotionMaterialDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_wholesale_id", bean.getGasWholesaleId());
                spUtil.getCallableStatement().setInt("_promotion_material_id", bean.getPromotionMaterialId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateGasWholesalePromotionMaterialDetail(GasWholesalePromotionMaterialDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasWholesalePromotionMaterialDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteGasWholesalePromotionMaterialDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_wholesale_promotion Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertGasWholesaleReturnShellDetail(GasWholesaleReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasWholesaleReturnShellDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_wholesale_id", bean.getGasWholesaleId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateGasWholesaleReturnShellDetail(GasWholesaleReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasWholesaleReturnShellDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteGasWholesaleReturnShellDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_wholesale_return_shell Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertGasWholesaleFeeDetail(GasWholesaleFeeDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasWholesaleFeeDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_wholesale_id", bean.getGasWholesaleId());
                spUtil.getCallableStatement().setInt("_fee_id", bean.getFeeId());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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
        return result;
    }

    public void updateGasWholesaleFeeDetail(GasWholesaleFeeDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasWholesaleFeeDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public int deleteGasWholesaleFeeDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_wholesale_fee_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchGasRetail(String fromDate, String endDate) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGasRetail(?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GasRetailFormBean bean = null;
                    while (rs.next()) {
                        bean = new GasRetailFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public GasRetailBean getGasRetail(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from gas_retail where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasRetailBean bean = new GasRetailBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setVehicleId(rs.getInt("vehicle_id"));
                return bean;
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

    public ArrayList getGasRetailDetail(int gasRetailId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from gas_retail_detail as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.gas_retail_id=" + gasRetailId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasRetailDetailBean bean = null;
            while (rs.next()) {
                bean = new GasRetailDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasRetailId(rs.getInt("gas_retail_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasRetail(GasRetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertGasRetail(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public void updateGasRetail(GasRetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasRetail(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextGasRetailNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_retail");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteGasRetail(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteGasRetail(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertGasRetailDetail(GasRetailDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasRetailDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_retail_id", bean.getGasRetailId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateGasRetailDetail(GasRetailDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasRetailDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public ArrayList getGasRetailPromotionMaterialDetail(int gasRetailId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as promotion_material_name, s.unit_id, u.name as unit_name"
                + " from gas_retail_promotion as det, promotion_material as s, unit as u"
                + " where det.promotion_material_id=s.id and s.unit_id=u.id and det.gas_retail_id=" + gasRetailId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasRetailPromotionMaterialDetailBean bean = null;
            while (rs.next()) {
                bean = new GasRetailPromotionMaterialDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasRetailId(rs.getInt("gas_retail_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPromotionMaterialId(rs.getInt("promotion_material_id"));
                bean.setPromotionMaterialName(rs.getString("promotion_material_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public ArrayList getGasRetailReturnShellDetail(int gasRetailId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from gas_retail_return_shell as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.gas_retail_id=" + gasRetailId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasRetailReturnShellDetailBean bean = null;
            while (rs.next()) {
                bean = new GasRetailReturnShellDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasRetailId(rs.getInt("gas_retail_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasRetailPromotionMaterialDetail(GasRetailPromotionMaterialDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasRetailPromotionMaterialDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_retail_id", bean.getGasRetailId());
                spUtil.getCallableStatement().setInt("_promotion_material_id", bean.getPromotionMaterialId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateGasRetailPromotionMaterialDetail(GasRetailPromotionMaterialDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasRetailPromotionMaterialDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int insertGasRetailReturnShellDetail(GasRetailReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasRetailReturnShellDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_retail_id", bean.getGasRetailId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateGasRetailReturnShellDetail(GasRetailReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasRetailReturnShellDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public ArrayList searchSaleShell(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleShell(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleShellFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleShellFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public SaleShellBean getSaleShell(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from shell_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleShellBean bean = new SaleShellBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setCustomerId(rs.getInt("customer_id"));
                return bean;
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

    public ArrayList getSaleShellDetail(int saleShellId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from shell_sale_detail as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.shell_sale_id=" + saleShellId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleShellDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleShellDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleShellId(rs.getInt("shell_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertSaleShell(SaleShellBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertSaleShell(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateSaleShell(SaleShellBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateSaleShell(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
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

    public String getNextSaleShellNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shell_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteSaleShell(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleShell(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertSaleShellDetail(SaleShellDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleShellDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_shell_sale_id", bean.getSaleShellId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateSaleShellDetail(SaleShellDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleShellDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteSaleShellDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From shell_sale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchOldShell(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchOldShell(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    OldShellFormBean bean = null;
                    while (rs.next()) {
                        bean = new OldShellFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setNote(rs.getString("note"));
                        bean.setShellId(rs.getInt("shell_id"));
                        bean.setShellName(rs.getString("shell_name"));
                        bean.setQuantity(rs.getInt("quantity"));
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

    public OldShellBean getOldShell(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),created_date)=0,1,0) as can_edit from old_shell where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                OldShellBean bean = new OldShellBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public int insertOldShell(OldShellBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertOldShell(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateOldShell(OldShellBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateOldShell(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextOldShellNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "old_shell");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteOldShell(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteOldShell(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public ArrayList searchShellReturn(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchShellReturn(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ShellReturnFormBean bean = null;
                    while (rs.next()) {
                        bean = new ShellReturnFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setVehicleId(rs.getInt("vehicle_id"));
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

    public ShellReturnBean getShellReturn(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from shell_return where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellReturnBean bean = new ShellReturnBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setVehicleId(rs.getInt("vehicle_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getShellReturnDetail(int shellReturnId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name"
                + " from shell_return_detail as det, shell as s"
                + " where det.shell_id=s.id and det.shell_return_id=" + shellReturnId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ShellReturnDetailBean bean = null;
            while (rs.next()) {
                bean = new ShellReturnDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setShellReturnId(rs.getInt("shell_return_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertShellReturn(ShellReturnBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertShellReturn(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateShellReturn(ShellReturnBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateShellReturn(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextShellReturnNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shell_return");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteShellReturn(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteShellReturn(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertShellReturnDetail(ShellReturnDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertShellReturnDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_shell_return_id", bean.getShellReturnId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateShellReturnDetail(ShellReturnDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateShellReturnDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteShellReturnDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From shell_return_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchGasReturn(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchGasReturn(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    GasReturnFormBean bean = null;
                    while (rs.next()) {
                        bean = new GasReturnFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public GasReturnBean getGasReturn(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(MONTH(created_date)=MONTH(SYSDATE()) AND YEAR(created_date)=YEAR(SYSDATE()),1,0) as can_edit from gas_return where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasReturnBean bean = new GasReturnBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setCustomerId(rs.getInt("customer_id"));
                return bean;
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

    public ArrayList getGasReturnDetail(int gasReturnId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id"
                + " from gas_return_detail as det, shell as s"
                + " where det.shell_id=s.id and det.gas_return_id=" + gasReturnId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasReturnDetailBean bean = null;
            while (rs.next()) {
                bean = new GasReturnDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setGasReturnId(rs.getInt("gas_return_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertGasReturn(GasReturnBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertGasReturn(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateGasReturn(GasReturnBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasReturn(?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextGasReturnNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_return");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteGasReturn(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteGasReturn(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertGasReturnDetail(GasReturnDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertGasReturnDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_return_id", bean.getGasReturnId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateGasReturnDetail(GasReturnDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateGasReturnDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public ArrayList searchShellReturnSupplier(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchShellReturnSupplier(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ShellReturnSupplierFormBean bean = null;
                    while (rs.next()) {
                        bean = new ShellReturnSupplierFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVendorId(rs.getInt("vendor_id"));
                        bean.setVendorName(rs.getString("vendor_name"));
                        bean.setVehicleId(rs.getInt("vehicle_id"));
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

    public ShellReturnSupplierBean getShellReturnSupplier(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from shell_return_supplier where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ShellReturnSupplierBean bean = new ShellReturnSupplierBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVendorId(rs.getInt("vendor_id"));
                bean.setVehicleId(rs.getInt("vehicle_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getShellReturnSupplierDetail(int shellReturnSupplierId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name"
                + " from shell_return_supplier_detail as det, shell as s"
                + " where det.shell_id=s.id and det.shell_return_supplier_id=" + shellReturnSupplierId;
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ShellReturnSupplierDetailBean bean = null;
            while (rs.next()) {
                bean = new ShellReturnSupplierDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setShellReturnSupplierId(rs.getInt("shell_return_supplier_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertShellReturnSupplier(ShellReturnSupplierBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertShellReturnSupplier(?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateShellReturnSupplier(ShellReturnSupplierBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateShellReturnSupplier(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vendor_id", bean.getVendorId());
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextShellReturnSupplierNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "shell_return_supplier");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteShellReturnSupplier(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteShellReturnSupplier(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertShellReturnSupplierDetail(ShellReturnSupplierDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertShellReturnSupplierDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_shell_return_supplier_id", bean.getShellReturnSupplierId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateShellReturnSupplierDetail(ShellReturnSupplierDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateShellReturnSupplierDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteShellReturnSupplierDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From shell_return_supplier_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchVehicleOut(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchVehicleOut(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    VehicleOutFormBean bean = null;
                    while (rs.next()) {
                        bean = new VehicleOutFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVehicleId(rs.getInt("vehicle_id"));
                        bean.setVehiclePlate(rs.getString("vehicle_plate"));
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

    public VehicleOutBean getVehicleOut(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select vo.*, v.plate, IF(DATEDIFF(SYSDATE(),vo.created_date)=0,1,0) as can_edit from vehicle_out as vo, vehicle as v"
                + " where vo.vehicle_id=v.id and vo.id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VehicleOutBean bean = new VehicleOutBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVehicleId(rs.getInt("vehicle_id"));
                bean.setVehiclePlate(rs.getString("plate"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getVehicleOutDetail(int vehicleOutId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, u.id as unit_id, u.name as unit_name, v.code as vendor_code, sv.id as shell_vendor_id"
                + " from vehicle_out_detail as det, shell_vendor as sv, vendor as v, shell as s, unit as u"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and sv.vendor_id=v.id and s.unit_id=u.id and det.vehicle_out_id=" + vehicleOutId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleOutDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleOutDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleOutId(rs.getInt("vehicle_out_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_vendor_id"));
                bean.setShellName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertVehicleOut(VehicleOutBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertVehicleOut(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateVehicleOut(VehicleOutBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateVehicleOut(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vehicle_id", bean.getVehicleId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextVehicleOutNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "vehicle_out");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteVehicleOut(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteVehicleOut(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertVehicleOutDetail(VehicleOutDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleOutDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateVehicleOutDetail(VehicleOutDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVehicleOutDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteVehicleOutDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_out_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getVehicleOutEmployeeDetail(int vehicleOutId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, e.fullname"
                + " from vehicle_out_employee_detail as det, employee as e"
                + " where det.employee_id=e.id and det.vehicle_out_id=" + vehicleOutId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleOutEmployeeDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleOutEmployeeDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleOutId(rs.getInt("vehicle_out_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setEmployeeName(rs.getString("fullname"));
                bean.setNote(rs.getString("note"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertVehicleOutEmployeeDetail(VehicleOutEmployeeDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleOutEmployeeDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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
        return result;
    }

    public void updateVehicleOutEmployeeDetail(VehicleOutEmployeeDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVehicleOutEmployeeDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public int deleteVehicleOutEmployeeDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_out_employee_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchVehicleIn(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchVehicleIn(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    VehicleInFormBean bean = null;
                    while (rs.next()) {
                        bean = new VehicleInFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setVehicleOutId(rs.getInt("vehicle_out_id"));
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

    public VehicleInBean getVehicleIn(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(),created_date)=0,1,0) as can_edit from vehicle_in where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                VehicleInBean bean = new VehicleInBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setVehicleOutId(rs.getInt("vehicle_out_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getVehicleInDetail(int vehicleInId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, u.id as unit_id, u.name as unit_name, v.code as vendor_code, sv.id as shell_vendor_id"
                + " from vehicle_in_detail as det, shell_vendor as sv, vendor as v, shell as s, unit as u"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and sv.vendor_id=v.id and s.unit_id=u.id and det.vehicle_in_id=" + vehicleInId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleInDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleInDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleInId(rs.getInt("vehicle_in_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public ArrayList getVehicleInAccessoryDetail(int vehicleInId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as accessory_name, u.id as unit_id, u.name as unit_name"
                + " from vehicle_in_accessory_detail as det, accessory as s, unit as u"
                + " where det.accessory_id=s.id and s.unit_id=u.id and det.vehicle_in_id=" + vehicleInId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleInAccessoryDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleInAccessoryDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleInId(rs.getInt("vehicle_in_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setAccessoryId(rs.getInt("accessory_id"));
                bean.setAccessoryName(rs.getString("accessory_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertVehicleIn(VehicleInBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertVehicleIn(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateVehicleIn(VehicleInBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateVehicleIn(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_vehicle_out_id", bean.getVehicleOutId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextVehicleInNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "vehicle_in");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteVehicleIn(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteVehicleIn(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertVehicleInDetail(VehicleInDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleInDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_in_id", bean.getVehicleInId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateVehicleInDetail(VehicleInDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVehicleInDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteVehicleInDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_in_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int insertVehicleInAccessoryDetail(VehicleInAccessoryDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleInAccessoryDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_in_id", bean.getVehicleInId());
                spUtil.getCallableStatement().setInt("_accessory_id", bean.getAccessoryId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateVehicleInAccessoryDetail(VehicleInAccessoryDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVehicleInAccessoryDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteVehicleInAccessoryDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_in_accessory_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public int deleteVehicleInReturnShellDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_in_return_shell_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getVehicleInReturnShellDetail(int vehicleInId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from vehicle_in_return_shell_detail as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.vehicle_in_id=" + vehicleInId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleInReturnShellDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleInReturnShellDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleInId(rs.getInt("vehicle_in_id"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setQuantity(rs.getInt("quantity"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertVehicleInReturnShellDetail(VehicleInReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleInReturnShellDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_in_id", bean.getVehicleInId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateVehicleInReturnShellDetail(VehicleInReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateVehicleInReturnShellDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public ArrayList searchExportWholesale(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchExportWholesale(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    ExportWholesaleFormBean bean = null;
                    while (rs.next()) {
                        bean = new ExportWholesaleFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setCustomerId(rs.getInt("customer_id"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public ExportWholesaleBean getExportWholesale(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from gas_export_wholesale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                ExportWholesaleBean bean = new ExportWholesaleBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                return bean;
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

    public ArrayList getExportWholesaleDetail(int exportWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, u.id as unit_id, u.name as unit_name, v.code as vendor_code, sv.id as shell_vendor_id"
                + " from gas_export_wholesale_detail as det, shell_vendor as sv, vendor as v, shell as s, unit as u"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and sv.vendor_id=v.id and s.unit_id=u.id and det.gas_export_wholesale_id=" + exportWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ExportWholesaleDetailBean bean = null;
            while (rs.next()) {
                bean = new ExportWholesaleDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setExportWholesaleId(rs.getInt("gas_export_wholesale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name") + " - " + rs.getString("vendor_code"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertExportWholesale(ExportWholesaleBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertExportWholesale(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateExportWholesale(ExportWholesaleBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateExportWholesale(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextExportWholesaleNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "gas_export_wholesale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteExportWholesale(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteExportWholesale(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertExportWholesaleDetail(ExportWholesaleDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertExportWholesaleDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_export_wholesale_id", bean.getExportWholesaleId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateExportWholesaleDetail(ExportWholesaleDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateExportWholesaleDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteExportWholesaleDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_export_wholesale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getExportWholesaleReturnShellDetail(int exportWholesaleId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from gas_export_wholesale_shell_detail as det, shell as s, unit as u"
                + " where det.shell_id=s.id and s.unit_id=u.id and det.gas_export_wholesale_id=" + exportWholesaleId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            ExportWholesaleReturnShellDetailBean bean = null;
            while (rs.next()) {
                bean = new ExportWholesaleReturnShellDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setExportWholesaleId(rs.getInt("gas_export_wholesale_id"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                bean.setQuantity(rs.getInt("quantity"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertExportWholesaleReturnShellDetail(ExportWholesaleReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertExportWholesaleReturnShellDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_gas_export_wholesale_id", bean.getExportWholesaleId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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
        return result;
    }

    public void updateExportWholesaleReturnShellDetail(ExportWholesaleReturnShellDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateExportWholesaleReturnShellDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
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

    public int deleteExportWholesaleReturnShellDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From gas_export_wholesale_shell_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchLpgSale(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchLpgSale(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    LpgSaleFormBean bean = null;
                    while (rs.next()) {
                        bean = new LpgSaleFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCustomerName(rs.getString("customer_name"));
                        bean.setQuantity(rs.getInt("quantity"));
                        bean.setPrice(rs.getDouble("price"));
                        bean.setPriceTransport(rs.getDouble("price_transport"));
                        bean.setTotal(rs.getDouble("amount"));
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

    public LpgSaleBean getLpgSale(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(SYSDATE(), sale_date)=0,1,0) as can_edit from lpg_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                LpgSaleBean bean = new LpgSaleBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setKind(rs.getInt("kind"));
                bean.setCustomerId(rs.getInt("customer_id"));
                bean.setSaleDate(DateUtil.formatDate(rs.getDate("sale_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setPriceTransport(rs.getDouble("price_transport"));
                bean.setVat(rs.getDouble("vat"));
                bean.setRate(rs.getDouble("rate"));
                bean.setTotal(rs.getDouble("amount"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setRouteId(rs.getInt("route_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setCreatedEmployeeId(rs.getInt("created_employee_id"));
                return bean;
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

    public int insertLpgSale(LpgSaleBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getSaleDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getSaleDate();
            }
            String sql = "{call insertLpgSale(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setInt("_kind", bean.getKind());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_sale_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_price_transport", bean.getPriceTransport());
                spUtil.getCallableStatement().setDouble("_vat", bean.getVat());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_amount", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setInt("_route_id", bean.getRouteId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateLpgSale(LpgSaleBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getSaleDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getSaleDate();
            }
            String sql = "{call updateLpgSale(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_kind", bean.getKind());
                spUtil.getCallableStatement().setInt("_customer_id", bean.getCustomerId());
                spUtil.getCallableStatement().setString("_sale_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_price_transport", bean.getPriceTransport());
                spUtil.getCallableStatement().setDouble("_vat", bean.getVat());
                spUtil.getCallableStatement().setDouble("_rate", bean.getRate());
                spUtil.getCallableStatement().setDouble("_amount", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setInt("_route_id", bean.getRouteId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextLpgSaleNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "lpg_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteLpgSale(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteLpgSale(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public ArrayList searchLoVo(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchLoVo(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    LoVoFormBean bean = null;
                    while (rs.next()) {
                        bean = new LoVoFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setQuantity(rs.getInt("quantity"));
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

    public LoVoBean getLoVo(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(MONTH(created_date)=MONTH(SYSDATE()) AND YEAR(created_date)=YEAR(SYSDATE()),1,0) as can_edit from lo_vo where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                LoVoBean bean = new LoVoBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setNote(rs.getString("note"));
                return bean;
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

    public int insertLoVo(LoVoBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertLoVo(?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateLoVo(LoVoBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateLoVo(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public String getNextLoVoNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "lo_vo");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteLoVo(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteLoVo(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public ArrayList getLoVoEmployeeDetail(int loVoId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, e.fullname"
                + " from lo_vo_employee_detail as det, employee as e"
                + " where det.employee_id=e.id and det.lo_vo_id=" + loVoId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            LoVoEmployeeDetailBean bean = null;
            while (rs.next()) {
                bean = new LoVoEmployeeDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setLoVoId(rs.getInt("lo_vo_id"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setEmployeeName(rs.getString("fullname"));
                bean.setNote(rs.getString("note"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertLoVoEmployeeDetail(LoVoEmployeeDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertLoVoEmployeeDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_lo_vo_id", bean.getLoVoId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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
        return result;
    }

    public void updateLoVoEmployeeDetail(LoVoEmployeeDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateLoVoEmployeeDetail(?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
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

    public int deleteLoVoEmployeeDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From lo_vo_employee_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList searchSaleInner(String fromDate, String endDate, String organizationIds) throws Exception {
        SPUtil spUtil = null;
        ArrayList list = new ArrayList();
        ResultSet rs = null;
        try {
            String sql = "{call searchSaleInner(?,?,?)}";
            if (GenericValidator.isBlankOrNull(fromDate)) {
                fromDate = DateUtil.today("dd/MM/yyyy");
            }
            if (GenericValidator.isBlankOrNull(endDate)) {
                endDate = this.START_DATE;
            }
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_start_date", fromDate);
                spUtil.getCallableStatement().setString("_end_date", endDate);
                spUtil.getCallableStatement().setString("_organization_ids", organizationIds);
                rs = spUtil.executeQuery();
                if (rs != null) {
                    SaleInnerFormBean bean = null;
                    while (rs.next()) {
                        bean = new SaleInnerFormBean();
                        bean.setId(rs.getInt("id"));
                        bean.setCode(rs.getString("code"));
                        bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                        bean.setTotal(rs.getDouble("total"));
                        bean.setPaid(rs.getDouble("paid"));
                        bean.setDebt(rs.getDouble("debt"));
                        bean.setAccountId(rs.getInt("account_id"));
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

    public SaleInnerBean getSaleInner(int id) throws Exception {
        ResultSet rs = null;
        String sql = "select *, IF(DATEDIFF(created_date,SYSDATE())=0,1,0) as can_edit from inner_sale where id=" + id;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                SaleInnerBean bean = new SaleInnerBean();
                bean.setId(rs.getInt("id"));
                bean.setCode(rs.getString("code"));
                bean.setCreatedDate(DateUtil.formatDate(rs.getDate("created_date"), "dd/MM/yyyy"));
                bean.setTotal(rs.getDouble("total"));
                bean.setPaid(rs.getDouble("paid"));
                bean.setDebt(rs.getDouble("debt"));
                bean.setTotalPay(rs.getDouble("total_pay"));
                bean.setDiscount(rs.getDouble("discount"));
                bean.setAccountId(rs.getInt("account_id"));
                bean.setNote(rs.getString("note"));
                bean.setCanEdit(rs.getInt("can_edit"));
                bean.setEmployeeId(rs.getInt("employee_id"));
                return bean;
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

    public ArrayList getSaleInnerDetail(int saleInnerId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.name as shell_name, s.unit_id, u.name as unit_name"
                + " from inner_sale_detail as det, shell_vendor as sv, shell as s, unit as u"
                + " where det.shell_id=sv.id and sv.shell_id=s.id and s.unit_id=u.id and det.inner_sale_id=" + saleInnerId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            SaleInnerDetailBean bean = null;
            while (rs.next()) {
                bean = new SaleInnerDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setSaleInnerId(rs.getInt("inner_sale_id"));
                bean.setQuantity(rs.getInt("quantity"));
                bean.setPrice(rs.getDouble("price"));
                bean.setAmount(rs.getDouble("amount"));
                bean.setShellId(rs.getInt("shell_id"));
                bean.setShellName(rs.getString("shell_name"));
                bean.setUnitId(rs.getInt("unit_id"));
                bean.setUnitName(rs.getString("unit_name"));
                detailList.add(bean);
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
        return detailList;
    }

    public int insertSaleInner(SaleInnerBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call insertSaleInner(?,?,?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setString("_code", bean.getCode());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_created_employee_id", bean.getCreatedEmployeeId());
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

    public void updateSaleInner(SaleInnerBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String createdDate = "";
            if (GenericValidator.isBlankOrNull(bean.getCreatedDate())) {
                createdDate = "null";
            } else {
                createdDate = bean.getCreatedDate();
            }
            String sql = "{call updateSaleInner(?,?,?,?,?,?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setString("_created_date", createdDate);
                spUtil.getCallableStatement().setDouble("_total", bean.getTotal());
                spUtil.getCallableStatement().setDouble("_paid", bean.getPaid());
                spUtil.getCallableStatement().setDouble("_debt", bean.getDebt());
                spUtil.getCallableStatement().setDouble("_discount", bean.getDiscount());
                spUtil.getCallableStatement().setDouble("_total_pay", bean.getTotalPay());
                spUtil.getCallableStatement().setInt("_account_id", bean.getAccountId());
                spUtil.getCallableStatement().setString("_note", bean.getNote());
                spUtil.getCallableStatement().setInt("_employee_id", bean.getEmployeeId());
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

    public String getNextSaleInnerNumber(String prefix, int length) throws Exception {
        String result = "";
        try {
            result = this.getNextNumber(prefix, length, "code", "inner_sale");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public void deleteSaleInner(int id) throws Exception {
        SPUtil spUtil = null;
        try {
            String sql = "{call deleteSaleInner(?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", id);
                spUtil.execute();
            }
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

    public int insertSaleInnerDetail(SaleInnerDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertSaleInnerDetail(?,?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_inner_sale_id", bean.getSaleInnerId());
                spUtil.getCallableStatement().setInt("_shell_id", bean.getShellId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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
        return result;
    }

    public void updateSaleInnerDetail(SaleInnerDetailBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        SPUtil spUtil = null;
        try {
            String sql = "{call updateSaleInnerDetail(?,?,?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_id", bean.getId());
                spUtil.getCallableStatement().setInt("_quantity", bean.getQuantity());
                spUtil.getCallableStatement().setDouble("_price", bean.getPrice());
                spUtil.getCallableStatement().setDouble("_amount", bean.getAmount());
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

    public int deleteSaleInnerDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From inner_sale_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

    public ArrayList getGasWholeSaleFees(int status) throws Exception {
        ResultSet rs = null;
        String sql = "select * from gas_wholesale_fee where 1";
        if (status != 0) {
            sql += " and status=" + status;
        }
        sql += " order by name";
        ArrayList unitList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            GasWholeSaleFeeFormBean bean = null;
            while (rs.next()) {
                bean = new GasWholeSaleFeeFormBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setKind(rs.getInt("kind"));
                if (bean.getKind() == GasWholeSaleFeeBean.KIND_INCREASE) {
                    bean.setKindName(QTUtil.getBundleString("gasWholeSale.fee.detail.kind.increase.title"));
                } else if (bean.getKind() == GasWholeSaleFeeBean.KIND_DECREASE) {
                    bean.setKindName(QTUtil.getBundleString("gasWholeSale.fee.detail.kind.decrease.title"));
                }
                bean.setStatus(rs.getInt("status"));
                if (bean.getStatus() == EmployeeBean.STATUS_ACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.active"));
                } else if (bean.getStatus() == EmployeeBean.STATUS_INACTIVE) {
                    bean.setStatusName(QTUtil.getBundleString("employee.detail.status.inactive"));
                }
                unitList.add(bean);
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
        return unitList;
    }

    public GasWholeSaleFeeBean getGasWholeSaleFee(int feeId) throws Exception {
        ResultSet rs = null;
        String sql = "select * from gas_wholesale_fee where id=" + feeId;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasWholeSaleFeeBean bean = new GasWholeSaleFeeBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setStatus(rs.getInt("status"));
                bean.setKind(rs.getInt("kind"));
                return bean;
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

    public GasWholeSaleFeeBean getGasWholeSaleFeeByName(String name) throws Exception {
        ResultSet rs = null;
        String sql = "select * from gas_wholesale_fee where name='" + name + "' and status=" + EmployeeBean.STATUS_ACTIVE;
        try {
            rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                GasWholeSaleFeeBean bean = new GasWholeSaleFeeBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setStatus(rs.getInt("status"));
                bean.setKind(rs.getInt("kind"));
                return bean;
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

    public void insertGasWholeSaleFee(GasWholeSaleFeeBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Insert Into gas_wholesale_fee(name, kind, status) Values ('" + bean.getName() + "'," + bean.getKind() + "," + bean.getStatus() + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }

        }
    }

    public void updateGasWholeSaleFee(GasWholeSaleFeeBean bean) throws Exception {
        if (bean == null) {
            return;
        }
        try {
            String sql = "Update gas_wholesale_fee Set "
                    + " name='" + bean.getName() + "'"
                    + ", kind=" + bean.getKind()
                    + ", status=" + bean.getStatus()
                    + " Where id=" + bean.getId();
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        } finally {
            try {
            } catch (Exception e) {
                throw new Exception(e.getMessage());
            }
        }
    }

    public ArrayList getVehicleInOilExportDetail(int vehicleInId) throws Exception {
        ResultSet rs = null;
        String sql = "select det.*, s.code as oil_export_code, c.name as customer_name, s.created_date as oil_export_created_date, s.total as oil_export_total"
                + " from vehicle_in_oil_export_detail as det, oil_export as s, customer as c"
                + " where det.oil_export_id=s.id and s.customer_id=c.id and det.vehicle_in_id=" + vehicleInId
                + " order by det.id";
        ArrayList detailList = new ArrayList();
        try {
            rs = DBUtil.executeQuery(sql);
            VehicleInOilExportDetailBean bean = null;
            while (rs.next()) {
                bean = new VehicleInOilExportDetailBean();
                bean.setId(rs.getInt("id"));
                bean.setVehicleInId(rs.getInt("vehicle_in_id"));
                bean.setOilExportId(rs.getInt("oil_export_id"));
                bean.setCode(rs.getString("oil_export_code"));
                bean.setCustomerName(rs.getString("customer_name"));
                bean.setCreatedDate(rs.getString("oil_export_created_date"));
                bean.setTotal(rs.getDouble("oil_export_total"));
                bean.setTotalText(NumberUtil.formatMoneyDefault(bean.getTotal(), "VND"));
                detailList.add(bean);
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
        return detailList;
    }

    
    public int insertVehicleInOilExportDetail(VehicleInOilExportDetailBean bean) throws Exception {
        if (bean == null) {
            return 0;
        }
        int result = 0;
        SPUtil spUtil = null;
        try {
            String sql = "{call insertVehicleInOilExportDetail(?,?)}";
            spUtil = new SPUtil(sql);
            if (spUtil != null) {
                spUtil.getCallableStatement().setInt("_vehicle_in_id", bean.getVehicleInId());
                spUtil.getCallableStatement().setInt("_oil_export_id", bean.getOilExportId());
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
        return result;
    }
    
    public int deleteVehicleInOilExportDetails(String ids) throws Exception {
        int result = 0;
        try {
            String sql = "Delete From vehicle_in_oil_export_detail Where id in (" + ids + ")";
            DBUtil.executeUpdate(sql);
        } catch (SQLException sqle) {
            throw new Exception(sqle.getMessage());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        return result;
    }

}
