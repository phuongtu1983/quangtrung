/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.promotionmaterial;

/**
 *
 * @author phuongtu
 */
public class PromotionMaterialOpeningStockUploadBean {

    private int organizationId;
    private int promotionMaterialId;
    private double openingStock;

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public int getPromotionMaterialId() {
        return promotionMaterialId;
    }

    public void setPromotionMaterialId(int promotionMaterialId) {
        this.promotionMaterialId = promotionMaterialId;
    }

    public double getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(double openingStock) {
        this.openingStock = openingStock;
    }

}
