/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.contract;

import com.stepup.gasoline.qt.bean.ContractBean;

/**
 *
 * @author phuongtu
 */
public class ContractFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int customerId;
    private String customerName;
    private double creditAmount;
    private double shell12Price;
    private double shell45Price;
    private int creditDate;
    private String note;

    public ContractFormBean() {
    }

    public ContractFormBean(ContractBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.customerId = bean.getCustomerId();
        this.creditAmount = bean.getCreditAmount();
        this.creditDate = bean.getCreditDate();
        this.shell12Price = bean.getShell12Price();
        this.shell45Price = bean.getShell45Price();
        this.note = bean.getNote();
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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getCreditAmount() {
        return creditAmount;
    }

    public void setCreditAmount(double creditAmount) {
        this.creditAmount = creditAmount;
    }

    public double getShell12Price() {
        return shell12Price;
    }

    public void setShell12Price(double shell12Price) {
        this.shell12Price = shell12Price;
    }

    public double getShell45Price() {
        return shell45Price;
    }

    public void setShell45Price(double shell45Price) {
        this.shell45Price = shell45Price;
    }

    public int getCreditDate() {
        return creditDate;
    }

    public void setCreditDate(int creditDate) {
        this.creditDate = creditDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
