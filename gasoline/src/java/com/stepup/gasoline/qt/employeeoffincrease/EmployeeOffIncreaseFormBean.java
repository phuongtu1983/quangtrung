/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeoffincrease;

import com.stepup.gasoline.qt.bean.EmployeeOffIncreaseBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeOffIncreaseFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int dayoffId;
    private int employeeId;
    private String employeeName;
    private int quantity;
    private String note;

    public EmployeeOffIncreaseFormBean() {
    }

    public EmployeeOffIncreaseFormBean(EmployeeOffIncreaseBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.dayoffId = bean.getDayoffId();
        this.employeeId = bean.getEmployeeId();
        this.quantity = bean.getQuantity();
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDayoffId() {
        return dayoffId;
    }

    public void setDayoffId(int dayoffId) {
        this.dayoffId = dayoffId;
    }

}
