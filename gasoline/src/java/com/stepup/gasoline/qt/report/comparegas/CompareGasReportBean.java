/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparegas;

/**
 *
 * @author Administrator
 */
public class CompareGasReportBean {

    private String date;
    private int quantity12;
    private int quantity45;
    private int quantitySum;
    private double price12;
    private double price45;
    private double amount12;
    private double amount45;
    private double amount;
    private double paid;
    private double debt;
    private int returnShell12;
    private int returnShell45;
    private int debtShell12;
    private int debtShell45;

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

    public int getQuantitySum() {
        return quantitySum;
    }

    public void setQuantitySum(int quantitySum) {
        this.quantitySum = quantitySum;
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

    public double getAmount12() {
        return amount12;
    }

    public void setAmount12(double amount12) {
        this.amount12 = amount12;
    }

    public double getAmount45() {
        return amount45;
    }

    public void setAmount45(double amount45) {
        this.amount45 = amount45;
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

    public int getReturnShell12() {
        return returnShell12;
    }

    public void setReturnShell12(int returnShell12) {
        this.returnShell12 = returnShell12;
    }

    public int getReturnShell45() {
        return returnShell45;
    }

    public void setReturnShell45(int returnShell45) {
        this.returnShell45 = returnShell45;
    }

    public int getDebtShell12() {
        return debtShell12;
    }

    public void setDebtShell12(int debtShell12) {
        this.debtShell12 = debtShell12;
    }

    public int getDebtShell45() {
        return debtShell45;
    }

    public void setDebtShell45(int debtShell45) {
        this.debtShell45 = debtShell45;
    }

}
