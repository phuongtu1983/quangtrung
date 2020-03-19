/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

/**
 *
 * @author phuongtu
 */
public class SearchedSaleSolarBean {

    private int id;
    private String solarName;
    private String solarSaleCode;
    private String solarSaleDate;
    private double amount;
    private String amountText;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSolarName() {
        return solarName;
    }

    public void setSolarName(String solarName) {
        this.solarName = solarName;
    }

    public String getSolarSaleCode() {
        return solarSaleCode;
    }

    public void setSolarSaleCode(String solarSaleCode) {
        this.solarSaleCode = solarSaleCode;
    }

    public String getSolarSaleDate() {
        return solarSaleDate;
    }

    public void setSolarSaleDate(String solarSaleDate) {
        this.solarSaleDate = solarSaleDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getAmountText() {
        return amountText;
    }

    public void setAmountText(String amountText) {
        this.amountText = amountText;
    }

}
