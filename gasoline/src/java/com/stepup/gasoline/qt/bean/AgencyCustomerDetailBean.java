/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class AgencyCustomerDetailBean {

    private int id;
    private int agencyId;
    private int customerId;
    private String customerName;
    private float commissionFrom;
    private float commissionTo;
    private float commission;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(int agencyId) {
        this.agencyId = agencyId;
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

    public float getCommissionFrom() {
        return commissionFrom;
    }

    public void setCommissionFrom(float commissionFrom) {
        this.commissionFrom = commissionFrom;
    }

    public float getCommissionTo() {
        return commissionTo;
    }

    public void setCommissionTo(float commissionTo) {
        this.commissionTo = commissionTo;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

}
