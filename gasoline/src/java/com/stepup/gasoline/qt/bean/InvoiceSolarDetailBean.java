/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class InvoiceSolarDetailBean {

    private int id;
    private int invoiceSolarId;
    private int solarSaleDetailId;
    private int solarSaleDetailPaid;
    private int solarSaleDetailCommissioned;
    private String solarName;
    private String solarSaleCode;
    private String solarSaleDate;
    private double solarSaleDetailAmount;
    private double solarSalePaidDetailAmount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvoiceSolarId() {
        return invoiceSolarId;
    }

    public void setInvoiceSolarId(int invoiceSolarId) {
        this.invoiceSolarId = invoiceSolarId;
    }

    public int getSolarSaleDetailId() {
        return solarSaleDetailId;
    }

    public void setSolarSaleDetailId(int solarSaleDetailId) {
        this.solarSaleDetailId = solarSaleDetailId;
    }

    public int getSolarSaleDetailPaid() {
        return solarSaleDetailPaid;
    }

    public void setSolarSaleDetailPaid(int solarSaleDetailPaid) {
        this.solarSaleDetailPaid = solarSaleDetailPaid;
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

    public double getSolarSaleDetailAmount() {
        return solarSaleDetailAmount;
    }

    public void setSolarSaleDetailAmount(double solarSaleDetailAmount) {
        this.solarSaleDetailAmount = solarSaleDetailAmount;
    }

    public int getSolarSaleDetailCommissioned() {
        return solarSaleDetailCommissioned;
    }

    public void setSolarSaleDetailCommissioned(int solarSaleDetailCommissioned) {
        this.solarSaleDetailCommissioned = solarSaleDetailCommissioned;
    }

    public double getSolarSalePaidDetailAmount() {
        return solarSalePaidDetailAmount;
    }

    public void setSolarSalePaidDetailAmount(double solarSalePaidDetailAmount) {
        this.solarSalePaidDetailAmount = solarSalePaidDetailAmount;
    }

}
