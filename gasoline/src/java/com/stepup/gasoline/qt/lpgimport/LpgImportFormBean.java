/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgimport;

import com.stepup.gasoline.qt.bean.LpgImportBean;

/**
 *
 * @author phuongtu
 */
public class LpgImportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String importDate;
    private int vendorId;
    private String vendorName;
    private float paperQuantity;
    private float actualQuantity;
    private double price;
    private double amount;
    private double paid;
    private double debt;
    private double rate;
    private int accountId;
    private String note;

    public LpgImportFormBean() {
    }

    public LpgImportFormBean(LpgImportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.importDate = bean.getImportDate();
        this.vendorId = bean.getVendorId();
        this.paperQuantity = bean.getPaperQuantity();
        this.actualQuantity = bean.getActualQuantity();
        this.price = bean.getPrice();
        this.amount = bean.getAccountId();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.rate = bean.getRate();
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

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
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

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
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

    public float getPaperQuantity() {
        return paperQuantity;
    }

    public void setPaperQuantity(float paperQuantity) {
        this.paperQuantity = paperQuantity;
    }

    public float getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(float actualQuantity) {
        this.actualQuantity = actualQuantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

}
