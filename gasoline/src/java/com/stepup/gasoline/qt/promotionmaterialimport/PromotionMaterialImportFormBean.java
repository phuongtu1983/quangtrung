/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterialimport;

import com.stepup.gasoline.qt.bean.PromotionMaterialImportBean;

/**
 *
 * @author phuongtu
 */
public class PromotionMaterialImportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vendorId;
    private String vendorName;
    private double total;
    private double paid;
    private double debt;
    private int paymentMode;
    private int accountId;
    private String note;
    private int canEdit;
    private String[] promotionMaterialImportDetailId;
    private String[] promotionMaterialId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    public PromotionMaterialImportFormBean() {
        this.canEdit = 1;
    }

    public PromotionMaterialImportFormBean(PromotionMaterialImportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vendorId = bean.getVendorId();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.paymentMode = bean.getPaymentMode();
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

    public String[] getPromotionMaterialImportDetailId() {
        return promotionMaterialImportDetailId;
    }

    public void setPromotionMaterialImportDetailId(String[] promotionMaterialImportDetailId) {
        this.promotionMaterialImportDetailId = promotionMaterialImportDetailId;
    }

    public String[] getPromotionMaterialId() {
        return promotionMaterialId;
    }

    public void setPromotionMaterialId(String[] promotionMaterialId) {
        this.promotionMaterialId = promotionMaterialId;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
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

    public int getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(int paymentMode) {
        this.paymentMode = paymentMode;
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

}
