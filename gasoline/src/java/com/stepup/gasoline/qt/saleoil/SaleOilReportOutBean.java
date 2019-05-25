/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoil;

/**
 *
 * @author Administrator
 */
public class SaleOilReportOutBean {

    private String code;
    private String customerName;
    private String customerAddress;
    private String customerPhone;
    private String exportNumber;
    private String exportDate;
    private float customerCommission;
    private double customerCommissionAmount;
    private double total;
    private double paid;
    private double debt;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getPaid() {
        return paid;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public double getDebt() {
        return debt;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

    public String getExportNumber() {
        return exportNumber;
    }

    public void setExportNumber(String exportNumber) {
        this.exportNumber = exportNumber;
    }

    public String getExportDate() {
        return exportDate;
    }

    public void setExportDate(String exportDate) {
        this.exportDate = exportDate;
    }

}
