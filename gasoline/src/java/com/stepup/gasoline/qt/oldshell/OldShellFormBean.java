/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oldshell;

import com.stepup.gasoline.qt.bean.OldShellBean;

/**
 *
 * @author phuongtu
 */
public class OldShellFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int quantity;
    private int shellId;
    private String shellName;
    private String note;

    public OldShellFormBean() {
    }

    public OldShellFormBean(OldShellBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.quantity = bean.getQuantity();
        this.note = bean.getNote();
        this.shellId = bean.getShellId();
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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getShellId() {
        return shellId;
    }

    public void setShellId(int shellId) {
        this.shellId = shellId;
    }

    public String getShellName() {
        return shellName;
    }

    public void setShellName(String shellName) {
        this.shellName = shellName;
    }

}
