/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class StoreBean {

    private int id;
    private String name;
    private String code;
    private int status;
    private int organizationId;
    private int isPetro;
    private int isGood;
    private int isOil;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
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

    public int getIsPetro() {
        return isPetro;
    }

    public void setIsPetro(int isPetro) {
        this.isPetro = isPetro;
    }

    public int getIsGood() {
        return isGood;
    }

    public void setIsGood(int isGood) {
        this.isGood = isGood;
    }

    public int getIsOil() {
        return isOil;
    }

    public void setIsOil(int isOil) {
        this.isOil = isOil;
    }

}
