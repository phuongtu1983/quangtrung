/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.promotionmaterial;

/**
 *
 * @author Administrator
 */
public class PromotionMaterialOpeningStockBean {

    private int organizationId;
    private String organizationName;
    private int promotionMaterialId;
    private String promotionMaterialName;
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

    public int getPromotionMaterialId() {
        return promotionMaterialId;
    }

    public void setPromotionMaterialId(int promotionMaterialId) {
        this.promotionMaterialId = promotionMaterialId;
    }

    public String getPromotionMaterialName() {
        return promotionMaterialName;
    }

    public void setPromotionMaterialName(String promotionMaterialName) {
        this.promotionMaterialName = promotionMaterialName;
    }

    public int getOpeningStock() {
        return openingStock;
    }

    public void setOpeningStock(int openingStock) {
        this.openingStock = openingStock;
    }

}
