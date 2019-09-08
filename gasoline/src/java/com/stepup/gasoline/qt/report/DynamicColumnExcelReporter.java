/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

import com.stepup.core.util.GenericValidator;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.accessorykind.AccessoryKindFormBean;
import com.stepup.gasoline.qt.bean.DayoffBean;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.employee.EmployeeFormBean;
import com.stepup.gasoline.qt.employeeoilcommission.EmployeeOilCommissionFormBean;
import com.stepup.gasoline.qt.oil.OilFormBean;
import com.stepup.gasoline.qt.petro.PetroFormBean;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/**
 *
 * @author Administrator
 */
public class DynamicColumnExcelReporter {

    private static HSSFCell copyCell(HSSFWorkbook wb, HSSFSheet sheet, int rowNum, int col, int newCol, String name, String content) {
        HSSFRow row = sheet.getRow(rowNum);
        HSSFCell cell = row.getCell(col);
        HSSFCell newCell = row.createCell(newCol);
        ExcelExport.copyStyle(wb, cell, newCell);
        if (GenericValidator.isBlankOrNull(content)) {
            newCell.setCellValue(cell.getRichStringCellValue());
        } else {
            newCell.setCellValue(new HSSFRichTextString(copyCellValue(cell.getRichStringCellValue().getString(), name, content)));
        }
        return newCell;
    }

    private static String copyCellValue(String value, String name, String content) {
        String result = "";
        int ind = value.indexOf("${");
        if (ind == 0) {
            ind = value.indexOf(".");
            if (ind > -1) {
                if (GenericValidator.isBlankOrNull(name)) {
                    result = "${dynamicdata" + content + value.substring(ind);
                } else {
                    result = "${" + name + content + value.substring(ind);
                }
            }
        }
        return result;
    }

    private static HSSFCell copyCell(HSSFWorkbook wb, HSSFSheet sheet, int rowNum, int col, int newCol, String code, String name, String content) {
        HSSFRow row = sheet.getRow(rowNum);
        HSSFCell cell = row.getCell(col);
        HSSFCell newCell = row.createCell(newCol);
        ExcelExport.copyStyle(wb, cell, newCell);
        if (GenericValidator.isBlankOrNull(content)) {
            newCell.setCellValue(cell.getRichStringCellValue());
        } else {
            newCell.setCellValue(new HSSFRichTextString(copyCellValue(cell.getRichStringCellValue().getString(), code, name, content)));
        }
        return newCell;
    }

    private static String copyCellValue(String value, String code, String name, String content) {
        String result = "";
        int ind = value.indexOf("${");
        if (ind == 0) {
            ind = value.indexOf(".");
            if (ind > -1) {
                if (GenericValidator.isBlankOrNull(name)) {
                    result = "${" + code + content + value.substring(ind);
                } else {
                    result = "${" + name + content + value.substring(ind);
                }
            }
        }
        return result;
    }

    public static void createPetroStockReportColumns(String templateFileName, ArrayList arrPetro, File f) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;
        PetroFormBean petro = null;
        short col = 5, row = 3;
        short border = sheet.getRow(4).getCell(1).getCellStyle().getBorderLeft();
        short color = sheet.getRow(4).getCell(1).getCellStyle().getLeftBorderColor();
        for (int i = 0; i < arrPetro.size(); i++) {
            petro = (PetroFormBean) arrPetro.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row + 1, 2, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(petro.getName()));
            ExcelExport.setBorder(wb, sheet, row + 1, col + 1, border, color);
            ExcelExport.setBorder(wb, sheet, row + 1, col + 2, border, color);

            //copy header nhap
            newCell = copyCell(wb, sheet, row + 2, 2, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header xuat
            newCell = copyCell(wb, sheet, row + 2, 3, col + 1, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header ton
            newCell = copyCell(wb, sheet, row + 2, 4, col + 2, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));

            //copy header2 nhap
            copyCell(wb, sheet, row + 3, 2, col, "", "");
            //copy header2 xuat
            copyCell(wb, sheet, row + 3, 3, col + 1, "", "");
            //copy header2 ton
            newCell = copyCell(wb, sheet, row + 3, 4, col + 2, "", "");
            newCell.setCellValue(new HSSFRichTextString("${" + newCell.getRichStringCellValue().getString() + petro.getId() + "}"));

            //copy content nhap
            copyCell(wb, sheet, row + 4, 2, col, "", petro.getId() + "");
            //copy content xuat
            copyCell(wb, sheet, row + 4, 3, col + 1, "", petro.getId() + "");
            //copy content ton
            copyCell(wb, sheet, row + 4, 4, col + 2, "", petro.getId() + "");

            //copy footer nhap
            newCell = copyCell(wb, sheet, row + 5, 2, col, "", petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "8)]"));
            //copy footer xuat
            newCell = copyCell(wb, sheet, row + 5, 3, col + 1, "", petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 1) + "8)]"));
            //copy footer ton
            newCell = copyCell(wb, sheet, row + 5, 4, col + 2, "", petro.getId() + "");
//            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 2) + "8)]"));
            newCell.setCellValue(new HSSFRichTextString("${closingStock" + petro.getId() + "}"));

            sheet.setColumnWidth(col, sheet.getColumnWidth(2));
            sheet.setColumnWidth((col + 1), sheet.getColumnWidth(3));
            sheet.setColumnWidth((col + 2), sheet.getColumnWidth(4));
            sheet.addMergedRegion(new CellRangeAddress(row + 1, row + 1, col, col + 2));
            col += 3;
        }
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2 + 3 - 1 + arrPetro.size() * 3));
        sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 2 + 3 - 1 + arrPetro.size() * 3));
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    public static void createGasCommissionReportColumns(String templateFileName, ArrayList arrEmployee, ArrayList arrAccessory, ArrayList arrEmployeeOilCommission, File f) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;

        // accessory
        AccessoryKindFormBean accessoryKind = null;
        short col = 8, row = 4;
        for (int i = 0; i < arrAccessory.size(); i++) {
            accessoryKind = (AccessoryKindFormBean) arrAccessory.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row, 5, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(accessoryKind.getName()));

            //copy sub header
            newCell = copyCell(wb, sheet, row + 1, 5, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(NumberUtil.formatMoneyDefault(accessoryKind.getCommission(), "VND")));

            //copy content
            copyCell(wb, sheet, row + 2, 5, col, "accessorydata", accessoryKind.getId() + "");

            sheet.setColumnWidth(col, sheet.getColumnWidth(5));
            col += 1;
        }
        
        // oil
        EmployeeOilCommissionFormBean employeeOilCommission = null;
        for (int i = 0; i < arrEmployeeOilCommission.size(); i++) {
            employeeOilCommission = (EmployeeOilCommissionFormBean) arrEmployeeOilCommission.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row, 6, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(employeeOilCommission.getName()));

            //copy sub header
            newCell = copyCell(wb, sheet, row + 1, 6, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(NumberUtil.formatMoneyDefault(employeeOilCommission.getAmount(), "VND")));

            //copy content
            copyCell(wb, sheet, row + 2, 6, col, "employeeoilcommissiondata", employeeOilCommission.getId() + "");

            sheet.setColumnWidth(col, sheet.getColumnWidth(6));
            col += 1;
        }

        EmployeeFormBean employee = null;
        for (int i = 0; i < arrEmployee.size(); i++) {
            employee = (EmployeeFormBean) arrEmployee.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row, 7, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(employee.getFullname()));

            //copy header
            newCell = copyCell(wb, sheet, row + 1, 7, col, "", employee.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "7)]"));

            //copy content nhap
            copyCell(wb, sheet, row + 2, 7, col, "", employee.getId() + "");

            sheet.setColumnWidth(col, sheet.getColumnWidth(7));
            col += 1;
        }
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    public static void createColumnForShellReport(String templateFileName, ArrayList arrDate, File f, int rowSize) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        //Sheet xuat nhap ban hang
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;
        short col = 5;
        for (int i = 0; i < arrDate.size(); i++) {
            String date = (String) arrDate.get(i);
            //copy ton cuoi (stock) header
            newCell = copyCell(wb, sheet, 0, 3, col, "", "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "3)]"));
//
            //copy ngay (date) header
            newCell = copyCell(wb, sheet, 1, 3, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(date));

            //copy content
            copyCell(wb, sheet, 2, 3, col, "", date.replace("/", ""));

            sheet.setColumnWidth(col, sheet.getColumnWidth(3));

            col += 1;
        }

        //Sheet xuat nhap mua ban
        sheet = wb.getSheetAt(1);
        newCell = null;
        col = 4;
        for (int i = 0; i < arrDate.size(); i++) {
            String date = (String) arrDate.get(i);
            //copy ton cuoi (stock) header
            newCell = copyCell(wb, sheet, 0, 3, col, "", "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "3)]"));
//
            //copy ngay (date) header
            newCell = copyCell(wb, sheet, 1, 3, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(date));

            //copy content
            copyCell(wb, sheet, 2, 3, col, "dulieudong", "", date.replace("/", ""));

            sheet.setColumnWidth(col, sheet.getColumnWidth(3));

            col += 1;
        }
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    public static void createColumnForEmployeeOffReport(String templateFileName, ArrayList arrDayoff, File f) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        //Sheet xuat nhap ban hang
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;
        short col = 20;
        for (int i = 0; i < arrDayoff.size(); i++) {
            DayoffBean bean = (DayoffBean) arrDayoff.get(i);

            //copy ten ngay nghi header
            newCell = copyCell(wb, sheet, 5, 19, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(bean.getName()));

            //copy content
            copyCell(wb, sheet, 6, 19, col, "", bean.getId() + "");

            sheet.setColumnWidth(col, sheet.getColumnWidth(19));

            col += 1;
        }
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    public static void createOilStockReportColumns(String templateFileName, ArrayList arrOil, File f) throws Exception {
        POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(templateFileName));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        HSSFCell newCell = null;
        OilFormBean oil = null;
        short col = 5, row = 3;
        short border = sheet.getRow(4).getCell(1).getCellStyle().getBorderLeft();
        short color = sheet.getRow(4).getCell(1).getCellStyle().getLeftBorderColor();
        for (int i = 0; i < arrOil.size(); i++) {
            oil = (OilFormBean) arrOil.get(i);
            //copy header
            newCell = copyCell(wb, sheet, row + 1, 2, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(oil.getName()));
            ExcelExport.setBorder(wb, sheet, row + 1, col + 1, border, color);
            ExcelExport.setBorder(wb, sheet, row + 1, col + 2, border, color);

            //copy header nhap
            newCell = copyCell(wb, sheet, row + 2, 2, col, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header xuat
            newCell = copyCell(wb, sheet, row + 2, 3, col + 1, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header ton
            newCell = copyCell(wb, sheet, row + 2, 4, col + 2, "", "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));

            //copy header2 nhap
            copyCell(wb, sheet, row + 3, 2, col, "", "");
            //copy header2 xuat
            copyCell(wb, sheet, row + 3, 3, col + 1, "", "");
            //copy header2 ton
            newCell = copyCell(wb, sheet, row + 3, 4, col + 2, "", "");
            newCell.setCellValue(new HSSFRichTextString("${" + newCell.getRichStringCellValue().getString() + oil.getId() + "}"));

            //copy content nhap
            copyCell(wb, sheet, row + 4, 2, col, "", oil.getId() + "");
            //copy content xuat
            copyCell(wb, sheet, row + 4, 3, col + 1, "", oil.getId() + "");
            //copy content ton
            copyCell(wb, sheet, row + 4, 4, col + 2, "", oil.getId() + "");

            //copy footer nhap
            newCell = copyCell(wb, sheet, row + 5, 2, col, "", oil.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "8)]"));
            //copy footer xuat
            newCell = copyCell(wb, sheet, row + 5, 3, col + 1, "", oil.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 1) + "8)]"));
            //copy footer ton
            newCell = copyCell(wb, sheet, row + 5, 4, col + 2, "", oil.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 2) + "8)]"));

            sheet.setColumnWidth(col, sheet.getColumnWidth(2));
            sheet.setColumnWidth((col + 1), sheet.getColumnWidth(3));
            sheet.setColumnWidth((col + 2), sheet.getColumnWidth(4));
            sheet.addMergedRegion(new CellRangeAddress(row + 1, row + 1, col, col + 2));
            col += 3;
        }
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2 + 3 - 1 + arrOil.size() * 3));
        sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 2 + 3 - 1 + arrOil.size() * 3));
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }
}
