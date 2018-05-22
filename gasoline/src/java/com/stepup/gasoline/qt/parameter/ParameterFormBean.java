/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.parameter;

import com.stepup.gasoline.qt.bean.ParameterBean;

/**
 *
 * @author phuongtu
 */
public class ParameterFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String name;
    private String value;

    public ParameterFormBean() {
    }

    public ParameterFormBean(ParameterBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.name = bean.getName();
        this.value = bean.getValue();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
