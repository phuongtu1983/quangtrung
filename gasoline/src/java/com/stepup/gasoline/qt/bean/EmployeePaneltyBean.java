/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class EmployeePaneltyBean {

    private int id;
    private String code;
    private String createdDate;
    private int paneltyId;
    private int employeeId;
    private int createdEmployeeId;
    private double amount;
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

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getCreatedEmployeeId() {
        return createdEmployeeId;
    }

    public void setCreatedEmployeeId(int createdEmployeeId) {
        this.createdEmployeeId = createdEmployeeId;
    }

    public int getPaneltyId() {
        return paneltyId;
    }

    public void setPaneltyId(int paneltyId) {
        this.paneltyId = paneltyId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

}
