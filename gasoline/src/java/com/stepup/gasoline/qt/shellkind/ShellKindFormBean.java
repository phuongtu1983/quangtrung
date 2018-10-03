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
    private int weight;
    private int commission;
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

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getCommission() {
        return commission;
    }

    public void setCommission(int commission) {
        this.commission = commission;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

}
