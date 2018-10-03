/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedasset;

import com.stepup.gasoline.qt.bean.FixedAssetBean;

/**
 *
 * @author phuongtu
 */
public class FixedAssetFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int groupId;
    private String groupName;
    private int unitId;
    private String unitName;
    private String startDate;
    private int quantity;
    private int rate;
    private int monthCount;
    private int status;
    private String statusName;
    private double price;

    public FixedAssetFormBean() {
    }

    public FixedAssetFormBean(FixedAssetBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.unitId = bean.getUnitId();
        this.groupId = bean.getGroupId();
        this.startDate = bean.getStartDate();
        this.quantity = bean.getQuantity();
        this.rate = bean.getRate();
        this.monthCount = bean.getMonthCount();
        this.status = bean.getStatus();
        this.price = bean.getPrice();
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

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getMonthCount() {
        return monthCount;
    }

    public void setMonthCount(int monthCount) {
        this.monthCount = monthCount;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
