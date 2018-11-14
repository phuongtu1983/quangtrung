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
public class CashBookReportBean {

    private String date;
    private String content;
    private double accountIncome;
    private double accountOutcome;
    private double accountStock;
    private String accountNote;
    private double cashIncome;
    private double cashOutcome;
    private double cashStock;
    private String cashNote;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getAccountIncome() {
        return accountIncome;
    }

    public void setAccountIncome(double accountIncome) {
        this.accountIncome = accountIncome;
    }

    public double getAccountOutcome() {
        return accountOutcome;
    }

    public void setAccountOutcome(double accountOutcome) {
        this.accountOutcome = accountOutcome;
    }

    public double getAccountStock() {
        return accountStock;
    }

    public void setAccountStock(double accountStock) {
        this.accountStock = accountStock;
    }

    public String getAccountNote() {
        return accountNote;
    }

    public void setAccountNote(String accountNote) {
        this.accountNote = accountNote;
    }

    public double getCashIncome() {
        return cashIncome;
    }

    public void setCashIncome(double cashIncome) {
        this.cashIncome = cashIncome;
    }

    public double getCashOutcome() {
        return cashOutcome;
    }

    public void setCashOutcome(double cashOutcome) {
        this.cashOutcome = cashOutcome;
    }

    public double getCashStock() {
        return cashStock;
    }

    public void setCashStock(double cashStock) {
        this.cashStock = cashStock;
    }

    public String getCashNote() {
        return cashNote;
    }

    public void setCashNote(String cashNote) {
        this.cashNote = cashNote;
    }

}
