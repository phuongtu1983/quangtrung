/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparevendor;

/**
 *
 * @author Administrator
 */
public class CompareVendorReportOutBean {

    private double openingStockAmount;
    private double endingStockAmount;
    private String companyName;
    private String companyAddress;
    private String companyPhone;
    private String companyFax;
    private String vendorName;

    public double getOpeningStockAmount() {
        return openingStockAmount;
    }

    public void setOpeningStockAmount(double openingStockAmount) {
        this.openingStockAmount = openingStockAmount;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyFax() {
        return companyFax;
    }

    public void setCompanyFax(String companyFax) {
        this.companyFax = companyFax;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public double getEndingStockAmount() {
        return endingStockAmount;
    }

    public void setEndingStockAmount(double endingStockAmount) {
        this.endingStockAmount = endingStockAmount;
    }

}
