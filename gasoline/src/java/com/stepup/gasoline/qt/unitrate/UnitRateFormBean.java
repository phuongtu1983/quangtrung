package com.stepup.gasoline.qt.unitrate;

import com.stepup.gasoline.qt.bean.UnitRateBean;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author phuongtu
 */
public class UnitRateFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int baseUnitId;
    private String baseUnitName;
    private int parentUnitId;
    private String parentUnitName;
    private float rate;

    public UnitRateFormBean() {
    }

    public UnitRateFormBean(UnitRateBean bean) {
        this.id = bean.getId();
        this.baseUnitId = bean.getBaseUnitId();
        this.parentUnitId = bean.getParentUnitId();
        this.rate = bean.getRate();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBaseUnitId() {
        return baseUnitId;
    }

    public void setBaseUnitId(int baseUnitId) {
        this.baseUnitId = baseUnitId;
    }

    public String getBaseUnitName() {
        return baseUnitName;
    }

    public void setBaseUnitName(String baseUnitName) {
        this.baseUnitName = baseUnitName;
    }

    public int getParentUnitId() {
        return parentUnitId;
    }

    public void setParentUnitId(int parentUnitId) {
        this.parentUnitId = parentUnitId;
    }

    public String getParentUnitName() {
        return parentUnitName;
    }

    public void setParentUnitName(String parentUnitName) {
        this.parentUnitName = parentUnitName;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

}
