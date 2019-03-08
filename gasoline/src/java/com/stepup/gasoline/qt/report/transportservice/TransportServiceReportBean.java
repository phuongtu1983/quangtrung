/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.transportservice;

/**
 *
 * @author Administrator
 */
public class TransportServiceReportBean {

    private int count;
    private String date;
    private String content;
    private double inQuantity;
    private double outQuantity;
    private double price;
    private double priceDiff;
    private double rate;
    private double rateDiff;
    private double amount;
    private double amountDiff;
    private double total;
    private double paid;
    private double debt;
    private String note;
    private String customerName;
    private String customerAddress;
    private String customerTax;
    private String customerPhone;
    private String customerFax;

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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerTax() {
        return customerTax;
    }

    public void setCustomerTax(String customerTax) {
        this.customerTax = customerTax;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerFax() {
        return customerFax;
    }

    public void setCustomerFax(String customerFax) {
        this.customerFax = customerFax;
    }

    public double getPriceDiff() {
        return priceDiff;
    }

    public void setPriceDiff(double priceDiff) {
        this.priceDiff = priceDiff;
    }

    public double getRateDiff() {
        return rateDiff;
    }

    public void setRateDiff(double rateDiff) {
        this.rateDiff = rateDiff;
    }

    public double getAmountDiff() {
        return amountDiff;
    }

    public void setAmountDiff(double amountDiff) {
        this.amountDiff = amountDiff;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
