/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class VendorBean {

    private int id;
    private String code;
    private int status;
    private String name;
    private int organizationId;
    private int equalOrganizationId;
    private int hasStock;

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

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEqualOrganizationId() {
        return equalOrganizationId;
    }

    public void setEqualOrganizationId(int equalOrganizationId) {
        this.equalOrganizationId = equalOrganizationId;
    }

    public int getHasStock() {
        return hasStock;
    }

    public void setHasStock(int hasStock) {
        this.hasStock = hasStock;
    }

}
