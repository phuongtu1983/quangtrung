/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.good;

import com.stepup.gasoline.qt.bean.GoodBean;

/**
 *
 * @author phuongtu
 */
public class GoodFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String name;
    private int organizationId;
    private String organizationName;
    private int unitId;
    private String unitName;
    private double price;
    private int status;
    private String statusName;

    public GoodFormBean() {
    }

    public GoodFormBean(GoodBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.name = bean.getName();
        this.organizationId = bean.getOrganizationId();
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
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

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

}
