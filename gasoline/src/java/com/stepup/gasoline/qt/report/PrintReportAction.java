/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.accessorykind.AccessoryKindFormBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.petro.PetroFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class PrintReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            String reportName = request.getParameter("reportName");
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            String templateFileName = "";
            if (!StringUtil.isBlankOrNull(reportName)) {
                Map beans = new HashMap();
                ExcelExport exporter = new ExcelExport();
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");
                beans.put("qtrp_fromDate", fromDate);
                beans.put("qtrp_toDate", toDate);
                ArrayList list = null;
                if (reportName.equals("reportlpgimport")) {
                    templateFileName = "bang_theo_doi_nhap_hang_lpg";
                    list = printLpgImportReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportlpgstock")) {
                    templateFileName = "so_theo_doi_san_luong_khi_hoa_long_lpg";
                    LpgStockReportOutBean outBean = new LpgStockReportOutBean();
                    list = printLpgStockReport(fromDate, toDate, organizationIds, outBean);
                    beans.put("qtrp_gasStock", outBean.getGasStock());
                } else if (reportName.equals("reportlpgstocksum")) {
                    templateFileName = "so_theo_doi_nhap_xuat_khi_hoa_long_lpg";
                    LpgStockSumReportOutBean outBean = new LpgStockSumReportOutBean();
                    list = printLpgStockSumReport(fromDate, toDate, organizationIds, outBean);
                    beans.put("qtrp_gasStock", outBean.getGasStock());
                    beans.put("qtrp_shieldStock", outBean.getShieldStock());
                } else if (reportName.equals("reportsum")) {
                    templateFileName = "tong_hop";
                    list = printSumReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportsale")) {
                    templateFileName = "xuat_ban_hang";
                    list = printSaleReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportsalecustomer")) {
                    templateFileName = "chi_tiet_ban_hang_theo_khach_hang";
                    list = printSaleCustomerReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportcashbook")) {
                    templateFileName = "bao_cao_quy_tien";
                    CashBookReportOutBean outBean = new CashBookReportOutBean();
                    list = printCashBookReport(fromDate, toDate, organizationIds, outBean);
                    beans.put("qtrp_accountOpeningStock", outBean.getAccountOpeningStock());
                    beans.put("qtrp_cashOpeningStock", outBean.getCashOpeningStock());
                } else if (reportName.equals("reportpetroimport")) {
                    templateFileName = "bang_theo_doi_nhap_hang_petro";
                    list = printPetroImportReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportpetrosale")) {
                    templateFileName = "hang_xuat_petro";
                    list = printPetroSaleReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportpetrostock")) {
                    templateFileName = "so_theo_doi_nxt_tong_hop_petro";
                    String session = QTUtil.getEmployeeId(request.getSession()) + "_" + Calendar.getInstance().getTimeInMillis();
                    printPetroStockReport(fromDate, toDate, organizationIds, request, response, templateFileName, session, beans, exporter);
                } else if (reportName.equals("reportgascommission")) {
                    templateFileName = "commission_gas";
                    String session = QTUtil.getEmployeeId(request.getSession()) + "_" + Calendar.getInstance().getTimeInMillis();
                    printGasCommissionReport(fromDate, toDate, organizationIds, request, response, templateFileName, session, beans, exporter);
                } else if (reportName.equals("reportgasemployeecommission")) {
                    templateFileName = "employee_commission_gas";
                    String session = QTUtil.getEmployeeId(request.getSession()) + "_" + Calendar.getInstance().getTimeInMillis();
                    list = printGasEmployeeComissionReport(fromDate, toDate, organizationIds, session);
                } else if (reportName.equals("reportvendordebt")) {
                    templateFileName = "bang_theo_doi_cong_no_ncc";
                    list = printVendorDebtReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reporttransportfee")) {
                    templateFileName = "bang_theo_doi_chi_phi_van_chuyen";
                    list = printTransportFeeReport(fromDate, toDate, organizationIds);
                }

                if (!reportName.equals("reportpetrostock") && !reportName.equals("reportgascommission")) {
                    String sourceFile = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
                    if (list == null) {
                        list = new ArrayList();
                    }
                    beans.put("dulieu", list);
                    exporter.setBeans(beans);
                    exporter.export(request, response, sourceFile, templateFileName + ".xls");
                }
            }
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printLpgImportReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgImportReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printLpgStockReport(String fromDate, String toDate, String organizationIds, LpgStockReportOutBean outBean) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgStockReport(fromDate, toDate, organizationIds, vendorIds, outBean);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printLpgStockSumReport(String fromDate, String toDate, String organizationIds, LpgStockSumReportOutBean outBean) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgStockSumReport(fromDate, toDate, organizationIds, vendorIds, outBean);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printSumReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getSumReport(fromDate, toDate, organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printSaleReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            VendorFormBean vendor = vendorDAO.getVendorEqualOrganization(organizationIds);
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getSaleReport(fromDate, toDate, organizationIds, "," + vendor.getId() + ",");
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printSaleCustomerReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getSaleCustomerReport(fromDate, toDate, organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printCashBookReport(String fromDate, String toDate, String organizationIds, CashBookReportOutBean outBean) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCashBookReport(fromDate, toDate, organizationIds, outBean);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printPetroImportReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getPetroImportReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printPetroSaleReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getPetroSaleReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printPetroStockReport(String fromDate, String toDate, String organizationIds, HttpServletRequest request, HttpServletResponse response,
            String fileName, String sessionId, Map beans, ExcelExport exporter) {
        ArrayList list = null;
        try {
            String tempFileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + "_temp.xls");
            fileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + ".xls");
            GoodDAO goodDAO = new GoodDAO();
            ReportDAO reportDAO = new ReportDAO();

            FileUtil.copyFile(fileName, tempFileName);
            File f = new File(tempFileName);
            ArrayList arrHideCol = new ArrayList();
            arrHideCol.add(2);
            arrHideCol.add(3);
            arrHideCol.add(4);

            PetroStockReportOutBean outBean = new PetroStockReportOutBean();
            list = reportDAO.getPetroStockReport(fromDate, toDate, organizationIds, 0, sessionId, outBean);

            ArrayList petros = goodDAO.getPetros(outBean.getPetroIds());

            beans.put("datedata", list);
            DynamicColumnExcelReporter.createPetroStockReportColumns(tempFileName, petros, f);

            PetroFormBean petro = null;

            for (int i = 0; i < petros.size(); i++) {
                petro = (PetroFormBean) petros.get(i);
                try {
                    list = reportDAO.getPetroStockReport(fromDate, toDate, organizationIds, petro.getId(), sessionId, outBean);
                } catch (Exception ex) {
                }
                beans.put("dynamicdata" + petro.getId(), list);
                beans.put("openingStock" + petro.getId(), outBean.getOpeningStock());
            }
            reportDAO.clearPetroStockReport(sessionId);

            short[] hiddenCols = new short[arrHideCol.size()];
            for (int i = 0; i < arrHideCol.size(); i++) {
                hiddenCols[i] = Short.parseShort(arrHideCol.get(i) + "");
            }
            exporter.setHiddenCols(hiddenCols);
            exporter.setBeans(beans);
            exporter.export(request, response, tempFileName, "petro_stock_report.xls");
            f.delete();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    private ArrayList printGasCommissionReport(String fromDate, String toDate, String organizationIds, HttpServletRequest request, HttpServletResponse response,
            String fileName, String sessionId, Map beans, ExcelExport exporter) {
        ArrayList list = null;
        try {
            String tempFileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + "_temp.xls");
            fileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + ".xls");

            ReportDAO reportDAO = new ReportDAO();

            FileUtil.copyFile(fileName, tempFileName);
            File f = new File(tempFileName);
            ArrayList arrHideCol = new ArrayList();
            arrHideCol.add(5);
            arrHideCol.add(6);

            GasCommissionReportOutBean outBean = new GasCommissionReportOutBean();
            list = reportDAO.getGasCommissionReport(fromDate, toDate, organizationIds, 0, 0, sessionId, outBean);

            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList employees = employeeDAO.getEmployees(outBean.getEmployeeIds());

            GoodDAO goodDAO = new GoodDAO();
            ArrayList accessoryKinds = goodDAO.getAccessoryKinds(outBean.getAccessoryKindIds());

            beans.put("datedata", list);
            beans.put("qtrp_commission12", outBean.getCommission12());
            beans.put("qtrp_commission45", outBean.getCommission45());
            beans.put("qtrp_commission_lovo", outBean.getCommissionLoVo());

            DynamicColumnExcelReporter.createGasCommissionReportColumns(tempFileName, employees, accessoryKinds, f);

            AccessoryKindFormBean accessoryKind = null;
            for (int i = 0; i < accessoryKinds.size(); i++) {
                accessoryKind = (AccessoryKindFormBean) accessoryKinds.get(i);
                try {
                    list = reportDAO.getGasCommissionReport(fromDate, toDate, organizationIds, 1, accessoryKind.getId(), sessionId, null);
                } catch (Exception ex) {
                }
                beans.put("accessorydata" + accessoryKind.getId(), list);
            }

            EmployeeFormBean employee = null;
            for (int i = 0; i < employees.size(); i++) {
                employee = (EmployeeFormBean) employees.get(i);
                try {
                    list = reportDAO.getGasCommissionReport(fromDate, toDate, organizationIds, employee.getId(), 0, sessionId, null);
                } catch (Exception ex) {
                }
                beans.put("dynamicdata" + employee.getId(), list);
            }
            reportDAO.clearGasCommissionReport(sessionId);

            short[] hiddenCols = new short[arrHideCol.size()];
            for (int i = 0; i < arrHideCol.size(); i++) {
                hiddenCols[i] = Short.parseShort(arrHideCol.get(i) + "");
            }
            exporter.setHiddenCols(hiddenCols);
            exporter.setBeans(beans);
            exporter.export(request, response, tempFileName, "gas_commission_report.xls");
            f.delete();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return list;
    }

    private ArrayList printGasEmployeeComissionReport(String fromDate, String toDate, String organizationIds, String sessionId) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getGasEmployeeCommissionReport(fromDate, toDate, organizationIds, sessionId);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printVendorDebtReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getVendorDebtReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printTransportFeeReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getTransportFeeReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

}
