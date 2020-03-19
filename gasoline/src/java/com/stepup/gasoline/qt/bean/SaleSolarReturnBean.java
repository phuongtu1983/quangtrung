/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SaleSolarReturnBean {

    private int id;
    private String code;
    private String createdDate;
    private double totalBeforeCommisison;
    private double total;
    private double paid;
    private double debt;
    private double totalPay;
    private int accountId;
    private String note;
    private int canEdit;
    private int customerId;
    private int createdEmployeeId;
    private float commission;
    private int commissionKind;
    private double commissionAmount;
    private double gapCustomerAmount;
    private double gapAgencyAmount;

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

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCreatedEmployeeId() {
        return createdEmployeeId;
    }

    public void setCreatedEmployeeId(int createdEmployeeId) {
        this.createdEmployeeId = createdEmployeeId;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

    public int getCommissionKind() {
        return commissionKind;
    }

    public void setCommissionKind(int commissionKind) {
        this.commissionKind = commissionKind;
    }

    public double getCommissionAmount() {
        return commissionAmount;
    }

    public void setCommissionAmount(double commissionAmount) {
        this.commissionAmount = commissionAmount;
    }

    public double getGapCustomerAmount() {
        return gapCustomerAmount;
    }

    public void setGapCustomerAmount(double gapCustomerAmount) {
        this.gapCustomerAmount = gapCustomerAmount;
    }

    public double getGapAgencyAmount() {
        return gapAgencyAmount;
    }

    public void setGapAgencyAmount(double gapAgencyAmount) {
        this.gapAgencyAmount = gapAgencyAmount;
    }

    public double getTotalBeforeCommisison() {
        return totalBeforeCommisison;
    }

    public void setTotalBeforeCommisison(double totalBeforeCommisison) {
        this.totalBeforeCommisison = totalBeforeCommisison;
    }

}
