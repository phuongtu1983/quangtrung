/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.gasoline.qt.bean.GasWholesaleBean;

/**
 *
 * @author phuongtu
 */
public class GasWholesaleFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int vehicleId;
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
    private int gasReturn;
    private double gasReturnPrice;
    private double gasReturnAmount;

    private String[] gasWholesaleDetailId;
    private String[] shellId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] gasWholesalePromotionMaterialDetailId;
    private String[] promotionMaterialId;
    private String[] promotionMaterialQuantity;

    private String[] gasWholesaleReturnShellDetailId;
    private String[] returnShellId;
    private String[] returnShellQuantity;

    public GasWholesaleFormBean() {
        this.canEdit = 1;
    }

    public GasWholesaleFormBean(GasWholesaleBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.vehicleId = bean.getVehicleId();
        this.customerId = bean.getCustomerId();
        this.total = bean.getTotal();
        this.paid = bean.getPaid();
        this.debt = bean.getDebt();
        this.discount = bean.getDiscount();
        this.totalPay = bean.getTotalPay();
        this.accountId = bean.getAccountId();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.gasReturn = bean.getGasReturn();
        this.gasReturnPrice = bean.getGasReturnPrice();
        this.gasReturnAmount = bean.getGasReturnAmount();
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

    public String[] getGasWholesaleDetailId() {
        return gasWholesaleDetailId;
    }

    public void setGasWholesaleDetailId(String[] gasWholesaleDetailId) {
        this.gasWholesaleDetailId = gasWholesaleDetailId;
    }

    public String[] getShellId() {
        return shellId;
    }

    public void setShellId(String[] shellId) {
        this.shellId = shellId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String[] getGasWholesalePromotionMaterialDetailId() {
        return gasWholesalePromotionMaterialDetailId;
    }

    public void setGasWholesalePromotionMaterialDetailId(String[] gasWholesalePromotionMaterialDetailId) {
        this.gasWholesalePromotionMaterialDetailId = gasWholesalePromotionMaterialDetailId;
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

    public String[] getGasWholesaleReturnShellDetailId() {
        return gasWholesaleReturnShellDetailId;
    }

    public void setGasWholesaleReturnShellDetailId(String[] gasWholesaleReturnShellDetailId) {
        this.gasWholesaleReturnShellDetailId = gasWholesaleReturnShellDetailId;
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

    public int getGasReturn() {
        return gasReturn;
    }

    public void setGasReturn(int gasReturn) {
        this.gasReturn = gasReturn;
    }

    public double getGasReturnPrice() {
        return gasReturnPrice;
    }

    public void setGasReturnPrice(double gasReturnPrice) {
        this.gasReturnPrice = gasReturnPrice;
    }

    public double getGasReturnAmount() {
        return gasReturnAmount;
    }

    public void setGasReturnAmount(double gasReturnAmount) {
        this.gasReturnAmount = gasReturnAmount;
    }

}
