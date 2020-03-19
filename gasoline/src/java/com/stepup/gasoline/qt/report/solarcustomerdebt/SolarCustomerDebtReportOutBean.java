/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.solarcustomerdebt;


/**
 *
 * @author Administrator
 */
public class SolarCustomerDebtReportOutBean {

    private double closingDebt;
    private double openingDebt;
    private String customerName;

    public double getClosingDebt() {
        return closingDebt;
    }

    public void setClosingDebt(double closingDebt) {
        this.closingDebt = closingDebt;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getOpeningDebt() {
        return openingDebt;
    }

    public void setOpeningDebt(double openingDebt) {
        this.openingDebt = openingDebt;
    }

}
