/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class GasImportBean {

    private int id;
    private String code;
    private String createdDate;
    private int vendorId;
    private int storeId;
    private double rate;
    private double total;
    private double paid;
    private double debt;
    private int accountId;
    private String note;
    private int canEdit;

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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
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

}
