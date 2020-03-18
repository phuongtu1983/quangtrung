/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

/**
 *
 * @author Administrator
 */
public class SaleReportBean {

    private String date;
    private String customerCode;
    private String customerName;
    private int quantity12;
    private int quantity45;
    private int shellReturn12;
    private int shellReturn12T;
    private int shellReturn45;
    private double price12;
    private double price45;
    private double amount;
    private double paid;
    private double otherFee;
    private String paymentMethod;
    private String note;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getQuantity12() {
        return quantity12;
    }

    public void setQuantity12(int quantity12) {
        this.quantity12 = quantity12;
    }

    public int getQuantity45() {
        return quantity45;
    }

    public void setQuantity45(int quantity45) {
        this.quantity45 = quantity45;
    }

    public int getShellReturn12() {
        return shellReturn12;
    }

    public void setShellReturn12(int shellReturn12) {
        this.shellReturn12 = shellReturn12;
    }

    public int getShellReturn12T() {
        return shellReturn12T;
    }

    public void setShellReturn12T(int shellReturn12T) {
        this.shellReturn12T = shellReturn12T;
    }

    public int getShellReturn45() {
        return shellReturn45;
    }

    public void setShellReturn45(int shellReturn45) {
        this.shellReturn45 = shellReturn45;
    }

    public double getPrice12() {
        return price12;
    }

    public void setPrice12(double price12) {
        this.price12 = price12;
    }

    public double getPrice45() {
        return price45;
    }

    public void setPrice45(double price45) {
        this.price45 = price45;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getPaid() {
        return paid;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public double getOtherFee() {
        return otherFee;
    }

    public void setOtherFee(double otherFee) {
        this.otherFee = otherFee;
    }

}
