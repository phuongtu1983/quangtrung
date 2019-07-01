/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class OilExportDetailBean {

    private int id;
    private int oilExportId;
    private int oilSaleDetailId;
    private int oilId;
    private String oilName;
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

    public int getOilId() {
        return oilId;
    }

    public void setOilId(int oilId) {
        this.oilId = oilId;
    }

    public String getOilName() {
        return oilName;
    }

    public void setOilName(String oilName) {
        this.oilName = oilName;
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

    public int getOilExportId() {
        return oilExportId;
    }

    public void setOilExportId(int oilExportId) {
        this.oilExportId = oilExportId;
    }

    public int getOilSaleDetailId() {
        return oilSaleDetailId;
    }

    public void setOilSaleDetailId(int oilSaleDetailId) {
        this.oilSaleDetailId = oilSaleDetailId;
    }

}
