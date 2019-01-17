/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparelpg;

/**
 *
 * @author Administrator
 */
public class CompareLPGReportOutBean {

    private int amountDebt;
    private int opening45Stock;
    private double openingAmountStock;
    private String companyName;
    private String companyTax;
    private String companyAddress;
    private String companyPhone;
    private String companyFax;
    private String customerName;

    public int getAmountDebt() {
        return amountDebt;
    }

    public void setAmountDebt(int amountDebt) {
        this.amountDebt = amountDebt;
    }

    public String getCompanyTax() {
        return companyTax;
    }

    public void setCompanyTax(String companyTax) {
        this.companyTax = companyTax;
    }

    public int getOpening45Stock() {
        return opening45Stock;
    }

    public void setOpening45Stock(int opening45Stock) {
        this.opening45Stock = opening45Stock;
    }

    public double getOpeningAmountStock() {
        return openingAmountStock;
    }

    public void setOpeningAmountStock(double openingAmountStock) {
        this.openingAmountStock = openingAmountStock;
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

}
