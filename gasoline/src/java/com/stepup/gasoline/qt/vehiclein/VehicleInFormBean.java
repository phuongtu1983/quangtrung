/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehiclein;

import com.stepup.gasoline.qt.bean.VehicleInBean;

/**
 *
 * @author phuongtu
 */
public class VehicleInFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vehicleOutId;
    private String vehiclePlate;
    private String note;
    private int canEdit;

    private String[] vehicleInDetailId;
    private String[] shellId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] vehicleInReturnShellDetailId;
    private String[] returnShellId;
    private String[] returnShellQuantity;

    public VehicleInFormBean() {
        this.canEdit = 1;
    }

    public VehicleInFormBean(VehicleInBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vehicleOutId = bean.getVehicleOutId();
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

    public int getVehicleOutId() {
        return vehicleOutId;
    }

    public void setVehicleOutId(int vehicleOutId) {
        this.vehicleOutId = vehicleOutId;
    }

    public String[] getVehicleInDetailId() {
        return vehicleInDetailId;
    }

    public void setVehicleInDetailId(String[] vehicleInDetailId) {
        this.vehicleInDetailId = vehicleInDetailId;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

    public String[] getVehicleInReturnShellDetailId() {
        return vehicleInReturnShellDetailId;
    }

    public void setVehicleInReturnShellDetailId(String[] vehicleInReturnShellDetailId) {
        this.vehicleInReturnShellDetailId = vehicleInReturnShellDetailId;
    }

    public String[] getReturnShellId() {
        return returnShellId;
    }

    public void setReturnShellId(String[] returnShellId) {
        this.returnShellId = returnShellId;
    }

    public String[] getReturnShellQuantity() {
        return returnShellQuantity;
    }

    public void setReturnShellQuantity(String[] returnShellQuantity) {
        this.returnShellQuantity = returnShellQuantity;
    }

    public String getVehiclePlate() {
        return vehiclePlate;
    }

    public void setVehiclePlate(String vehiclePlate) {
        this.vehiclePlate = vehiclePlate;
    }

}
