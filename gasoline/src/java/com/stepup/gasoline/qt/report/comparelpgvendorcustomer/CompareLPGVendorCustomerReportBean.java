/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparelpgvendorcustomer;

/**
 *
 * @author Administrator
 */
public class CompareLPGVendorCustomerReportBean {

    private int count;
    private String date;
    private String content;
    private String note;
    private double inQuantity;
    private double outQuantity;
    private double transportQuantity;
    private double price;
    private double rate;
    private double amount;
    private double paid;
    private double debt;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public double getTransportQuantity() {
        return transportQuantity;
    }

    public void setTransportQuantity(double transportQuantity) {
        this.transportQuantity = transportQuantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
