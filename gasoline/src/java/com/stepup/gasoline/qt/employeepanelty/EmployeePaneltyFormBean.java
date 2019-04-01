/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeepanelty;

import com.stepup.gasoline.qt.bean.EmployeePaneltyBean;

/**
 *
 * @author phuongtu
 */
public class EmployeePaneltyFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int paneltyId;
    private int employeeId;
    private String employeeName;
    private double amount;
    private String note;

    public EmployeePaneltyFormBean() {
    }

    public EmployeePaneltyFormBean(EmployeePaneltyBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.paneltyId = bean.getPaneltyId();
        this.employeeId = bean.getEmployeeId();
        this.amount = bean.getAmount();
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
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
