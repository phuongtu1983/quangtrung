/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoilreturn;

import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnBean;

/**
 *
 * @author phuongtu
 */
public class SaleOilReturnFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private double totalBeforeCommisison;
    private double total;
    private double paid;
    private double debt;
    private double totalPay;
    private int accountId;
    private String note;
    private int canEdit;
    private int customerId;
    private float commission;
    private int commissionKind;
    private double commissionAmount;
    private double gapCustomerAmount;
    private double gapAgencyAmount;

    private String[] saleOilReturnDetailId;
    private String[] saleOilDetailId;
    private String[] oilId;
    private String[] quantity;
    private String[] priceBeforeCommission;
    private String[] commissionPrice;
    private String[] price;
    private String[] firstAmount;
    private String[] amount;
    private String[] commissionDetail;
    private String[] gapAgencyAmountDetail;
    private String[] gapCustomerAmountDetail;

    public SaleOilReturnFormBean() {
        this.canEdit = 1;
    }

    public SaleOilReturnFormBean(SaleOilReturnBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.totalBeforeCommisison = bean.getTotalBeforeCommisison();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.totalPay = bean.getTotalPay();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.customerId = bean.getCustomerId();
        this.commission = bean.getCommission();
        this.commissionKind = bean.getCommissionKind();
        this.commissionAmount = bean.getCommissionAmount();
        this.gapCustomerAmount = bean.getGapCustomerAmount();
        this.gapAgencyAmount = bean.getGapAgencyAmount();
    }

    public SaleOilReturnFormBean(SaleOilBean bean) {
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.customerId = bean.getCustomerId();
        this.commission = bean.getCommission();
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

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String[] getOilId() {
        return oilId;
    }

    public void setOilId(String[] oilId) {
        this.oilId = oilId;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

    public int getCommissionKind() {
        return commissionKind;
    }

    public void setCommissionKind(int commissionKind) {
        this.commissionKind = commissionKind;
    }

    public double getCommissionAmount() {
        return commissionAmount;
    }

    public void setCommissionAmount(double commissionAmount) {
        this.commissionAmount = commissionAmount;
    }

    public double getGapCustomerAmount() {
        return gapCustomerAmount;
    }

    public void setGapCustomerAmount(double gapCustomerAmount) {
        this.gapCustomerAmount = gapCustomerAmount;
    }

    public double getGapAgencyAmount() {
        return gapAgencyAmount;
    }

    public void setGapAgencyAmount(double gapAgencyAmount) {
        this.gapAgencyAmount = gapAgencyAmount;
    }

    public double getTotalBeforeCommisison() {
        return totalBeforeCommisison;
    }

    public void setTotalBeforeCommisison(double totalBeforeCommisison) {
        this.totalBeforeCommisison = totalBeforeCommisison;
    }

    public String[] getSaleOilReturnDetailId() {
        return saleOilReturnDetailId;
    }

    public void setSaleOilReturnDetailId(String[] saleOilReturnDetailId) {
        this.saleOilReturnDetailId = saleOilReturnDetailId;
    }

    public String[] getPriceBeforeCommission() {
        return priceBeforeCommission;
    }

    public void setPriceBeforeCommission(String[] priceBeforeCommission) {
        this.priceBeforeCommission = priceBeforeCommission;
    }

    public String[] getCommissionPrice() {
        return commissionPrice;
    }

    public void setCommissionPrice(String[] commissionPrice) {
        this.commissionPrice = commissionPrice;
    }

    public String[] getPrice() {
        return price;
    }

    public void setPrice(String[] price) {
        this.price = price;
    }

    public String[] getFirstAmount() {
        return firstAmount;
    }

    public void setFirstAmount(String[] firstAmount) {
        this.firstAmount = firstAmount;
    }

    public String[] getAmount() {
        return amount;
    }

    public void setAmount(String[] amount) {
        this.amount = amount;
    }

    public String[] getCommissionDetail() {
        return commissionDetail;
    }

    public void setCommissionDetail(String[] commissionDetail) {
        this.commissionDetail = commissionDetail;
    }

    public String[] getGapAgencyAmountDetail() {
        return gapAgencyAmountDetail;
    }

    public void setGapAgencyAmountDetail(String[] gapAgencyAmountDetail) {
        this.gapAgencyAmountDetail = gapAgencyAmountDetail;
    }

    public String[] getGapCustomerAmountDetail() {
        return gapCustomerAmountDetail;
    }

    public void setGapCustomerAmountDetail(String[] gapCustomerAmountDetail) {
        this.gapCustomerAmountDetail = gapCustomerAmountDetail;
    }

    public String[] getSaleOilDetailId() {
        return saleOilDetailId;
    }

    public void setSaleOilDetailId(String[] saleOilDetailId) {
        this.saleOilDetailId = saleOilDetailId;
    }

}
