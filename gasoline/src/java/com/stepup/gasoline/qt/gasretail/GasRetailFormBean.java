/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasretail;

import com.stepup.gasoline.qt.bean.GasRetailBean;

/**
 *
 * @author phuongtu
 */
public class GasRetailFormBean extends org.apache.struts.action.ActionForm {

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
    private String[] gasRetailDetailId;
    private String[] shellId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] gasRetailPromotionMaterialDetailId;
    private String[] promotionMaterialId;
    private String[] promotionMaterialQuantity;

    private String[] gasRetailReturnShellDetailId;
    private String[] returnShellId;
    private String[] returnShellQuantity;

    public GasRetailFormBean() {
        this.canEdit = 1;
    }

    public GasRetailFormBean(GasRetailBean bean) {
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
        return gasRetailDetailId;
    }

    public void setGasRetailDetailId(String[] gasRetailDetailId) {
        this.gasRetailDetailId = gasRetailDetailId;
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

    public String[] getGasRetailPromotionMaterialDetailId() {
        return gasRetailPromotionMaterialDetailId;
    }

    public void setGasRetailPromotionMaterialDetailId(String[] gasRetailPromotionMaterialDetailId) {
        this.gasRetailPromotionMaterialDetailId = gasRetailPromotionMaterialDetailId;
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

    public String[] getGasRetailReturnShellDetailId() {
        return gasRetailReturnShellDetailId;
    }

    public void setGasRetailReturnShellDetailId(String[] gasRetailReturnShellDetailId) {
        this.gasRetailReturnShellDetailId = gasRetailReturnShellDetailId;
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
