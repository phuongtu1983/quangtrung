/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilexport;

import com.stepup.gasoline.qt.bean.OilExportBean;
import com.stepup.gasoline.qt.bean.SaleOilBean;

/**
 *
 * @author phuongtu
 */
public class OilExportFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int oilSaleId;
    private int customerId;
    private String customerName;
    private double total;
    private String note;
    private int canEdit;
    private String[] oilExportDetailId;
    private String[] oilId;
    private String[] oilSaleDetailId;
    private String[] quantity;

    public OilExportFormBean() {
        this.canEdit = 1;
    }

    public OilExportFormBean(OilExportBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.oilSaleId = bean.getOilSaleId();
        this.customerId = bean.getCustomerId();
        this.customerName = bean.getCustomerName();
        this.total = bean.getTotal();
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
    }

    public OilExportFormBean(SaleOilBean bean) {
        this.note = bean.getNote();
        this.canEdit = bean.getCanEdit();
        this.customerId = bean.getCustomerId();
        this.oilSaleId = bean.getId();
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

    public String[] getOilExportDetailId() {
        return oilExportDetailId;
    }

    public void setOilExportDetailId(String[] oilExportDetailId) {
        this.oilExportDetailId = oilExportDetailId;
    }

    public String[] getOilSaleDetailId() {
        return oilSaleDetailId;
    }

    public void setOilSaleDetailId(String[] oilSaleDetailId) {
        this.oilSaleDetailId = oilSaleDetailId;
    }

    public int getOilSaleId() {
        return oilSaleId;
    }

    public void setOilSaleId(int oilSaleId) {
        this.oilSaleId = oilSaleId;
    }

}
