/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fixedassetgroup;

import com.stepup.gasoline.qt.bean.FixedAssetGroupBean;

/**
 *
 * @author phuongtu
 */
public class FixedAssetGroupFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private int organizationId;
    private String organizationName;

    public FixedAssetGroupFormBean() {
    }

    public FixedAssetGroupFormBean(FixedAssetGroupBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.organizationId = bean.getOrganizationId();
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

}
