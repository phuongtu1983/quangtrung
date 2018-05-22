/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.gasoline.qt.bean.OrganizationBean;

/**
 *
 * @author phuongtu
 */
public class OrganizationFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private String address;
    private int status;

    public OrganizationFormBean() {
    }

    public OrganizationFormBean(OrganizationBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.address = bean.getAddress();
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
