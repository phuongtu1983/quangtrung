/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeetimesheet;

import com.stepup.gasoline.qt.bean.EmployeeTimesheetBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeTimesheetFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String timesheetDate;
    private int employeeId;
    private String employeeName;
    private int fieldId;
    private String fieldName;
    private int quantity;
    private String note;

    public EmployeeTimesheetFormBean() {
    }

    public EmployeeTimesheetFormBean(EmployeeTimesheetBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.timesheetDate = bean.getTimesheetDate();
        this.employeeId = bean.getEmployeeId();
        this.fieldId = bean.getFieldId();
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

    public String getTimesheetDate() {
        return timesheetDate;
    }

    public void setTimesheetDate(String timesheetDate) {
        this.timesheetDate = timesheetDate;
    }

    public int getFieldId() {
        return fieldId;
    }

    public void setFieldId(int fieldId) {
        this.fieldId = fieldId;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
