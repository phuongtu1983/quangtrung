/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.account;

import com.stepup.gasoline.qt.bean.AccountBean;

/**
 *
 * @author phuongtu
 */
public class AccountFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String number;
    private String holder;
    private String bank;
    private String branch;
    private String note;
    private int organizationId;
    private String organizationName;

    public AccountFormBean() {
    }

    public AccountFormBean(AccountBean bean) {
        this.id = bean.getId();
        this.number = bean.getNumber();
        this.holder = bean.getHolder();
        this.bank = bean.getBank();
        this.branch = bean.getBranch();
        this.note = bean.getNote();
        this.organizationId = bean.getOrganizationId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getHolder() {
        return holder;
    }

    public void setHolder(String holder) {
        this.holder = holder;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
