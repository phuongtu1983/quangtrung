package com.stepup.gasoline.qt.saleoilreturnstore;

import com.stepup.gasoline.qt.bean.SaleOilReturnStoreBean;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author phuongtu
 */
public class SaleOilReturnStoreFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int storeId;
    private int organizationId;

    public SaleOilReturnStoreFormBean() {
    }

    public SaleOilReturnStoreFormBean(SaleOilReturnStoreBean bean) {
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
