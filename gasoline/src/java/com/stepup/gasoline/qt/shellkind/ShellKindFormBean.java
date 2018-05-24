/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellkind;

import com.stepup.gasoline.qt.bean.ShellKindBean;

/**
 *
 * @author phuongtu
 */
public class ShellKindFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private float weight;
    private float commission;
    private int status;
    private String statusName;

    public ShellKindFormBean() {
    }

    public ShellKindFormBean(ShellKindBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.weight = bean.getWeight();
        this.commission = bean.getCommission();
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getCommission() {
        return commission;
    }

    public void setCommission(float commission) {
        this.commission = commission;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

}
