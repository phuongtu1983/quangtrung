/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customerdocument;

import com.stepup.gasoline.qt.bean.DocumentBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class CustomerDocumentFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String name;
    private String note;

    public CustomerDocumentFormBean() {
    }

    public CustomerDocumentFormBean(DocumentBean bean) {
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
