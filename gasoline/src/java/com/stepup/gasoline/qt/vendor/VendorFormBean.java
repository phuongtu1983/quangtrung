/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class VendorFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String code;
    private int status;
    private String statusName;
    private String name;
    private int organizationId;
    private int equalOrganizationId;
    private String organizationName;

    public VendorFormBean() {
    }

    public VendorFormBean(VendorBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.name = bean.getName();
        this.organizationId = bean.getOrganizationId();
        this.equalOrganizationId = bean.getEqualOrganizationId();
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

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
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

}
