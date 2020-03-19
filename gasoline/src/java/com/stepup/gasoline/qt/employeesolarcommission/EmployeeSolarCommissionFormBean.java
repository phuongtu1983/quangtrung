package com.stepup.gasoline.qt.employeesolarcommission;

import com.stepup.gasoline.qt.bean.EmployeeSolarCommissionBean;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author phuongtu
 */
public class EmployeeSolarCommissionFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String note;
    private double amount;

    public EmployeeSolarCommissionFormBean() {
    }

    public EmployeeSolarCommissionFormBean(EmployeeSolarCommissionBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
        this.amount = bean.getAmount();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

}
