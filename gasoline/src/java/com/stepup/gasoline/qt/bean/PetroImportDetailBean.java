/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class PetroImportDetailBean {

    private int id;
    private int petroImportId;
    private int petroId;
    private String petroName;
    private int unitId;
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

    public int getPetroImportId() {
        return petroImportId;
    }

    public void setPetroImportId(int petroImportId) {
        this.petroImportId = petroImportId;
    }

    public int getPetroId() {
        return petroId;
    }

    public void setPetroId(int petroId) {
        this.petroId = petroId;
    }

    public String getPetroName() {
        return petroName;
    }

    public void setPetroName(String petroName) {
        this.petroName = petroName;
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

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

}
