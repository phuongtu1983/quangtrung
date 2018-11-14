/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.petro;

/**
 *
 * @author Administrator
 */
public class PetroOpeningStockBean {

    private int organizationId;
    private String organizationName;
    private int petroId;
    private String petroName;
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

    public int getPetroId() {
        return petroId;
    }

    public void setPetroId(int petroId) {
        this.petroId = petroId;
    }

    public String getPetroName() {
        return petroName;
    }

    public void setPetroName(String petroName) {
        this.petroName = petroName;
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

}
