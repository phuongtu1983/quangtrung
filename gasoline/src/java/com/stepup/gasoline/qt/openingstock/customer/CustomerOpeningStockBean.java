/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.customer;

/**
 *
 * @author Administrator
 */
public class CustomerOpeningStockBean {

    private int organizationId;
    private String organizationName;
    private int customerId;
    private String customerName;
    private double openingStock;
    private int openingStock12;
    private int openingStock45;

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

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

    public int getOpeningStock12() {
        return openingStock12;
    }

    public void setOpeningStock12(int openingStock12) {
        this.openingStock12 = openingStock12;
    }

    public int getOpeningStock45() {
        return openingStock45;
    }

    public void setOpeningStock45(int openingStock45) {
        this.openingStock45 = openingStock45;
    }

}
