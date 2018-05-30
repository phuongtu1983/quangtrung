/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeadvance;

import com.stepup.gasoline.qt.bean.EmployeeAdvanceBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeAdvanceFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String advanceDate;
    private int employeeId;
    private String employeeName;
    private int paymentMode;
    private double amount;
    private int accountId;
    private String note;

    public EmployeeAdvanceFormBean() {
    }

    public EmployeeAdvanceFormBean(EmployeeAdvanceBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.advanceDate = bean.getAdvanceDate();
        this.employeeId = bean.getEmployeeId();
        this.paymentMode = bean.getPaymentMode();
        this.amount = bean.getAmount();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdvanceDate() {
        return advanceDate;
    }

    public void setAdvanceDate(String advanceDate) {
        this.advanceDate = advanceDate;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(int paymentMode) {
        this.paymentMode = paymentMode;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

}
