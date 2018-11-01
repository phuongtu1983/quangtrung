/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

import com.stepup.core.util.GenericValidator;
import com.stepup.gasoline.qt.core.ExcelExport;
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
            newCell = copyCell(wb, sheet, row + 1, 2, col, "");
            newCell.setCellValue(new HSSFRichTextString(petro.getName()));
            ExcelExport.setBorder(wb, sheet, row + 1, col + 1, border, color);
            ExcelExport.setBorder(wb, sheet, row + 1, col + 2, border, color);

            //copy header nhap
            newCell = copyCell(wb, sheet, row + 2, 2, col, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header xuat
            newCell = copyCell(wb, sheet, row + 2, 3, col + 1, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));
            //copy header ton
            newCell = copyCell(wb, sheet, row + 2, 4, col + 2, "");
            newCell.setCellValue(new HSSFRichTextString(newCell.getRichStringCellValue().getString()));

            //copy header2 nhap
            copyCell(wb, sheet, row + 3, 2, col, "");
            //copy header2 xuat
            copyCell(wb, sheet, row + 3, 3, col + 1, "");
            //copy header2 ton
            newCell = copyCell(wb, sheet, row + 3, 4, col + 2, "");
            newCell.setCellValue(new HSSFRichTextString("${" + newCell.getRichStringCellValue().getString() + petro.getId() + "}"));

            //copy content nhap
            copyCell(wb, sheet, row + 4, 2, col, petro.getId() + "");
            //copy content xuat
            copyCell(wb, sheet, row + 4, 3, col + 1, petro.getId() + "");
            //copy content ton
            copyCell(wb, sheet, row + 4, 4, col + 2, petro.getId() + "");

            //copy footer nhap
            newCell = copyCell(wb, sheet, row + 5, 2, col, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col) + "8)]"));
            //copy footer xuat
            newCell = copyCell(wb, sheet, row + 5, 3, col + 1, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 1) + "8)]"));
            //copy footer ton
            newCell = copyCell(wb, sheet, row + 5, 4, col + 2, petro.getId() + "");
            newCell.setCellValue(new HSSFRichTextString("$[SUM(" + ExcelExport.getColumnName(col + 2) + "8)]"));

            sheet.setColumnWidth(col, sheet.getColumnWidth(2));
            sheet.setColumnWidth((col + 1), sheet.getColumnWidth(3));
            sheet.setColumnWidth((col + 2), sheet.getColumnWidth(4));
            sheet.addMergedRegion(new CellRangeAddress(row + 1, row + 1, col, col + 2));
            col += 3;
        }
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2 + arrPetro.size() * 3));
        FileOutputStream fileOut = new FileOutputStream(f);
        wb.write(fileOut);
        fileOut.close();
    }

    private static HSSFCell copyCell(HSSFWorkbook wb, HSSFSheet sheet, int rowNum, int col, int newCol, String content) {
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

    private static String copyCellValue(String value, String content) {
        String result = "";
        int ind = value.indexOf("${");
        if (ind == 0) {
            ind = value.indexOf(".");
            if (ind > -1) {
                result = "${dynamicdata" + content + value.substring(ind);
            }
        }
        return result;
    }
}