/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.bean.GasReturnVendorBean;

/**
 *
 * @author phuongtu
 */
public class GasReturnVendorFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int vendorId;

    public GasReturnVendorFormBean() {
    }

    public GasReturnVendorFormBean(GasReturnVendorBean bean) {
        this.id = bean.getId();
        this.vendorId = bean.getVendorId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

}
