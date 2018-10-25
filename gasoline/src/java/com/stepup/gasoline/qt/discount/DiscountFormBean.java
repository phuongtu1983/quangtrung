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
    private String note;

    public DiscountFormBean() {
    }

    public DiscountFormBean(DiscountBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
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

}
