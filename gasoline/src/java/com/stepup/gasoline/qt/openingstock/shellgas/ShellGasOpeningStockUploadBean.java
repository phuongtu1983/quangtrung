/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.shellgas;

/**
 *
 * @author phuongtu
 */
public class ShellGasOpeningStockUploadBean {

    private int organizationId;
    private int shellId;
    private int vendorId;
    private double openingStock;

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public int getShellId() {
        return shellId;
    }

    public void setShellId(int shellId) {
        this.shellId = shellId;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

}
