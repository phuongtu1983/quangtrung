/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.discount;

import com.stepup.gasoline.qt.bean.DiscountBean;

/**
 *
 * @author phuongtu
 */
public class DiscountFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private String note;
    private double shellGasComission;
    private String[] discountCustomerDetailId;
    private String[] discountCommissionDetailId;
    private String[] customerId;
    private String[] discountCommissionFrom;
    private String[] discountCommissionTo;
    private String[] discountCommissionCommission;
    private String[] discountCommissionCustomer;

    public DiscountFormBean() {
    }

    public DiscountFormBean(DiscountBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
        this.shellGasComission = bean.getShellGasComission();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String[] getDiscountCommissionFrom() {
        return discountCommissionFrom;
    }

    public void setDiscountCommissionFrom(String[] discountCommissionFrom) {
        this.discountCommissionFrom = discountCommissionFrom;
    }

    public String[] getDiscountCommissionTo() {
        return discountCommissionTo;
    }

    public void setDiscountCommissionTo(String[] discountCommissionTo) {
        this.discountCommissionTo = discountCommissionTo;
    }

    public String[] getDiscountCommissionCommission() {
        return discountCommissionCommission;
    }

    public void setDiscountCommissionCommission(String[] discountCommissionCommission) {
        this.discountCommissionCommission = discountCommissionCommission;
    }

    public String[] getDiscountCommissionDetailId() {
        return discountCommissionDetailId;
    }

    public void setDiscountCommissionDetailId(String[] discountCommissionDetailId) {
        this.discountCommissionDetailId = discountCommissionDetailId;
    }

    public double getShellGasComission() {
        return shellGasComission;
    }

    public void setShellGasComission(double shellGasComission) {
        this.shellGasComission = shellGasComission;
    }

    public String[] getDiscountCommissionCustomer() {
        return discountCommissionCustomer;
    }

    public void setDiscountCommissionCustomer(String[] discountCommissionCustomer) {
        this.discountCommissionCustomer = discountCommissionCustomer;
    }

    public String[] getDiscountCustomerDetailId() {
        return discountCustomerDetailId;
    }

    public void setDiscountCustomerDetailId(String[] discountCustomerDetailId) {
        this.discountCustomerDetailId = discountCustomerDetailId;
    }

    public String[] getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String[] customerId) {
        this.customerId = customerId;
    }

}
