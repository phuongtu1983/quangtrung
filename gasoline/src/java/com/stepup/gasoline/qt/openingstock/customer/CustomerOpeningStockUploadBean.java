/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.customer;

/**
 *
 * @author phuongtu
 */
public class CustomerOpeningStockUploadBean {

    private int customerId;
    private double openingStock;
    private int openingStock12;
    private int openingStock45;

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
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
