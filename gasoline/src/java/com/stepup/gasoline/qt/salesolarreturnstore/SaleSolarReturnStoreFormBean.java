package com.stepup.gasoline.qt.salesolarreturnstore;

import com.stepup.gasoline.qt.bean.SaleSolarReturnStoreBean;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author phuongtu
 */
public class SaleSolarReturnStoreFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int storeId;
    private int organizationId;

    public SaleSolarReturnStoreFormBean() {
    }

    public SaleSolarReturnStoreFormBean(SaleSolarReturnStoreBean bean) {
        this.id = bean.getId();
        this.storeId = bean.getStoreId();
        this.organizationId = bean.getOrganizationId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

}
