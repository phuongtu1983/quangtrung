/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

/**
 *
 * @author Administrator
 */
public class LpgStockReportBean {

    private String date;
    private String content;
    private int openingStock;
    private int importQuantity;
    private int export12Quantity;
    private int export45Quantity;
    private int convertQuantity;
    private int closingStock;
    private int returnQuantity;
    private String note;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

    public int getImportQuantity() {
        return importQuantity;
    }

    public void setImportQuantity(int importQuantity) {
        this.importQuantity = importQuantity;
    }

    public int getExport12Quantity() {
        return export12Quantity;
    }

    public void setExport12Quantity(int export12Quantity) {
        this.export12Quantity = export12Quantity;
    }

    public int getExport45Quantity() {
        return export45Quantity;
    }

    public void setExport45Quantity(int export45Quantity) {
        this.export45Quantity = export45Quantity;
    }

    public int getConvertQuantity() {
        return convertQuantity;
    }

    public void setConvertQuantity(int convertQuantity) {
        this.convertQuantity = convertQuantity;
    }

    public int getClosingStock() {
        return closingStock;
    }

    public void setClosingStock(int closingStock) {
        this.closingStock = closingStock;
    }

    public int getReturnQuantity() {
        return returnQuantity;
    }

    public void setReturnQuantity(int returnQuantity) {
        this.returnQuantity = returnQuantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
