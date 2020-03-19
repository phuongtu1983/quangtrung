/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SaleSolarDetailBean {

    private int no;
    private int id;
    private int saleSolarId;
    private int solarId;
    private String solarName;
    private int unitId;
    private String unitName;
    private int storeId;
    private String storeName;
    private int customerId;
    private String customerName;
    private int quantity;
    private double priceBeforeCommission;
    private float commissionPrice;
    private double price;
    private double firstAmount;
    private float commission;
    private double gapAgencyAmount;
    private double gapCustomerAmount;
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

    public int getSaleSolarId() {
        return saleSolarId;
    }

    public void setSaleSolarId(int saleSolarId) {
        this.saleSolarId = saleSolarId;
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

    public double getPriceBeforeCommission() {
        return priceBeforeCommission;
    }

    public void setPriceBeforeCommission(double priceBeforeCommission) {
        this.priceBeforeCommission = priceBeforeCommission;
    }

    public float getCommissionPrice() {
        return commissionPrice;
    }

    public void setCommissionPrice(float commissionPrice) {
        this.commissionPrice = commissionPrice;
    }

    public double getFirstAmount() {
        return firstAmount;
    }

    public void setFirstAmount(double firstAmount) {
        this.firstAmount = firstAmount;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

    public double getGapAgencyAmount() {
        return gapAgencyAmount;
    }

    public void setGapAgencyAmount(double gapAgencyAmount) {
        this.gapAgencyAmount = gapAgencyAmount;
    }

    public double getGapCustomerAmount() {
        return gapCustomerAmount;
    }

    public void setGapCustomerAmount(double gapCustomerAmount) {
        this.gapCustomerAmount = gapCustomerAmount;
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

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

}
