/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class InvoiceSolarPaidDetailBean {

    private int id;
    private int invoiceSolarId;
    private double amount;
    private String paidDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvoiceSolarId() {
        return invoiceSolarId;
    }

    public void setInvoiceSolarId(int invoiceSolarId) {
        this.invoiceSolarId = invoiceSolarId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(String paidDate) {
        this.paidDate = paidDate;
    }

}
