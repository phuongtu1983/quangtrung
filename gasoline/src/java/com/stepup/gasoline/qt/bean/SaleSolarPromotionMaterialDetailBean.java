/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SaleSolarPromotionMaterialDetailBean {

    private int id;
    private int saleSolarId;
    private int promotionMaterialId;
    private String promotionMaterialName;
    private int promotionMaterialUnitId;
    private int promotionMaterialStoreId;
    private String promotionMaterialUnitName;
    private String promotionMaterialStoreName;
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSaleSolarId() {
        return saleSolarId;
    }

    public void setSaleSolarId(int saleSolarId) {
        this.saleSolarId = saleSolarId;
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

    public int getPromotionMaterialUnitId() {
        return promotionMaterialUnitId;
    }

    public void setPromotionMaterialUnitId(int promotionMaterialUnitId) {
        this.promotionMaterialUnitId = promotionMaterialUnitId;
    }

    public int getPromotionMaterialStoreId() {
        return promotionMaterialStoreId;
    }

    public void setPromotionMaterialStoreId(int promotionMaterialStoreId) {
        this.promotionMaterialStoreId = promotionMaterialStoreId;
    }

    public String getPromotionMaterialUnitName() {
        return promotionMaterialUnitName;
    }

    public void setPromotionMaterialUnitName(String promotionMaterialUnitName) {
        this.promotionMaterialUnitName = promotionMaterialUnitName;
    }

    public String getPromotionMaterialStoreName() {
        return promotionMaterialStoreName;
    }

    public void setPromotionMaterialStoreName(String promotionMaterialStoreName) {
        this.promotionMaterialStoreName = promotionMaterialStoreName;
    }

}
