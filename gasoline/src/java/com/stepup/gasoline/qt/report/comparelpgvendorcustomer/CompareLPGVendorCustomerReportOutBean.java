/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparelpgvendorcustomer;

/**
 *
 * @author Administrator
 */
public class CompareLPGVendorCustomerReportOutBean {

    private double openingStock;
    private double endingStock;
    private String vendorName;

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

    public double getEndingStock() {
        return endingStock;
    }

    public void setEndingStock(double endingStock) {
        this.endingStock = endingStock;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

}
