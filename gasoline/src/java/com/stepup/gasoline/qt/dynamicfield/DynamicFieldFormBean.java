/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.dynamicfield;

import com.stepup.gasoline.qt.bean.DynamicFieldBean;

/**
 *
 * @author phuongtu
 */
public class DynamicFieldFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String name;
    private String tableName;
    private int organizationId;
    private String organizationName;
    private int canEdit;

    public DynamicFieldFormBean() {
    }

    public DynamicFieldFormBean(DynamicFieldBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.tableName = bean.getTableName();
        this.organizationId = bean.getOrganizationId();
        this.canEdit = bean.getCanEdit();
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

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

}
