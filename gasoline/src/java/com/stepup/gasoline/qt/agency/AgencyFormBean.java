/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.agency;

import com.stepup.gasoline.qt.bean.AgencyBean;

/**
 *
 * @author phuongtu
 */
public class AgencyFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int status;
    private String statusName;

    private String[] agencyCustomerDetailId;
    private String[] customerId;
    private String[] agencyCustomerCommissionFrom;
    private String[] agencyCustomerCommissionTo;
    private String[] agencyCustomerCommission;

    public AgencyFormBean() {
    }

    public AgencyFormBean(AgencyBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.phone = bean.getPhone();
        this.address = bean.getAddress();
        this.note = bean.getNote();
        this.status = bean.getStatus();
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

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String[] getAgencyCustomerDetailId() {
        return agencyCustomerDetailId;
    }

    public void setAgencyCustomerDetailId(String[] agencyCustomerDetailId) {
        this.agencyCustomerDetailId = agencyCustomerDetailId;
    }

    public String[] getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String[] customerId) {
        this.customerId = customerId;
    }

    public String[] getAgencyCustomerCommissionFrom() {
        return agencyCustomerCommissionFrom;
    }

    public void setAgencyCustomerCommissionFrom(String[] agencyCustomerCommissionFrom) {
        this.agencyCustomerCommissionFrom = agencyCustomerCommissionFrom;
    }

    public String[] getAgencyCustomerCommissionTo() {
        return agencyCustomerCommissionTo;
    }

    public void setAgencyCustomerCommissionTo(String[] agencyCustomerCommissionTo) {
        this.agencyCustomerCommissionTo = agencyCustomerCommissionTo;
    }

    public String[] getAgencyCustomerCommission() {
        return agencyCustomerCommission;
    }

    public void setAgencyCustomerCommission(String[] agencyCustomerCommission) {
        this.agencyCustomerCommission = agencyCustomerCommission;
    }

}
