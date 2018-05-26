/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoff;

import com.stepup.gasoline.qt.bean.EmployeeOffBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeOffFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int employeeId;
    private String employeeName;
    private String fromDate;
    private String toDate;
    private String note;

    public EmployeeOffFormBean() {
    }

    public EmployeeOffFormBean(EmployeeOffBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.employeeId = bean.getEmployeeId();
        this.fromDate = bean.getFromDate();
        this.toDate = bean.getToDate();
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

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

}
