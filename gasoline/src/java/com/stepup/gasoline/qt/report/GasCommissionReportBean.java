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
public class GasCommissionReportBean {

    private String date;
    private int employeeId;
    private int quantity12;
    private int quantity45;
    private double amount;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
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

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

}
