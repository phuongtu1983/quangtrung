/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesalefee;

import com.stepup.gasoline.qt.bean.GasWholeSaleFeeBean;

/**
 *
 * @author phuongtu
 */
public class GasWholeSaleFeeFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int kind;
    private String kindName;
    private int status;
    private String statusName;

    public GasWholeSaleFeeFormBean() {
    }

    public GasWholeSaleFeeFormBean(GasWholeSaleFeeBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.kind = bean.getKind();
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
