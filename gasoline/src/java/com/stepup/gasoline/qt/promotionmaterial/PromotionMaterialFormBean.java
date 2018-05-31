/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterial;

import com.stepup.gasoline.qt.bean.PromotionMaterialBean;

/**
 *
 * @author phuongtu
 */
public class PromotionMaterialFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int unitId;
    private String unitName;
    private int status;
    private String statusName;

    public PromotionMaterialFormBean() {
    }

    public PromotionMaterialFormBean(PromotionMaterialBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.unitId = bean.getUnitId();
        this.status = bean.getStatus();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

}
