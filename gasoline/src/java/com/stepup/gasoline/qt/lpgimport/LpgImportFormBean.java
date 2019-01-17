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
    private int importVendorId;
    private String vendorName;
    private int paperQuantity;
    private int actualQuantity;
    private double price;
    private double vat;
    private double total;
    private double invoiceTotal;
    private double paid;
    private double debt;
    private double rate;
    private int accountId;
    private int routeId;
    private String note;

    public LpgImportFormBean() {
    }

    public LpgImportFormBean(LpgImportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.importDate = bean.getImportDate();
        this.vendorId = bean.getVendorId();
        this.importVendorId = bean.getImportVendorId();
        this.paperQuantity = bean.getPaperQuantity();
        this.actualQuantity = bean.getActualQuantity();
        this.price = bean.getPrice();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.rate = bean.getRate();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.routeId = bean.getRouteId();
        this.vat = bean.getVat();
        this.invoiceTotal = bean.getInvoiceTotal();
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

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
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

    public int getPaperQuantity() {
        return paperQuantity;
    }

    public void setPaperQuantity(int paperQuantity) {
        this.paperQuantity = paperQuantity;
    }

    public int getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(int actualQuantity) {
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

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public double getVat() {
        return vat;
    }

    public void setVat(double vat) {
        this.vat = vat;
    }

    public double getInvoiceTotal() {
        return invoiceTotal;
    }

    public void setInvoiceTotal(double invoiceTotal) {
        this.invoiceTotal = invoiceTotal;
    }

    public int getImportVendorId() {
        return importVendorId;
    }

    public void setImportVendorId(int importVendorId) {
        this.importVendorId = importVendorId;
    }

}
