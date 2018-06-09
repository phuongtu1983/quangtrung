/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleaccessory;

import com.stepup.gasoline.qt.bean.SaleAccessoryBean;

/**
 *
 * @author phuongtu
 */
public class SaleAccessoryFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private double total;
    private double paid;
    private double debt;
    private double discount;
    private double totalPay;
    private int accountId;
    private String note;
    private int canEdit;
    private String[] saleAccessoryDetailId;
    private String[] goodId;
    private String[] quantity;
    private String[] price;
    private String[] amount;

    private String[] saleAccessoryChangeGoodDetailId;
    private String[] changeGoodId;
    private String[] changeGoodQuantity;
    private String[] changeGoodPrice;
    private String[] changeGoodAmount;

    public SaleAccessoryFormBean() {
        this.canEdit = 1;
    }

    public SaleAccessoryFormBean(SaleAccessoryBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
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

    public String[] getSaleAccessoryDetailId() {
        return saleAccessoryDetailId;
    }

    public void setSaleAccessoryDetailId(String[] saleAccessoryDetailId) {
        this.saleAccessoryDetailId = saleAccessoryDetailId;
    }

    public String[] getGoodId() {
        return goodId;
    }

    public void setGoodId(String[] goodId) {
        this.goodId = goodId;
    }

    public String[] getSaleAccessoryChangeGoodDetailId() {
        return saleAccessoryChangeGoodDetailId;
    }

    public void setSaleAccessoryChangeGoodDetailId(String[] saleAccessoryChangeGoodDetailId) {
        this.saleAccessoryChangeGoodDetailId = saleAccessoryChangeGoodDetailId;
    }

    public String[] getChangeGoodId() {
        return changeGoodId;
    }

    public void setChangeGoodId(String[] changeGoodId) {
        this.changeGoodId = changeGoodId;
    }

    public String[] getChangeGoodQuantity() {
        return changeGoodQuantity;
    }

    public void setChangeGoodQuantity(String[] changeGoodQuantity) {
        this.changeGoodQuantity = changeGoodQuantity;
    }

    public String[] getChangeGoodPrice() {
        return changeGoodPrice;
    }

    public void setChangeGoodPrice(String[] changeGoodPrice) {
        this.changeGoodPrice = changeGoodPrice;
    }

    public String[] getChangeGoodAmount() {
        return changeGoodAmount;
    }

    public void setChangeGoodAmount(String[] changeGoodAmount) {
        this.changeGoodAmount = changeGoodAmount;
    }

}
