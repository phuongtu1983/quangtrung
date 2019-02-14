/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgsale;

import com.stepup.gasoline.qt.bean.LpgSaleBean;

/**
 *
 * @author phuongtu
 */
public class LpgSaleFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String saleDate;
    private int kind;
    private int customerId;
    private String customerName;
    private int quantity;
    private double price;
    private double vat;
    private double rate;
    private double total;
    private double paid;
    private double debt;
    private int accountId;
    private int routeId;
    private String note;

    public LpgSaleFormBean() {
    }

    public LpgSaleFormBean(LpgSaleBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.saleDate = bean.getSaleDate();
        this.kind = bean.getKind();
        this.customerId = bean.getCustomerId();
        this.quantity = bean.getQuantity();
        this.price = bean.getPrice();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.accountId = bean.getAccountId();
        this.routeId = bean.getRouteId();
        this.note = bean.getNote();
        this.rate = bean.getRate();
        this.vat = bean.getVat();
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

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public int getKind() {
        return kind;
    }

    public void setKind(int kind) {
        this.kind = kind;
    }

}
