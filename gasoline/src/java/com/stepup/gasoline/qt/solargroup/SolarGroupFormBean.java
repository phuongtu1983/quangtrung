/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solargroup;

import com.stepup.gasoline.qt.bean.SolarGroupBean;

/**
 *
 * @author phuongtu
 */
public class SolarGroupFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String note;
    private int status;
    private String statusName;

    public SolarGroupFormBean() {
    }

    public SolarGroupFormBean(SolarGroupBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
        this.status = bean.getStatus();
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
