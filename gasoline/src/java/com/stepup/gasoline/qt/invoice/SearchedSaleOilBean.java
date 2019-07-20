/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoice;

/**
 *
 * @author phuongtu
 */
public class SearchedSaleOilBean {

    private int id;
    private String oilName;
    private String oilSaleCode;
    private String oilSaleDate;
    private double amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOilName() {
        return oilName;
    }

    public void setOilName(String oilName) {
        this.oilName = oilName;
    }

    public String getOilSaleCode() {
        return oilSaleCode;
    }

    public void setOilSaleCode(String oilSaleCode) {
        this.oilSaleCode = oilSaleCode;
    }

    public String getOilSaleDate() {
        return oilSaleDate;
    }

    public void setOilSaleDate(String oilSaleDate) {
        this.oilSaleDate = oilSaleDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

}
