/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.solar;


/**
 *
 * @author Administrator
 */
public class SolarOpeningStockBean {

    private int organizationId;
    private String organizationName;
    private int solarId;
    private String solarCode;
    private String solarName;
    private int storeId;
    private String storeName;
    private int openingStock;

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

    public int getSolarId() {
        return solarId;
    }

    public void setSolarId(int solarId) {
        this.solarId = solarId;
    }

    public String getSolarName() {
        return solarName;
    }

    public void setSolarName(String solarName) {
        this.solarName = solarName;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

    public String getSolarCode() {
        return solarCode;
    }

    public void setSolarCode(String solarCode) {
        this.solarCode = solarCode;
    }

}
