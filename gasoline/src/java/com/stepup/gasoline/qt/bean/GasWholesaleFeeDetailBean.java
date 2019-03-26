/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class GasWholesaleFeeDetailBean {

    private int id;
    private int gasWholesaleId;
    private int feeId;
    private String feeName;
    private double amount;
    private int kind;
    private String note;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGasWholesaleId() {
        return gasWholesaleId;
    }

    public void setGasWholesaleId(int gasWholesaleId) {
        this.gasWholesaleId = gasWholesaleId;
    }

    public int getFeeId() {
        return feeId;
    }

    public void setFeeId(int feeId) {
        this.feeId = feeId;
    }

    public String getFeeName() {
        return feeName;
    }

    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getKind() {
        return kind;
    }

    public void setKind(int kind) {
        this.kind = kind;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
