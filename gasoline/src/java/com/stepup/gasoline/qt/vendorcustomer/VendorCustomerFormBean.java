/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendorcustomer;

import com.stepup.gasoline.qt.bean.VendorCustomerBean;

/**
 *
 * @author phuongtu
 */
public class VendorCustomerFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int organizationId;
    private int vendorId;
    private String vendorName;
    private int customerId;
    private String customerName;

    public VendorCustomerFormBean() {
    }

    public VendorCustomerFormBean(VendorCustomerBean bean) {
        this.id = bean.getId();
        this.vendorId = bean.getVendorId();
        this.organizationId = bean.getOrganizationId();
        this.customerId = bean.getCustomerId();
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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

}
