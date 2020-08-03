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
    private String code;
    private String note;

    private String[] employeeSolarCommissionCommissionDetailId;
    private String[] employeeSolarCommissionCommissionFrom;
    private String[] employeeSolarCommissionCommissionTo;
    private String[] employeeSolarCommissionCommissionCommission;

    public EmployeeSolarCommissionFormBean() {
    }

    public EmployeeSolarCommissionFormBean(EmployeeSolarCommissionBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.note = bean.getNote();
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String[] getEmployeeSolarCommissionCommissionDetailId() {
        return employeeSolarCommissionCommissionDetailId;
    }

    public void setEmployeeSolarCommissionCommissionDetailId(String[] employeeSolarCommissionCommissionDetailId) {
        this.employeeSolarCommissionCommissionDetailId = employeeSolarCommissionCommissionDetailId;
    }

    public String[] getEmployeeSolarCommissionCommissionFrom() {
        return employeeSolarCommissionCommissionFrom;
    }

    public void setEmployeeSolarCommissionCommissionFrom(String[] employeeSolarCommissionCommissionFrom) {
        this.employeeSolarCommissionCommissionFrom = employeeSolarCommissionCommissionFrom;
    }

    public String[] getEmployeeSolarCommissionCommissionTo() {
        return employeeSolarCommissionCommissionTo;
    }

    public void setEmployeeSolarCommissionCommissionTo(String[] employeeSolarCommissionCommissionTo) {
        this.employeeSolarCommissionCommissionTo = employeeSolarCommissionCommissionTo;
    }

    public String[] getEmployeeSolarCommissionCommissionCommission() {
        return employeeSolarCommissionCommissionCommission;
    }

    public void setEmployeeSolarCommissionCommissionCommission(String[] employeeSolarCommissionCommissionCommission) {
        this.employeeSolarCommissionCommissionCommission = employeeSolarCommissionCommissionCommission;
    }

}
