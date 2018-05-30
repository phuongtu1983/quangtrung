/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasprice;

import com.stepup.gasoline.qt.bean.GasPriceBean;

/**
 *
 * @author phuongtu
 */
public class GasPriceFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String fromDate;
    private String toDate;
    private double price;
    private String note;
    private int kind;
    private String kindName;

    public GasPriceFormBean() {
    }

    public GasPriceFormBean(GasPriceBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.fromDate = bean.getFromDate();
        this.toDate = bean.getToDate();
        this.price = bean.getPrice();
        this.note = bean.getNote();
        this.kind = bean.getKind();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public int getKind() {
        return kind;
    }

    public void setKind(int kind) {
        this.kind = kind;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }

}
