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
public class SaleCustomerReportBean {

    private int count;
    private String customerCode;
    private String customerName;
    private int gas12;
    private int gas45;
    private double revenue;
    private double debt12;
    private double debt45;
    private double debt;
    private double openingDebt12;
    private double openingDebt45;
    private double openingDebt;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getGas12() {
        return gas12;
    }

    public void setGas12(int gas12) {
        this.gas12 = gas12;
    }

    public int getGas45() {
        return gas45;
    }

    public void setGas45(int gas45) {
        this.gas45 = gas45;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public double getDebt12() {
        return debt12;
    }

    public void setDebt12(double debt12) {
        this.debt12 = debt12;
    }

    public double getDebt45() {
        return debt45;
    }

    public void setDebt45(double debt45) {
        this.debt45 = debt45;
    }

    public double getDebt() {
        return debt;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

    public double getOpeningDebt12() {
        return openingDebt12;
    }

    public void setOpeningDebt12(double openingDebt12) {
        this.openingDebt12 = openingDebt12;
    }

    public double getOpeningDebt45() {
        return openingDebt45;
    }

    public void setOpeningDebt45(double openingDebt45) {
        this.openingDebt45 = openingDebt45;
    }

    public double getOpeningDebt() {
        return openingDebt;
    }

    public void setOpeningDebt(double openingDebt) {
        this.openingDebt = openingDebt;
    }

}
