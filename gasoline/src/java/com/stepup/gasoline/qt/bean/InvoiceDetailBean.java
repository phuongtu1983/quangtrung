/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class InvoiceDetailBean {

    private int id;
    private int invoiceId;
    private int oilSaleDetailId;
    private int oilSaleDetailPaid;
    private int oilSaleDetailCommissioned;
    private String oilName;
    private String oilSaleCode;
    private String oilSaleDate;
    private double oilSaleDetailAmount;
    private double oilSalePaidDetailAmount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getOilSaleDetailId() {
        return oilSaleDetailId;
    }

    public void setOilSaleDetailId(int oilSaleDetailId) {
        this.oilSaleDetailId = oilSaleDetailId;
    }

    public int getOilSaleDetailPaid() {
        return oilSaleDetailPaid;
    }

    public void setOilSaleDetailPaid(int oilSaleDetailPaid) {
        this.oilSaleDetailPaid = oilSaleDetailPaid;
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

    public double getOilSaleDetailAmount() {
        return oilSaleDetailAmount;
    }

    public void setOilSaleDetailAmount(double oilSaleDetailAmount) {
        this.oilSaleDetailAmount = oilSaleDetailAmount;
    }

    public int getOilSaleDetailCommissioned() {
        return oilSaleDetailCommissioned;
    }

    public void setOilSaleDetailCommissioned(int oilSaleDetailCommissioned) {
        this.oilSaleDetailCommissioned = oilSaleDetailCommissioned;
    }

    public double getOilSalePaidDetailAmount() {
        return oilSalePaidDetailAmount;
    }

    public void setOilSalePaidDetailAmount(double oilSalePaidDetailAmount) {
        this.oilSalePaidDetailAmount = oilSalePaidDetailAmount;
    }

}
