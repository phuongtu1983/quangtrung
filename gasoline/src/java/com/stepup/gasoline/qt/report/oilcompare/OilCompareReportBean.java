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
public class OilCompareReportBean {

    private int count;
    private String date;
    private String oilCode;
    private String oilName;
    private int quantity;
    private double price;
    private double amount;
    private double paid;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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

}
