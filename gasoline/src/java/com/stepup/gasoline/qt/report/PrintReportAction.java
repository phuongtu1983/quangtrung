/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.petro.PetroFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
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
                    list = printCashBookReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportpetroimport")) {
                    templateFileName = "bang_theo_doi_nhap_hang_petro";
                    list = printPetroImportReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportpetrosale")) {
                    templateFileName = "hang_xuat_petro";
                    list = printPetroSaleReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportpetrostock")) {
                    templateFileName = "so_theo_doi_nxt_tong_hop_petro";
                    list = printPetroStockReport(fromDate, toDate, organizationIds, request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls"));
                }
                templateFileName = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
                beans.put("qtrp_fromDate", fromDate);
                beans.put("qtrp_toDate", toDate);
                if (list == null) {
                    list = new ArrayList();
                }
                beans.put("dulieu", list);
                exporter.setBeans(beans);
                exporter.export(request, response, templateFileName, "report_" + reportName + ".xls");
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

    private ArrayList printCashBookReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCashBookReport(fromDate, toDate, organizationIds);
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

    private ArrayList printPetroStockReport(String fromDate, String toDate, String organizationIds, String fileName) {
        ArrayList list = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList petros = goodDAO.getPetros(EmployeeBean.STATUS_ACTIVE, organizationIds);

            File f = FileUtil.createFile(fileName);
            ArrayList arrHideCol = new ArrayList();
            arrHideCol.add(2);
            arrHideCol.add(3);
            arrHideCol.add(4);
            Map beans = new HashMap();
            createColumn(fileName, petros, 31, f, arrHideCol, beans);

            PetroFormBean petro = null;
            ReportDAO reportDAO = new ReportDAO();
            for (int i = 0; i < petros.size(); i++) {
                petro = (PetroFormBean) petros.get(i);
                try {
                    list = reportDAO.getPetroStockReport(fromDate, toDate, organizationIds);
                } catch (Exception ex) {
                }
                if (list == null) {
                    list = new ArrayList();
                }
                if (i == 0) {//lan dau do du lieu
                    beans.put("material", list);
                }
                beans.put("petro" + petro.getId(), list);
            }
        } catch (Exception ex) {
        }
        return list;
    }

    private void createColumn(String templateFileName, ArrayList arrPetro, int rowSize, File f, ArrayList arrHideCol, Map beans) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;
        PetroFormBean petro = null;
        short col = 5, row = 3;
        short border = sheet.getRow(1).getCell(1).getCellStyle().getBorderLeft();
        short color = sheet.getRow(1).getCell(1).getCellStyle().getLeftBorderColor();
        for (int i = 0; i < arrPetro.size(); i++) {
            petro = (PetroFormBean) arrPetro.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row + 1, 2, col, "");
            newCell.setCellValue(new HSSFRichTextString(petro.getName()));
            ExcelExport.setBorder(wb, sheet, row + 1, col + 1, border, color);
            ExcelExport.setBorder(wb, sheet, row + 1, col + 2, border, color);

            //copy header nhap
            newCell = copyCell(wb, sheet, row + 2, 2, col, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
//            if (vendor.getCurrency().contains("VN")) {
//                arrHideCol.add(col);
//            }
            //copy header xuat
            newCell = copyCell(wb, sheet, row + 2, 3, col + 1, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
//            if (!GenericValidator.isBlankOrNull(vendor.getCurrency())) {
//                if (!vendor.getCurrency().contains("VN") && vendor.getRates() == 1) {
//                    arrHideCol.add(col + 1);
//                }
//            }
            //copy header ton
            newCell = copyCell(wb, sheet, row + 2, 4, col + 2, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));

            ExcelExport.setBorder(wb, sheet, row + 3, col, border, color);
            ExcelExport.setBorder(wb, sheet, row + 3, col + 1, border, color);
            ExcelExport.setBorder(wb, sheet, row + 3, col + 2, border, color);

            //copy content nhap
            copyCell(wb, sheet, row + 4, 2, col, petro.getId() + "");
            //copy content xuat
            copyCell(wb, sheet, row + 4, 3, col + 1, petro.getId() + "");
            //copy content ton
            copyCell(wb, sheet, row + 4, 4, col + 2, petro.getId() + "");

            //copy footer nhap
            newCell = copyCell(wb, sheet, row + 5, 2, col, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + (col) + "8)]"));
            //copy footer xuat
            newCell = copyCell(wb, sheet, row + 5, 3, col + 1, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + (col + 1) + "8)]"));
            //copy footer ton
            newCell = copyCell(wb, sheet, row + 5, 4, col + 2, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + (col + 2) + "8)]"));

            sheet.setColumnWidth(col, sheet.getColumnWidth(2));
            sheet.setColumnWidth((col + 1), sheet.getColumnWidth(3));
            sheet.setColumnWidth((col + 2), sheet.getColumnWidth(4));
            sheet.addMergedRegion(new CellRangeAddress(row + 1, row + 1, col, col + 2));
            col += 3;
        }
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3 + arrPetro.size() * 3 + 3 * 2));
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    private HSSFCell copyCell(HSSFWorkbook wb, HSSFSheet sheet, int rowNum, int col, int newCol, String content) {
        HSSFRow row = sheet.getRow(rowNum);
        HSSFCell cell = row.getCell(col);
        HSSFCell newCell = row.createCell(newCol);
        ExcelExport.copyStyle(wb, cell, newCell);
        if (GenericValidator.isBlankOrNull(content)) {
            newCell.setCellValue(cell.getRichStringCellValue());
        } else {
            newCell.setCellValue(new HSSFRichTextString(copyCellValue(cell.getRichStringCellValue().getString(), content)));
        }
        return newCell;
    }

    private String copyCellValue(String value, String content) {
        String result = "";
        int ind = value.indexOf("${");
        if (ind == 0) {
            ind = value.indexOf(".");
            if (ind > -1) {
                result = "${petro" + content + value.substring(ind);
            }
        }
        return result;
    }
}
