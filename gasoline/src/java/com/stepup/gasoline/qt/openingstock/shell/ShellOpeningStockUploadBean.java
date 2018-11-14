/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.shell;

/**
 *
 * @author phuongtu
 */
public class ShellOpeningStockUploadBean {

    private int organizationId;
    private int shellId;
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

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

}
