/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class FixedAssetDepreciationDetailBean {

    private int id;
    private int fixedAssetDepreciationId;
    private int fixedAssetId;
    private String fixedAssetName;
    private int unitId;
    private String unitName;
    private int quantity;
    private double price;
    private int isCalculate;

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public int getFixedAssetDepreciationId() {
        return fixedAssetDepreciationId;
    }

    public void setFixedAssetDepreciationId(int fixedAssetDepreciationId) {
        this.fixedAssetDepreciationId = fixedAssetDepreciationId;
    }

    public int getFixedAssetId() {
        return fixedAssetId;
    }

    public void setFixedAssetId(int fixedAssetId) {
        this.fixedAssetId = fixedAssetId;
    }

    public String getFixedAssetName() {
        return fixedAssetName;
    }

    public void setFixedAssetName(String fixedAssetName) {
        this.fixedAssetName = fixedAssetName;
    }

    public int getIsCalculate() {
        return isCalculate;
    }

    public void setIsCalculate(int isCalculate) {
        this.isCalculate = isCalculate;
    }

}
