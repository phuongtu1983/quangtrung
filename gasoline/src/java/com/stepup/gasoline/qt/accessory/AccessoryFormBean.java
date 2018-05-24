/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessory;

import com.stepup.gasoline.qt.bean.AccessoryBean;

/**
 *
 * @author phuongtu
 */
public class AccessoryFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int kindId;
    private int unitId;
    private double price;
    private int status;
    private String statusName;

    public AccessoryFormBean() {
    }

    public AccessoryFormBean(AccessoryBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.kindId = bean.getKindId();
        this.unitId = bean.getUnitId();
        this.price = bean.getPrice();
        this.status = bean.getStatus();
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getKindId() {
        return kindId;
    }

    public void setKindId(int kindId) {
        this.kindId = kindId;
    }

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

}
