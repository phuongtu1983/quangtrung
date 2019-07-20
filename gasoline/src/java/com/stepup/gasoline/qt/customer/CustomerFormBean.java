/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customer;

import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class CustomerFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String code;
    private int status;
    private String statusName;
    private String name;
//    private int kind;
//    private String kindName;
    private float commissionPercentage;
    private int organizationId;
    private String organizationName;
    private String address;
    private String phone;
    private String bankAccount;
    private String tax;
    private String presenter;
    private String presenterPosition;
    private String note;
//    private String discount;
    private int commissionKind;
    private String commissionKindName;
    private String[] customerDocumentId;
    private String[] documentId;
    private String[] customerDocumentExpiredDate;
    private boolean isGas;
    private boolean isPetro;
    private boolean isGood;
    private boolean isOil;

    public CustomerFormBean() {
    }

    public CustomerFormBean(CustomerBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.name = bean.getName();
        this.organizationId = bean.getOrganizationId();
//        this.kind = bean.getKind();
        this.address = bean.getAddress();
        this.phone = bean.getPhone();
        this.bankAccount = bean.getBankAccount();
        this.tax = bean.getTax();
        this.presenter = bean.getPresenter();
        this.presenterPosition = bean.getPresenterPosition();
        this.note = bean.getNote();
//        this.discount = bean.getDiscount();
        this.isGas = bean.getIsGas() == 1 ? true : false;
        this.isPetro = bean.getIsPetro() == 1 ? true : false;
        this.isGood = bean.getIsGood() == 1 ? true : false;
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

//    public int getKind() {
//        return kind;
//    }
//
//    public void setKind(int kind) {
//        this.kind = kind;
//    }
//
//    public String getKindName() {
//        return kindName;
//    }
//
//    public void setKindName(String kindName) {
//        this.kindName = kindName;
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

    public String[] getCustomerDocumentId() {
        return customerDocumentId;
    }

    public void setCustomerDocumentId(String[] customerDocumentId) {
        this.customerDocumentId = customerDocumentId;
    }

    public String[] getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String[] documentId) {
        this.documentId = documentId;
    }

    public String[] getCustomerDocumentExpiredDate() {
        return customerDocumentExpiredDate;
    }

    public void setCustomerDocumentExpiredDate(String[] customerDocumentExpiredDate) {
        this.customerDocumentExpiredDate = customerDocumentExpiredDate;
    }

//    public String getDiscount() {
//        return discount;
//    }
//
//    public void setDiscount(String discount) {
//        this.discount = discount;
//    }
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

    public String getCommissionKindName() {
        return commissionKindName;
    }

    public void setCommissionKindName(String commissionKindName) {
        this.commissionKindName = commissionKindName;
    }

    public boolean getIsOil() {
        return isOil;
    }

    public void setIsOil(boolean isOil) {
        this.isOil = isOil;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
