/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellimport;

import com.stepup.gasoline.qt.bean.ShellImportBean;

/**
 *
 * @author phuongtu
 */
public class ShellImportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String createdDate;
    private String code;
    private int shellId;
    private String shellName;
    private int quantity;
    private double price;
    private double amount;
    private int accountId;
    private int vendorId;
    private String note;

    public ShellImportFormBean() {
    }

    public ShellImportFormBean(ShellImportBean bean) {
        this.id = bean.getId();
        this.createdDate = bean.getCreatedDate();
        this.code = bean.getCode();
        this.shellId = bean.getShellId();
        this.quantity = bean.getQuantity();
        this.price = bean.getPrice();
        this.note = bean.getNote();
        this.amount = bean.getAmount();
        this.accountId = bean.getAccountId();
        this.vendorId = bean.getVendorId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getShellId() {
        return shellId;
    }

    public void setShellId(int shellId) {
        this.shellId = shellId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getShellName() {
        return shellName;
    }

    public void setShellName(String shellName) {
        this.shellName = shellName;
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

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

}
