/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.store;

import com.stepup.gasoline.qt.bean.StoreBean;

/**
 *
 * @author phuongtu
 */
public class StoreFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private int status;
    private String statusName;
    private int organizationId;
    private String organizationName;

    public StoreFormBean() {
    }

    public StoreFormBean(StoreBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.organizationId = bean.getOrganizationId();
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

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
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

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

}
