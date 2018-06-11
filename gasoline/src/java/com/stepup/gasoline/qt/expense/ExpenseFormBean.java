/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.expense;

import com.stepup.gasoline.qt.bean.ExpenseBean;

/**
 *
 * @author phuongtu
 */
public class ExpenseFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private String fromDate;
    private String toDate;
    private double amount;
    private int accountId;
    private String note;
    private String content;
    private boolean isUsually;
    private int canEdit;

    public ExpenseFormBean() {
    }

    public ExpenseFormBean(ExpenseBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.fromDate = bean.getFromDate();
        this.toDate = bean.getToDate();
        this.amount = bean.getAmount();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.content = bean.getContent();
        this.isUsually = bean.getIsUsually() == 1 ? true : false;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public boolean getIsUsually() {
        return isUsually;
    }

    public void setIsUsually(boolean isUsually) {
        this.isUsually = isUsually;
    }

}
