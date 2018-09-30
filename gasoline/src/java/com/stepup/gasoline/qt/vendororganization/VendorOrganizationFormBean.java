/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendororganization;

import com.stepup.gasoline.qt.bean.VendorOrganizationBean;

/**
 *
 * @author phuongtu
 */
public class VendorOrganizationFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int organizationId;
    private int vendorId;
    private String organizationName;
    private String vendorName;

    public VendorOrganizationFormBean() {
    }

    public VendorOrganizationFormBean(VendorOrganizationBean bean) {
        this.id = bean.getId();
        this.vendorId = bean.getVendorId();
        this.organizationId = bean.getOrganizationId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

}
