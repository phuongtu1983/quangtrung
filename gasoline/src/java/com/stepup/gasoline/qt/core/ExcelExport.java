/*
 * ExcelExport.java
 *
 * Created on May 31, 2007, 10:20 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.core;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jxls.processor.RowProcessor;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author Administrator
 */
public class ExcelExport {

    /**
     * Creates a new instance of ExcelExport
     */
    private String desFile = "/";
    //private String resultFile = "";
    private Map beans = null;
    private short[] hiddenCols = null;
    private XLSTransformer trans = new XLSTransformer();

    public ExcelExport() {
    }

    public void setBeans(Map beans) {
        this.beans = beans;
    }

    public void setHiddenCols(short[] hiddenCols) {
        this.hiddenCols = hiddenCols;
    }

    public void registerRowProcessor(RowProcessor processor) {
        trans.registerRowProcessor(processor);
    }

    public void export(HttpServletRequest req, HttpServletResponse resp, String templateFile) throws Exception {
        desFile += System.currentTimeMillis() + ".xls";
        if (hiddenCols != null) {
            trans.setColumnsToHide(hiddenCols);
        }
        trans.transformXLS(templateFile, beans, desFile);
        sendToOutput(req, resp, desFile);
    }

    public void export(HttpServletRequest req, HttpServletResponse resp, String templateFile, String exportFile) throws Exception {
        if (exportFile == null) {
            desFile += System.currentTimeMillis() + ".xls";
        } else {
            desFile = exportFile;
        }
        if (hiddenCols != null) {
            trans.setColumnsToHide(hiddenCols);
        }
        trans.transformXLS(templateFile, beans, desFile);
        sendToOutput(req, resp, desFile);
    }

    public void export(HttpServletRequest req, HttpServletResponse resp, String templateFile, String exportFile, OutputStream output) throws Exception {
        if (exportFile == null) {
            desFile += System.currentTimeMillis() + ".xls";
        } else {
            desFile = exportFile;
        }
        if (hiddenCols != null) {
            trans.setColumnsToHide(hiddenCols);
        }
        trans.transformXLS(templateFile, beans, desFile);
        sendToOutput(req, resp, desFile, output);
    }

    private void sendToOutput(HttpServletRequest req, HttpServletResponse resp, String fileName) throws Exception {

        FileInputStream fis = new FileInputStream(fileName);
        BufferedInputStream stream = new BufferedInputStream(fis);
        try {
            resp.setContentType("application/vnd.ms-excel");
            resp.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");
            resp.setHeader("Cache-Control", "max-age=1000");
            copy(stream, resp.getOutputStream());
        } finally {
            if (stream != null) {
                stream.close();
                File file = new File(fileName);
                file.delete();
            }
        }
    }

    private void sendToOutput(HttpServletRequest req, HttpServletResponse resp, String fileName, OutputStream output) throws Exception {
        FileInputStream fis = new FileInputStream(fileName);
        BufferedInputStream stream = new BufferedInputStream(fis);
        try {
            resp.setContentType("application/vnd.ms-excel");
            resp.setHeader("Content-disposition", "inline; filename=\"" + fileName + "\"");
            resp.setHeader("Cache-Control", "max-age=1000");
            if (output == null) {
                copy(stream, resp.getOutputStream());
            } else {
                copy(stream, output);
            }
        } finally {
            if (stream != null) {
                stream.close();
                File file = new File(fileName);
                file.delete();
            }
        }
    }

    private int copy(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[4028];
        int count = 0;
        int n = 0;
        while (-1 != (n = input.read(buffer))) {
            output.write(buffer, 0, n);
            count += n;
        }
        return count;
    }

    public static void copyStyle(HSSFWorkbook workbook, HSSFCell fromCell, HSSFCell toCell) {
        HSSFCellStyle fromStyle = fromCell.getCellStyle();
        HSSFCellStyle newStyle = workbook.createCellStyle();
        newStyle.setAlignment(fromStyle.getAlignment());
        newStyle.setBorderBottom(fromStyle.getBorderBottom());
        newStyle.setBorderLeft(fromStyle.getBorderLeft());
        newStyle.setBorderRight(fromStyle.getBorderRight());
        newStyle.setBorderTop(fromStyle.getBorderTop());
        newStyle.setBottomBorderColor(fromStyle.getBottomBorderColor());
        newStyle.setTopBorderColor(fromStyle.getTopBorderColor());
        newStyle.setRightBorderColor(fromStyle.getRightBorderColor());
        newStyle.setLeftBorderColor(fromStyle.getLeftBorderColor());
        newStyle.setDataFormat(fromStyle.getDataFormat());
        newStyle.setFillBackgroundColor(fromStyle.getFillBackgroundColor());
        newStyle.setFillForegroundColor(fromStyle.getFillForegroundColor());
        newStyle.setFillPattern(fromStyle.getFillPattern());
        newStyle.setFont(workbook.getFontAt(fromStyle.getFontIndex()));
        newStyle.setHidden(fromStyle.getHidden());
        newStyle.setIndention(fromStyle.getIndention());
        newStyle.setLeftBorderColor(fromStyle.getLeftBorderColor());
        newStyle.setLocked(fromStyle.getLocked());
        newStyle.setRightBorderColor(fromStyle.getRightBorderColor());
        newStyle.setTopBorderColor(fromStyle.getTopBorderColor());
        newStyle.setVerticalAlignment(fromStyle.getVerticalAlignment());
        newStyle.setWrapText(fromStyle.getWrapText());
//        newStyle.setFillBackgroundColor(HSSFColor.ORANGE.index);
        toCell.setCellStyle(newStyle);
    }

    public static void setBorder(HSSFWorkbook workbook, HSSFSheet sheet, int row, int col, short border, short color) {
        HSSFRow toRow = sheet.getRow(row);
        HSSFCell toCell = toRow.getCell(col);
        if (toCell == null) {
            toCell = toRow.createCell(col);
        }
        HSSFCellStyle newStyle = workbook.createCellStyle();
        newStyle.setBorderBottom(border);
        newStyle.setBorderLeft(border);
        newStyle.setBorderRight(border);
        newStyle.setBorderTop(border);
        newStyle.setBottomBorderColor(color);
        newStyle.setTopBorderColor(color);
        newStyle.setRightBorderColor(color);
        newStyle.setLeftBorderColor(color);
//        newStyle.setFillBackgroundColor(HSSFColor.ORANGE.index);
        toCell.setCellStyle(newStyle);
    }

    public static String getColumnName(int columnNumber) {
        String name = "";
        String[] columnNames = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        if (columnNumber < columnNames.length) {
            name = columnNames[columnNumber];
        } else {
            int firstLetter = columnNumber / columnNames.length - 1;
            int secondLetter = columnNumber % columnNames.length;
            name = getColumnName(firstLetter) + getColumnName(secondLetter);
        }
        return name;
    }
}
