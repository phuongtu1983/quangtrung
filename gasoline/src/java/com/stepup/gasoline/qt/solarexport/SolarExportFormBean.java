/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solarexport;

import com.stepup.gasoline.qt.bean.SolarExportBean;
import com.stepup.gasoline.qt.bean.SaleSolarBean;

/**
 *
 * @author phuongtu
 */
public class SolarExportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int solarSaleId;
    private int customerId;
    private String customerName;
    private double total;
    private String note;
    private int canEdit;
    private String[] solarExportDetailId;
    private String[] solarId;
    private String[] solarSaleDetailId;
    private String[] quantity;

    public SolarExportFormBean() {
        this.canEdit = 1;
    }

    public SolarExportFormBean(SolarExportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.solarSaleId = bean.getSolarSaleId();
        this.customerId = bean.getCustomerId();
        this.customerName = bean.getCustomerName();
        this.total = bean.getTotal();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
    }

    public SolarExportFormBean(SaleSolarBean bean) {
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.customerId = bean.getCustomerId();
        this.solarSaleId = bean.getId();
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

    public String[] getSolarId() {
        return solarId;
    }

    public void setSolarId(String[] solarId) {
        this.solarId = solarId;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
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

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String[] getSolarExportDetailId() {
        return solarExportDetailId;
    }

    public void setSolarExportDetailId(String[] solarExportDetailId) {
        this.solarExportDetailId = solarExportDetailId;
    }

    public String[] getSolarSaleDetailId() {
        return solarSaleDetailId;
    }

    public void setSolarSaleDetailId(String[] solarSaleDetailId) {
        this.solarSaleDetailId = solarSaleDetailId;
    }

    public int getSolarSaleId() {
        return solarSaleId;
    }

    public void setSolarSaleId(int solarSaleId) {
        this.solarSaleId = solarSaleId;
    }

}
