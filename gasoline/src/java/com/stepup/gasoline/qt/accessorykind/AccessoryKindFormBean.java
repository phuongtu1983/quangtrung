/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessorykind;

import com.stepup.gasoline.qt.bean.AccessoryKindBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class AccessoryKindFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String name;
    private String note;
    private int status;
    private String statusName;
    private double commission;

    public AccessoryKindFormBean() {
    }

    public AccessoryKindFormBean(AccessoryKindBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
        this.status = bean.getStatus();
        this.commission = bean.getCommission();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
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

    public double getCommission() {
        return commission;
    }

    public void setCommission(double commission) {
        this.commission = commission;
    }

}
