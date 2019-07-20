/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class CustomerBean {

    private int id;
    private String code;
    private int status;
    private String name;
    private int organizationId;
//    private int kind;
    private float commissionPercentage;
    private String address;
    private String phone;
    private String bankAccount;
    private String tax;
    private String presenter;
    private String presenterPosition;
    private String note;
//    private String discount;
    private int commissionKind;
    private int isGas;
    private int isPetro;
    private int isGood;
    private int isOil;

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

//    public int getKind() {
//        return kind;
//    }
//
//    public void setKind(int kind) {
//        this.kind = kind;
//    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public String getPresenter() {
        return presenter;
    }

    public void setPresenter(String presenter) {
        this.presenter = presenter;
    }

    public String getPresenterPosition() {
        return presenterPosition;
    }

    public void setPresenterPosition(String presenterPosition) {
        this.presenterPosition = presenterPosition;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

//    public String getDiscount() {
//        return discount;
//    }
//
//    public void setDiscount(String discount) {
//        this.discount = discount;
//    }
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

    public float getCommissionPercentage() {
        return commissionPercentage;
    }

    public void setCommissionPercentage(float commissionPercentage) {
        this.commissionPercentage = commissionPercentage;
    }

    public int getCommissionKind() {
        return commissionKind;
    }

    public void setCommissionKind(int commissionKind) {
        this.commissionKind = commissionKind;
    }

    public int getIsOil() {
        return isOil;
    }

    public void setIsOil(int isOil) {
        this.isOil = isOil;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public static int COMMISSION_KIND_BILL = 1;
    public static int COMMISSION_KIND_DIRECTLY = 2;
}
