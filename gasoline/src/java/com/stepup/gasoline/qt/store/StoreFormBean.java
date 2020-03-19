/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.store;

import com.stepup.gasoline.qt.bean.StoreBean;

/**
 *
 * @author phuongtu
 */
public class StoreFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private int status;
    private String statusName;
    private int organizationId;
    private String organizationName;
    private boolean isPetro;
    private boolean isGood;
    private boolean isOil;
    private boolean isSolar;

    public StoreFormBean() {
    }

    public StoreFormBean(StoreBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.organizationId = bean.getOrganizationId();
        this.isPetro = bean.getIsPetro() == 1 ? true : false;
        this.isGood = bean.getIsGood() == 1 ? true : false;
        this.isGood = bean.getIsOil() == 1 ? true : false;
        this.isSolar = bean.getIsSolar() == 1 ? true : false;
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

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

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

    public boolean getIsPetro() {
        return isPetro;
    }

    public void setIsPetro(boolean isPetro) {
        this.isPetro = isPetro;
    }

    public boolean getIsGood() {
        return isGood;
    }

    public void setIsGood(boolean isGood) {
        this.isGood = isGood;
    }

    public boolean getIsOil() {
        return isOil;
    }

    public void setIsOil(boolean isOil) {
        this.isOil = isOil;
    }

    public boolean getIsSolar() {
        return isSolar;
    }

    public void setIsSolar(boolean isSolar) {
        this.isSolar = isSolar;
    }

}
