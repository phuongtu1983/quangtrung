/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class UnitRateBean {

    private int id;
    private int baseUnitId;
    private int parentUnitId;
    private float rate;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public int getBaseUnitId() {
        return baseUnitId;
    }

    public void setBaseUnitId(int baseUnitId) {
        this.baseUnitId = baseUnitId;
    }

    public int getParentUnitId() {
        return parentUnitId;
    }

    public void setParentUnitId(int parentUnitId) {
        this.parentUnitId = parentUnitId;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

}
