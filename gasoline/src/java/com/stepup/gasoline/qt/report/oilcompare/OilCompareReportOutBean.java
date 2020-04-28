/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.oilcompare;

/**
 *
 * @author Administrator
 */
public class OilCompareReportOutBean {

    private String companyName;
    private String companyAddress;
    private String companyPhone;
    private String companyFax;
    private String customerName;
    private String customerAddress;
    private String customerPhone;
    private float customerCommission;
    private double customerCommissionAmount;
    private double openingAmountStock;
    private double customerPaid;

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

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public float getCustomerCommission() {
        return customerCommission;
    }

    public void setCustomerCommission(float customerCommission) {
        this.customerCommission = customerCommission;
    }

    public double getCustomerCommissionAmount() {
        return customerCommissionAmount;
    }

    public void setCustomerCommissionAmount(double customerCommissionAmount) {
        this.customerCommissionAmount = customerCommissionAmount;
    }

    public double getCustomerPaid() {
        return customerPaid;
    }

    public void setCustomerPaid(double customerPaid) {
        this.customerPaid = customerPaid;
    }

}
