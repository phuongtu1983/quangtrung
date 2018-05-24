/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.unit;

import com.stepup.gasoline.qt.bean.UnitBean;

/**
 *
 * @author phuongtu
 */
public class UnitFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int status;
    private String statusName;

    public UnitFormBean() {
    }

    public UnitFormBean(UnitBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
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

}
