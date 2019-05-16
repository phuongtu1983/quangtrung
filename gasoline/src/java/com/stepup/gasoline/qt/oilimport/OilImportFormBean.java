/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilimport;

import com.stepup.gasoline.qt.bean.OilImportBean;

/**
 *
 * @author phuongtu
 */
public class OilImportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vendorId;
    private String vendorName;
    private float commission;
    private double rate;
    private double totalBeforeCommission;
    private double total;
    private double paid;
    private double debt;
    private int accountId;
    private String note;
    private int canEdit;
    private String[] oilImportDetailId;
    private String[] oilId;
    private String[] unitId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    public OilImportFormBean() {
        this.canEdit = 1;
    }

    public OilImportFormBean(OilImportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vendorId = bean.getVendorId();
        this.commission = bean.getCommission();
        this.rate = bean.getRate();
        this.total = bean.getTotal();
        this.totalBeforeCommission = bean.getTotalBeforeCommission();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
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

    public String[] getOilImportDetailId() {
        return oilImportDetailId;
    }

    public void setOilImportDetailId(String[] oilImportDetailId) {
        this.oilImportDetailId = oilImportDetailId;
    }

    public String[] getOilId() {
        return oilId;
    }

    public void setOilId(String[] oilId) {
        this.oilId = oilId;
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
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

    public String[] getUnitId() {
        return unitId;
    }

    public void setUnitId(String[] unitId) {
        this.unitId = unitId;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

    public double getTotalBeforeCommission() {
        return totalBeforeCommission;
    }

    public void setTotalBeforeCommission(double totalBeforeCommission) {
        this.totalBeforeCommission = totalBeforeCommission;
    }

}
