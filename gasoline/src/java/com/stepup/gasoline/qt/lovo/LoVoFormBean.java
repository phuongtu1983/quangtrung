/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lovo;

import com.stepup.gasoline.qt.bean.LoVoBean;

/**
 *
 * @author phuongtu
 */
public class LoVoFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int quantity;
    private String note;

    private String[] loVoEmployeeDetailId;
    private String[] employeeId;
    private String[] employeeNote;

    public LoVoFormBean() {
    }

    public LoVoFormBean(LoVoBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.note = bean.getNote();
        this.quantity = bean.getQuantity();
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String[] getLoVoEmployeeDetailId() {
        return loVoEmployeeDetailId;
    }

    public void setLoVoEmployeeDetailId(String[] loVoEmployeeDetailId) {
        this.loVoEmployeeDetailId = loVoEmployeeDetailId;
    }

    public String[] getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String[] employeeId) {
        this.employeeId = employeeId;
    }

    public String[] getEmployeeNote() {
        return employeeNote;
    }

    public void setEmployeeNote(String[] employeeNote) {
        this.employeeNote = employeeNote;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
