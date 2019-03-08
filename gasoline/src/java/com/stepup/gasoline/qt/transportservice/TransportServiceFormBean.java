/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.transportservice;

import com.stepup.gasoline.qt.bean.TransportServiceBean;

/**
 *
 * @author phuongtu
 */
public class TransportServiceFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vendorId;
    private String vendorName;
    private int customerId;
    private String customerName;
    private int transporterId;
    private String transporterName;
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
    private int chargeFor;
    private String note;

    public TransportServiceFormBean() {
    }

    public TransportServiceFormBean(TransportServiceBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vendorId = bean.getVendorId();
        this.customerId = bean.getCustomerId();
        this.transporterId = bean.getTransporterId();
        this.inQuantity = bean.getInQuantity();
        this.outQuantity = bean.getOutQuantity();
        this.price = bean.getPrice();
        this.priceDiff = bean.getPriceDiff();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.rate = bean.getRate();
        this.rateDiff = bean.getRateDiff();
        this.amount = bean.getAmount();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        if (bean.getChargeForVendor() == 1) {
            this.chargeFor = CHARGE_FOR_VENDOR;
        } else {
            this.chargeFor = CHARGE_FOR_CUSTOMER;
        }
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
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

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public double getPriceDiff() {
        return priceDiff;
    }

    public void setPriceDiff(double priceDiff) {
        this.priceDiff = priceDiff;
    }

    public int getChargeFor() {
        return chargeFor;
    }

    public void setChargeFor(int chargeFor) {
        this.chargeFor = chargeFor;
    }

    public int getTransporterId() {
        return transporterId;
    }

    public void setTransporterId(int transporterId) {
        this.transporterId = transporterId;
    }

    public String getTransporterName() {
        return transporterName;
    }

    public void setTransporterName(String transporterName) {
        this.transporterName = transporterName;
    }

    public double getRateDiff() {
        return rateDiff;
    }

    public void setRateDiff(double rateDiff) {
        this.rateDiff = rateDiff;
    }

    public static final int CHARGE_FOR_VENDOR = 1;
    public static final int CHARGE_FOR_CUSTOMER = 2;
}
