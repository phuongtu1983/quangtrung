/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vendor;

import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class VendorFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String code;
    private int status;
    private String statusName;
    private String name;
    private String address;
    private String tax;
    private String phone;
    private String fax;
    private int organizationId;
    private int equalOrganizationId;
    private String organizationName;
    private boolean hasStock;
    private boolean isGas;
    private boolean isPetro;
    private boolean isGood;
    private boolean isTransport;
    private boolean isOil;
    private float commissionOnImport;

    public VendorFormBean() {
    }

    public VendorFormBean(VendorBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.name = bean.getName();
        this.address = bean.getAddress();
        this.tax = bean.getTax();
        this.phone = bean.getPhone();
        this.fax = bean.getFax();
        this.organizationId = bean.getOrganizationId();
        this.equalOrganizationId = bean.getEqualOrganizationId();
        this.commissionOnImport = bean.getCommissionOnImport();
        this.hasStock = bean.getHasStock() == 1 ? true : false;
        this.isGas = bean.getIsGas() == 1 ? true : false;
        this.isPetro = bean.getIsPetro() == 1 ? true : false;
        this.isGood = bean.getIsGood() == 1 ? true : false;
        this.isTransport = bean.getIsTransport() == 1 ? true : false;
        this.isOil = bean.getIsOil() == 1 ? true : false;
    }

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

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
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

    public boolean getHasStock() {
        return hasStock;
    }

    public void setHasStock(boolean hasStock) {
        this.hasStock = hasStock;
    }

    public boolean getIsGas() {
        return isGas;
    }

    public void setIsGas(boolean isGas) {
        this.isGas = isGas;
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

    public boolean getIsTransport() {
        return isTransport;
    }

    public void setIsTransport(boolean isTransport) {
        this.isTransport = isTransport;
    }

    public boolean getIsOil() {
        return isOil;
    }

    public void setIsOil(boolean isOil) {
        this.isOil = isOil;
    }

    public float getCommissionOnImport() {
        return commissionOnImport;
    }

    public void setCommissionOnImport(float commissionOnImport) {
        this.commissionOnImport = commissionOnImport;
    }

}
