/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor.oil;

import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;
import com.stepup.gasoline.qt.vendor.VendorFormBean;

/**
 *
 * @author phuongtu
 */
public class VendorOilFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String code;
    private String name;
    private float commissionOnImport;
    private double maxDebt;

    private String[] vendorOilStoreDetailId;
    private String[] storeId;

    public VendorOilFormBean() {
    }

    public VendorOilFormBean(VendorFormBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.name = bean.getName();
        this.commissionOnImport = bean.getCommissionOnImport();
        this.maxDebt = bean.getMaxDebt();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getCommissionOnImport() {
        return commissionOnImport;
    }

    public void setCommissionOnImport(float commissionOnImport) {
        this.commissionOnImport = commissionOnImport;
    }

    public double getMaxDebt() {
        return maxDebt;
    }

    public void setMaxDebt(double maxDebt) {
        this.maxDebt = maxDebt;
    }

    public String[] getVendorOilStoreDetailId() {
        return vendorOilStoreDetailId;
    }

    public void setVendorOilStoreDetailId(String[] vendorOilStoreDetailId) {
        this.vendorOilStoreDetailId = vendorOilStoreDetailId;
    }

    public String[] getStoreId() {
        return storeId;
    }

    public void setStoreId(String[] storeId) {
        this.storeId = storeId;
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

}