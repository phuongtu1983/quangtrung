/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class ContractBean {

    private int id;
    private String code;
    private String createdDate;
    private int customerId;
    private double shell12Price;
    private double shell45Price;
    private int creditDate;
    private double creditAmount;
    private String note;

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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public double getShell12Price() {
        return shell12Price;
    }

    public void setShell12Price(double shell12Price) {
        this.shell12Price = shell12Price;
    }

    public double getShell45Price() {
        return shell45Price;
    }

    public void setShell45Price(double shell45Price) {
        this.shell45Price = shell45Price;
    }

    public int getCreditDate() {
        return creditDate;
    }

    public void setCreditDate(int creditDate) {
        this.creditDate = creditDate;
    }

    public double getCreditAmount() {
        return creditAmount;
    }

    public void setCreditAmount(double creditAmount) {
        this.creditAmount = creditAmount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
