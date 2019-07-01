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
    private int quantityLoVo;
    private int accessoryKindId;
    private int quantityAccessory;
    private double commissionAccessory;
    private int employeeOilCommissionId;
    private int quantityEmployeeOilCommission;
    private double commissionEmployeeOilCommission;
    private double amount;
    private String vehiclePlate;

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

    public int getQuantityLoVo() {
        return quantityLoVo;
    }

    public void setQuantityLoVo(int quantityLoVo) {
        this.quantityLoVo = quantityLoVo;
    }

    public int getQuantityAccessory() {
        return quantityAccessory;
    }

    public void setQuantityAccessory(int quantityAccessory) {
        this.quantityAccessory = quantityAccessory;
    }

    public double getCommissionAccessory() {
        return commissionAccessory;
    }

    public void setCommissionAccessory(double commissionAccessory) {
        this.commissionAccessory = commissionAccessory;
    }

    public int getAccessoryKindId() {
        return accessoryKindId;
    }

    public void setAccessoryKindId(int accessoryKindId) {
        this.accessoryKindId = accessoryKindId;
    }

    public String getVehiclePlate() {
        return vehiclePlate;
    }

    public void setVehiclePlate(String vehiclePlate) {
        this.vehiclePlate = vehiclePlate;
    }

    public int getEmployeeOilCommissionId() {
        return employeeOilCommissionId;
    }

    public void setEmployeeOilCommissionId(int employeeOilCommissionId) {
        this.employeeOilCommissionId = employeeOilCommissionId;
    }

    public int getQuantityEmployeeOilCommission() {
        return quantityEmployeeOilCommission;
    }

    public void setQuantityEmployeeOilCommission(int quantityEmployeeOilCommission) {
        this.quantityEmployeeOilCommission = quantityEmployeeOilCommission;
    }

    public double getCommissionEmployeeOilCommission() {
        return commissionEmployeeOilCommission;
    }

    public void setCommissionEmployeeOilCommission(double commissionEmployeeOilCommission) {
        this.commissionEmployeeOilCommission = commissionEmployeeOilCommission;
    }

}
