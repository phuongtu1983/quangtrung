/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoice;

import com.stepup.gasoline.qt.bean.InvoiceBean;

/**
 *
 * @author phuongtu
 */
public class InvoiceFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String number;
    private String createdDate;
    private double amount;
    private double amountPaid;
    private String note;
    private int customerId;
    private String customerName;

    private String[] oilSaleDetailId;
    private String[] invoiceDetailId;
    private String[] oilSaleDetailPaid;

    private String[] invoicePaidDetailId;
    private String[] paidAmount;
    private String[] paidDate;

    public InvoiceFormBean() {
    }

    public InvoiceFormBean(InvoiceBean bean) {
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

    public String[] getOilSaleDetailId() {
        return oilSaleDetailId;
    }

    public void setOilSaleDetailId(String[] oilSaleDetailId) {
        this.oilSaleDetailId = oilSaleDetailId;
    }

    public String[] getInvoiceDetailId() {
        return invoiceDetailId;
    }

    public void setInvoiceDetailId(String[] invoiceDetailId) {
        this.invoiceDetailId = invoiceDetailId;
    }

    public String[] getInvoicePaidDetailId() {
        return invoicePaidDetailId;
    }

    public void setInvoicePaidDetailId(String[] invoicePaidDetailId) {
        this.invoicePaidDetailId = invoicePaidDetailId;
    }

    public String[] getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(String[] paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String[] getOilSaleDetailPaid() {
        return oilSaleDetailPaid;
    }

    public void setOilSaleDetailPaid(String[] oilSaleDetailPaid) {
        this.oilSaleDetailPaid = oilSaleDetailPaid;
    }

    public String[] getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(String[] paidDate) {
        this.paidDate = paidDate;
    }

}
