/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class VendorBean {

    private int id;
    private String code;
    private int status;
    private String name;
    private String address;
    private String tax;
    private String phone;
    private String fax;
    private int organizationId;
    private int equalOrganizationId;
    private int hasStock;
    private int isGas;
    private int isPetro;
    private int isGood;
    private int isTransport;
    private int isOil;
    private float commissionOnImport;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEqualOrganizationId() {
        return equalOrganizationId;
    }

    public void setEqualOrganizationId(int equalOrganizationId) {
        this.equalOrganizationId = equalOrganizationId;
    }

    public int getHasStock() {
        return hasStock;
    }

    public void setHasStock(int hasStock) {
        this.hasStock = hasStock;
    }

    public int getIsGas() {
        return isGas;
    }

    public void setIsGas(int isGas) {
        this.isGas = isGas;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public int getIsTransport() {
        return isTransport;
    }

    public void setIsTransport(int isTransport) {
        this.isTransport = isTransport;
    }

    public int getIsOil() {
        return isOil;
    }

    public void setIsOil(int isOil) {
        this.isOil = isOil;
    }

    public float getCommissionOnImport() {
        return commissionOnImport;
    }

    public void setCommissionOnImport(float commissionOnImport) {
        this.commissionOnImport = commissionOnImport;
    }

    public static final int IS_GAS = 1;
    public static final int IS_PETRO = 2;
    public static final int IS_GOOD = 3;
    public static final int IS_TRANSPORT = 4;
    public static final int IS_OIL = 5;
}
