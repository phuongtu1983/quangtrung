/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.vendor;

/**
 *
 * @author Administrator
 */
public class VendorOpeningStockBean {

    private int organizationId;
    private String organizationName;
    private int vendorId;
    private String vendorName;
    private int openingStock;
    private int openingStockTransport;

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

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

    public int getOpeningStockTransport() {
        return openingStockTransport;
    }

    public void setOpeningStockTransport(int openingStockTransport) {
        this.openingStockTransport = openingStockTransport;
    }

}
