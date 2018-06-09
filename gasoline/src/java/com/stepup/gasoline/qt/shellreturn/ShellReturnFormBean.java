/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturn;

import com.stepup.gasoline.qt.bean.ShellReturnBean;

/**
 *
 * @author phuongtu
 */
public class ShellReturnFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vehicleId;
    private int customerId;
    private String customerName;
    private String note;
    private int canEdit;
    private String[] shellReturnDetailId;
    private String[] shellId;
    private String[] quantity;

    public ShellReturnFormBean() {
        this.canEdit = 1;
    }

    public ShellReturnFormBean(ShellReturnBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.customerId = bean.getCustomerId();
        this.vehicleId = bean.getVehicleId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
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

    public String[] getQuantity() {
        return quantity;
    }

    public void setQuantity(String[] quantity) {
        this.quantity = quantity;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String[] getShellReturnDetailId() {
        return shellReturnDetailId;
    }

    public void setShellReturnDetailId(String[] shellReturnDetailId) {
        this.shellReturnDetailId = shellReturnDetailId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

}
