/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.exportwholesale;

import com.stepup.gasoline.qt.bean.ExportWholesaleBean;

/**
 *
 * @author phuongtu
 */
public class ExportWholesaleFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int customerId;
    private String customerName;
    private double total;
    private double paid;
    private double debt;
    private double discount;
    private double totalPay;
    private int accountId;
    private String note;
    private int canEdit;
    private String[] exportWholesaleDetailId;
    private String[] shellId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] exportWholesaleReturnShellDetailId;
    private String[] returnShellId;
    private String[] returnShellQuantity;

    public ExportWholesaleFormBean() {
        this.canEdit = 1;
    }

    public ExportWholesaleFormBean(ExportWholesaleBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.customerId = bean.getCustomerId();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.discount = bean.getDiscount();
        this.totalPay = bean.getTotalPay();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String[] getQuantity() {
        return quantity;
    }

    public void setQuantity(String[] quantity) {
        this.quantity = quantity;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getPaid() {
        return paid;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public double getDebt() {
        return debt;
    }

    public void setDebt(double debt) {
        this.debt = debt;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String[] getPrice() {
        return price;
    }

    public void setPrice(String[] price) {
        this.price = price;
    }

    public String[] getAmount() {
        return amount;
    }

    public void setAmount(String[] amount) {
        this.amount = amount;
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

    public String[] getGasRetailDetailId() {
        return exportWholesaleDetailId;
    }

    public void setGasRetailDetailId(String[] exportWholesaleDetailId) {
        this.exportWholesaleDetailId = exportWholesaleDetailId;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

    public String[] getExportWholesaleDetailId() {
        return exportWholesaleDetailId;
    }

    public void setExportWholesaleDetailId(String[] exportWholesaleDetailId) {
        this.exportWholesaleDetailId = exportWholesaleDetailId;
    }

    public String[] getExportWholesaleReturnShellDetailId() {
        return exportWholesaleReturnShellDetailId;
    }

    public void setExportWholesaleReturnShellDetailId(String[] exportWholesaleReturnShellDetailId) {
        this.exportWholesaleReturnShellDetailId = exportWholesaleReturnShellDetailId;
    }

    public String[] getGasRetailReturnShellDetailId() {
        return exportWholesaleReturnShellDetailId;
    }

    public void setGasRetailReturnShellDetailId(String[] exportWholesaleReturnShellDetailId) {
        this.exportWholesaleReturnShellDetailId = exportWholesaleReturnShellDetailId;
    }

    public String[] getReturnShellId() {
        return returnShellId;
    }

    public void setReturnShellId(String[] returnShellId) {
        this.returnShellId = returnShellId;
    }

    public String[] getReturnShellQuantity() {
        return returnShellQuantity;
    }

    public void setReturnShellQuantity(String[] returnShellQuantity) {
        this.returnShellQuantity = returnShellQuantity;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }

}
