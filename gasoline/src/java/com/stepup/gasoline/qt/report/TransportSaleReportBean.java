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
public class TransportSaleReportBean {

    private String vehiclePlate;
    private String date;
    private String employeeName;
    private int quantity12;
    private int quantity45;
    private int shellReturn12;
    private int shellReturn12T;
    private int shellReturn45;
    private double amount;
    private double paid;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public String getVehiclePlate() {
        return vehiclePlate;
    }

    public void setVehiclePlate(String vehiclePlate) {
        this.vehiclePlate = vehiclePlate;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

}
