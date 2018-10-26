/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class OrganizationFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String name;
    private String code;
    private String address;
    private int status;
    private String phone;
    private String fax;
    private String bankAccount;
    private String tax;
    private String presenter;
    private String presenterPosition;

    private String[] organizationShellDetailId;
    private String[] shellId;

    public OrganizationFormBean() {
    }

    public OrganizationFormBean(OrganizationBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.address = bean.getAddress();
        this.status = bean.getStatus();
        this.phone = bean.getPhone();
        this.fax = bean.getFax();
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String[] getOrganizationShellDetailId() {
        return organizationShellDetailId;
    }

    public void setOrganizationShellDetailId(String[] organizationShellDetailId) {
        this.organizationShellDetailId = organizationShellDetailId;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

}
