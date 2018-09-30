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
    private float openingStock;
    private float importQuantity;
    private float export12Quantity;
    private float export45Quantity;
    private float convertQuantity;
    private float closingStock;
    private float returnQuantity;
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

    public float getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(float openingStock) {
        this.openingStock = openingStock;
    }

    public float getImportQuantity() {
        return importQuantity;
    }

    public void setImportQuantity(float importQuantity) {
        this.importQuantity = importQuantity;
    }

    public float getExport12Quantity() {
        return export12Quantity;
    }

    public void setExport12Quantity(float export12Quantity) {
        this.export12Quantity = export12Quantity;
    }

    public float getExport45Quantity() {
        return export45Quantity;
    }

    public void setExport45Quantity(float export45Quantity) {
        this.export45Quantity = export45Quantity;
    }

    public float getConvertQuantity() {
        return convertQuantity;
    }

    public void setConvertQuantity(float convertQuantity) {
        this.convertQuantity = convertQuantity;
    }

    public float getClosingStock() {
        return closingStock;
    }

    public void setClosingStock(float closingStock) {
        this.closingStock = closingStock;
    }

    public float getReturnQuantity() {
        return returnQuantity;
    }

    public void setReturnQuantity(float returnQuantity) {
        this.returnQuantity = returnQuantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
