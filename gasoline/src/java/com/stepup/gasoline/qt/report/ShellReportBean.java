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
public class ShellReportBean {

    private int shellVendorId;
    private int count;
    private String name;
    private double openingStock;
    private double closingStock;
    private String createdDate;
    private int quantity;
    private String changeCreatedDate;
    private int changeQuantity;
    private double changeClosingStock;

    public ShellReportBean() {
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getShellVendorId() {
        return shellVendorId;
    }

    public void setShellVendorId(int shellVendorId) {
        this.shellVendorId = shellVendorId;
    }

    public double getClosingStock() {
        return closingStock;
    }

    public void setClosingStock(double closingStock) {
        this.closingStock = closingStock;
    }

    public String getChangeCreatedDate() {
        return changeCreatedDate;
    }

    public void setChangeCreatedDate(String changeCreatedDate) {
        this.changeCreatedDate = changeCreatedDate;
    }

    public int getChangeQuantity() {
        return changeQuantity;
    }

    public void setChangeQuantity(int changeQuantity) {
        this.changeQuantity = changeQuantity;
    }

    public double getChangeClosingStock() {
        return changeClosingStock;
    }

    public void setChangeClosingStock(double changeClosingStock) {
        this.changeClosingStock = changeClosingStock;
    }

}
