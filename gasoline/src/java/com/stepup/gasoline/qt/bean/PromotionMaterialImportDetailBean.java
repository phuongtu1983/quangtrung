/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class PromotionMaterialImportDetailBean {

    private int id;
    private int promotionMaterialImportId;
    private int promotionMaterialId;
    private String promotionMaterialName;
    private int unitId;
    private String unitName;
    private int quantity;
    private double price;
    private double amount;

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

    public int getPromotionMaterialImportId() {
        return promotionMaterialImportId;
    }

    public void setPromotionMaterialImportId(int promotionMaterialImportId) {
        this.promotionMaterialImportId = promotionMaterialImportId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

}
