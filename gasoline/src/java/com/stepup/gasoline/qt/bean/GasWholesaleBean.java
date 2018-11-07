/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class GasWholesaleBean {

    private int id;
    private String code;
    private String createdDate;
    private int customerId;
    private int vehicleOutId;
    private double total;
    private double paid;
    private double debt;
    private double discount;
    private double totalPay;
    private int gasReturn;
    private double gasReturnPrice;
    private double gasReturnAmount;
    private int accountId;
    private String note;
    private int canEdit;
    private int createdEmployeeId;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
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

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getVehicleOutId() {
        return vehicleOutId;
    }

    public void setVehicleOutId(int vehicleOutId) {
        this.vehicleOutId = vehicleOutId;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }

    public int getGasReturn() {
        return gasReturn;
    }

    public void setGasReturn(int gasReturn) {
        this.gasReturn = gasReturn;
    }

    public double getGasReturnPrice() {
        return gasReturnPrice;
    }

    public void setGasReturnPrice(double gasReturnPrice) {
        this.gasReturnPrice = gasReturnPrice;
    }

    public double getGasReturnAmount() {
        return gasReturnAmount;
    }

    public void setGasReturnAmount(double gasReturnAmount) {
        this.gasReturnAmount = gasReturnAmount;
    }

    public int getCreatedEmployeeId() {
        return createdEmployeeId;
    }

    public void setCreatedEmployeeId(int createdEmployeeId) {
        this.createdEmployeeId = createdEmployeeId;
    }

}
