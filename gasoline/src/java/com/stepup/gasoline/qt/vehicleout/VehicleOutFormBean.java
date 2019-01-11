/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicleout;

import com.stepup.gasoline.qt.bean.VehicleOutBean;

/**
 *
 * @author phuongtu
 */
public class VehicleOutFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vehicleId;
    private String vehiclePlate;
    private String note;
    private int canEdit;

    private String[] vehicleOutDetailId;
    private String[] shellId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] vehicleOutEmployeeDetailId;
    private String[] employeeId;
    private String[] employeeNote;

    public VehicleOutFormBean() {
        this.canEdit = 1;
    }

    public VehicleOutFormBean(VehicleOutBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vehicleId = bean.getVehicleId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.vehiclePlate = bean.getVehiclePlate();
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

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public String[] getPrice() {
        return price;
    }

    public void setPrice(String[] price) {
        this.price = price;
    }

    public String[] getAmount() {
        return amount;
    }

    public void setAmount(String[] amount) {
        this.amount = amount;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String[] getVehicleOutDetailId() {
        return vehicleOutDetailId;
    }

    public void setVehicleOutDetailId(String[] vehicleOutDetailId) {
        this.vehicleOutDetailId = vehicleOutDetailId;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

    public String[] getVehicleOutEmployeeDetailId() {
        return vehicleOutEmployeeDetailId;
    }

    public void setVehicleOutEmployeeDetailId(String[] vehicleOutEmployeeDetailId) {
        this.vehicleOutEmployeeDetailId = vehicleOutEmployeeDetailId;
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

    public String getVehiclePlate() {
        return vehiclePlate;
    }

    public void setVehiclePlate(String vehiclePlate) {
        this.vehiclePlate = vehiclePlate;
    }

}
