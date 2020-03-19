/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

import com.stepup.gasoline.qt.bean.InvoiceSolarBean;

/**
 *
 * @author phuongtu
 */
public class InvoiceSolarFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String number;
    private String createdDate;
    private double amount;
    private double amountPaid;
    private String note;
    private int customerId;
    private String customerName;

    private String[] solarSaleDetailId;
    private String[] invoiceSolarDetailId;
    private String[] solarSaleDetailPaid;
    private String[] solarSalePaidDetailAmount;
    private String[] solarSaleDetailCommissioned;

    private String[] invoiceSolarPaidDetailId;
    private String[] paidAmount;
    private String[] paidDate;

    public InvoiceSolarFormBean() {
    }

    public InvoiceSolarFormBean(InvoiceSolarBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.number = bean.getNumber();
        this.createdDate = bean.getCreatedDate();
        this.amount = bean.getAmount();
        this.amountPaid = bean.getAmountPaid();
        this.note = bean.getNote();
        this.customerId = bean.getCustomerId();
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public String[] getSolarSaleDetailId() {
        return solarSaleDetailId;
    }

    public void setSolarSaleDetailId(String[] solarSaleDetailId) {
        this.solarSaleDetailId = solarSaleDetailId;
    }

    public String[] getInvoiceSolarDetailId() {
        return invoiceSolarDetailId;
    }

    public void setInvoiceSolarDetailId(String[] invoiceSolarDetailId) {
        this.invoiceSolarDetailId = invoiceSolarDetailId;
    }

    public String[] getInvoiceSolarPaidDetailId() {
        return invoiceSolarPaidDetailId;
    }

    public void setInvoiceSolarPaidDetailId(String[] invoiceSolarPaidDetailId) {
        this.invoiceSolarPaidDetailId = invoiceSolarPaidDetailId;
    }

    public String[] getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(String[] paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String[] getSolarSaleDetailPaid() {
        return solarSaleDetailPaid;
    }

    public void setSolarSaleDetailPaid(String[] solarSaleDetailPaid) {
        this.solarSaleDetailPaid = solarSaleDetailPaid;
    }

    public String[] getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(String[] paidDate) {
        this.paidDate = paidDate;
    }

    public String[] getSolarSaleDetailCommissioned() {
        return solarSaleDetailCommissioned;
    }

    public void setSolarSaleDetailCommissioned(String[] solarSaleDetailCommissioned) {
        this.solarSaleDetailCommissioned = solarSaleDetailCommissioned;
    }

    public String[] getSolarSalePaidDetailAmount() {
        return solarSalePaidDetailAmount;
    }

    public void setSolarSalePaidDetailAmount(String[] solarSalePaidDetailAmount) {
        this.solarSalePaidDetailAmount = solarSalePaidDetailAmount;
    }

}
