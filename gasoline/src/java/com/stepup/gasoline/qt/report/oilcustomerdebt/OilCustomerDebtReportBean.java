/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.oilcustomerdebt;

/**
 *
 * @author Administrator
 */
public class OilCustomerDebtReportBean {

    private int count;
    private String oilExportCode;
    private String oilCode;
    private String oilName;
    private String unitName;
    private int quantity;
    private double price;
    private double openingDebt;
    private double amount;
    private double paid;
    private double debt;
    private double closingDebt;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getPaid() {
        return paid;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public String getOilExportCode() {
        return oilExportCode;
    }

    public void setOilExportCode(String oilExportCode) {
        this.oilExportCode = oilExportCode;
    }

    public String getOilCode() {
        return oilCode;
    }

    public void setOilCode(String oilCode) {
        this.oilCode = oilCode;
    }

    public String getOilName() {
        return oilName;
    }

    public void setOilName(String oilName) {
        this.oilName = oilName;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public double getOpeningDebt() {
        return openingDebt;
    }

    public void setOpeningDebt(double openingDebt) {
        this.openingDebt = openingDebt;
    }

    public double getClosingDebt() {
        return closingDebt;
    }

    public void setClosingDebt(double closingDebt) {
        this.closingDebt = closingDebt;
    }

    public double getDebt() {
        return debt;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

}
