/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoil;

import com.stepup.gasoline.qt.bean.SaleOilBean;

/**
 *
 * @author phuongtu
 */
public class SaleOilFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private double totalBeforeCommisison;
    private double total;
    private double paid;
    private double debt;
    private double discount;
    private double totalPay;
    private int accountId;
    private String note;
    private int canEdit;
    private int customerId;
    private String customerName;
    private float commission;
    private int commissionKind;
    private float commissionAmount;
    private float gapCustomerAmount;
    private float gapAgencyAmount;
    private String exportNumber;
    private String exportDate;
    private boolean isCalculateAgencyCommission;
    private String[] saleOilDetailId;
    private String[] oilId;
    private String[] unitId;
    private String[] storeId;
    private String[] quantity;
    private String[] priceBeforeCommission;
    private String[] commissionPrice;
    private String[] price;
    private String[] firstAmount;
    private String[] amount;
    private String[] commissionDetail;
    private String[] gapAgencyAmountDetail;
    private String[] gapCustomerAmountDetail;

    private String[] saleOilPromotionMaterialDetailId;
    private String[] promotionMaterialId;
    private String[] promotionMaterialQuantity;
    private String[] promotionMaterialUnitId;
    private String[] promotionMaterialStoreId;

    public SaleOilFormBean() {
        this.canEdit = 1;
    }

    public SaleOilFormBean(SaleOilBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.totalBeforeCommisison = bean.getTotalBeforeCommisison();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.discount = bean.getDiscount();
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
        this.exportDate = bean.getExportDate();
        this.exportNumber = bean.getExportNumber();
        this.isCalculateAgencyCommission = bean.getIsCalculateAgencyCommission() == 1 ? true : false;
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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String[] getSaleOilDetailId() {
        return saleOilDetailId;
    }

    public void setSaleOilDetailId(String[] saleOilDetailId) {
        this.saleOilDetailId = saleOilDetailId;
    }

    public String[] getOilId() {
        return oilId;
    }

    public void setOilId(String[] oilId) {
        this.oilId = oilId;
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

    public int getCommissionKind() {
        return commissionKind;
    }

    public void setCommissionKind(int commissionKind) {
        this.commissionKind = commissionKind;
    }

    public float getCommissionAmount() {
        return commissionAmount;
    }

    public void setCommissionAmount(float commissionAmount) {
        this.commissionAmount = commissionAmount;
    }

    public float getGapCustomerAmount() {
        return gapCustomerAmount;
    }

    public void setGapCustomerAmount(float gapCustomerAmount) {
        this.gapCustomerAmount = gapCustomerAmount;
    }

    public float getGapAgencyAmount() {
        return gapAgencyAmount;
    }

    public void setGapAgencyAmount(float gapAgencyAmount) {
        this.gapAgencyAmount = gapAgencyAmount;
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

    public String[] getFirstAmount() {
        return firstAmount;
    }

    public void setFirstAmount(String[] firstAmount) {
        this.firstAmount = firstAmount;
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

    public double getTotalBeforeCommisison() {
        return totalBeforeCommisison;
    }

    public void setTotalBeforeCommisison(double totalBeforeCommisison) {
        this.totalBeforeCommisison = totalBeforeCommisison;
    }

    public String[] getStoreId() {
        return storeId;
    }

    public void setStoreId(String[] storeId) {
        this.storeId = storeId;
    }

    public String getExportNumber() {
        return exportNumber;
    }

    public void setExportNumber(String exportNumber) {
        this.exportNumber = exportNumber;
    }

    public String getExportDate() {
        return exportDate;
    }

    public void setExportDate(String exportDate) {
        this.exportDate = exportDate;
    }

    public boolean getIsCalculateAgencyCommission() {
        return isCalculateAgencyCommission;
    }

    public void setIsCalculateAgencyCommission(boolean isCalculateAgencyCommission) {
        this.isCalculateAgencyCommission = isCalculateAgencyCommission;
    }

    public String[] getSaleOilPromotionMaterialDetailId() {
        return saleOilPromotionMaterialDetailId;
    }

    public void setSaleOilPromotionMaterialDetailId(String[] saleOilPromotionMaterialDetailId) {
        this.saleOilPromotionMaterialDetailId = saleOilPromotionMaterialDetailId;
    }

    public String[] getPromotionMaterialId() {
        return promotionMaterialId;
    }

    public void setPromotionMaterialId(String[] promotionMaterialId) {
        this.promotionMaterialId = promotionMaterialId;
    }

    public String[] getPromotionMaterialQuantity() {
        return promotionMaterialQuantity;
    }

    public void setPromotionMaterialQuantity(String[] promotionMaterialQuantity) {
        this.promotionMaterialQuantity = promotionMaterialQuantity;
    }

    public String[] getPromotionMaterialUnitId() {
        return promotionMaterialUnitId;
    }

    public void setPromotionMaterialUnitId(String[] promotionMaterialUnitId) {
        this.promotionMaterialUnitId = promotionMaterialUnitId;
    }

    public String[] getPromotionMaterialStoreId() {
        return promotionMaterialStoreId;
    }

    public void setPromotionMaterialStoreId(String[] promotionMaterialStoreId) {
        this.promotionMaterialStoreId = promotionMaterialStoreId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

}
