/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SolarExportDetailBean {

    private int id;
    private int solarExportId;
    private int solarSaleDetailId;
    private int solarId;
    private String solarName;
    private String unitName;
    private int quantity;
    private double price;
    private double amount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSolarId() {
        return solarId;
    }

    public void setSolarId(int solarId) {
        this.solarId = solarId;
    }

    public String getSolarName() {
        return solarName;
    }

    public void setSolarName(String solarName) {
        this.solarName = solarName;
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

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public int getSolarExportId() {
        return solarExportId;
    }

    public void setSolarExportId(int solarExportId) {
        this.solarExportId = solarExportId;
    }

    public int getSolarSaleDetailId() {
        return solarSaleDetailId;
    }

    public void setSolarSaleDetailId(int solarSaleDetailId) {
        this.solarSaleDetailId = solarSaleDetailId;
    }

}
