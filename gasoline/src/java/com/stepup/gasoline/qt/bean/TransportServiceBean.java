/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class TransportServiceBean {

    private int id;
    private String code;
    private String createdDate;
    private int vendorId;
    private int customerId;
    private int transporterId;
    private int chargeForVendor;
    private int chargeForCustomer;
    private double inQuantity;
    private double outQuantity;
    private double price;
    private double priceDiff;
    private double rate;
    private double rateDiff;
    private double amount;
    private double paid;
    private double debt;
    private int accountId;
    private String note;
    private int createdEmployeeId;

    public TransportServiceBean() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public double getInQuantity() {
        return inQuantity;
    }

    public void setInQuantity(double inQuantity) {
        this.inQuantity = inQuantity;
    }

    public double getOutQuantity() {
        return outQuantity;
    }

    public void setOutQuantity(double outQuantity) {
        this.outQuantity = outQuantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
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

    public double getDebt() {
        return debt;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getCreatedEmployeeId() {
        return createdEmployeeId;
    }

    public void setCreatedEmployeeId(int createdEmployeeId) {
        this.createdEmployeeId = createdEmployeeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public double getPriceDiff() {
        return priceDiff;
    }

    public void setPriceDiff(double priceDiff) {
        this.priceDiff = priceDiff;
    }

    public int getTransporterId() {
        return transporterId;
    }

    public void setTransporterId(int transporterId) {
        this.transporterId = transporterId;
    }

    public int getChargeForVendor() {
        return chargeForVendor;
    }

    public void setChargeForVendor(int chargeForVendor) {
        this.chargeForVendor = chargeForVendor;
    }

    public int getChargeForCustomer() {
        return chargeForCustomer;
    }

    public void setChargeForCustomer(int chargeForCustomer) {
        this.chargeForCustomer = chargeForCustomer;
    }

    public double getRateDiff() {
        return rateDiff;
    }

    public void setRateDiff(double rateDiff) {
        this.rateDiff = rateDiff;
    }

}
