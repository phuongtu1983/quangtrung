/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SalePetroDetailBean {

    private int id;
    private int salePetroId;
    private int petroId;
    private String petroName;
    private int unitId;
    private String unitName;
    private int storeId;
    private String storeName;
    private int customerId;
    private String customerName;
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

    public int getSalePetroId() {
        return salePetroId;
    }

    public void setSalePetroId(int salePetroId) {
        this.salePetroId = salePetroId;
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

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

}
