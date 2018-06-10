/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturnsupplier;

import com.stepup.gasoline.qt.bean.ShellReturnSupplierBean;

/**
 *
 * @author phuongtu
 */
public class ShellReturnSupplierFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vehicleId;
    private int vendorId;
    private String vendorName;
    private String note;
    private int canEdit;
    private String[] shellReturnSupplierDetailId;
    private String[] shellId;
    private String[] quantity;

    public ShellReturnSupplierFormBean() {
        this.canEdit = 1;
    }

    public ShellReturnSupplierFormBean(ShellReturnSupplierBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vendorId = bean.getVendorId();
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

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String[] getShellReturnSupplierDetailId() {
        return shellReturnSupplierDetailId;
    }

    public void setShellReturnSupplierDetailId(String[] shellReturnSupplierDetailId) {
        this.shellReturnSupplierDetailId = shellReturnSupplierDetailId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

}
