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
    private String customer;
    private double inQuantity;
    private double outQuantity;
    private double price;
    private double rate;
    private double amount;
    private double paid;
    private double debt;
    private int accountId;
    private String note;

    public TransportServiceFormBean() {
    }

    public TransportServiceFormBean(TransportServiceBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vendorId = bean.getVendorId();
        this.customer = bean.getCustomer();
        this.inQuantity = bean.getInQuantity();
        this.outQuantity = bean.getOutQuantity();
        this.price = bean.getPrice();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.rate = bean.getRate();
        this.amount = bean.getAmount();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
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

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

}
