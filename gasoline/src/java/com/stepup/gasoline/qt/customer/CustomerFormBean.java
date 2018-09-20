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
    private int kind;
    private String kindName;
    private int organizationId;
    private String organizationName;
    private String address;
    private String phone;
    private String bankAccount;
    private String tax;
    private String presenter;
    private String presenterPosition;

    public CustomerFormBean() {
    }

    public CustomerFormBean(CustomerBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.status = bean.getStatus();
        this.name = bean.getName();
        this.organizationId = bean.getOrganizationId();
        this.kind = bean.getKind();
        this.address = bean.getAddress();
        this.phone = bean.getPhone();
        this.bankAccount = bean.getBankAccount();
        this.tax = bean.getTax();
        this.presenter = bean.getPresenter();
        this.presenterPosition = bean.getPresenterPosition();
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

    public int getKind() {
        return kind;
    }

    public void setKind(int kind) {
        this.kind = kind;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }

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

}
