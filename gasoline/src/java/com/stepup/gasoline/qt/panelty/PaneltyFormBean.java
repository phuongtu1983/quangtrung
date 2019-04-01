/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.panelty;

import com.stepup.gasoline.qt.bean.PaneltyBean;


/**
 *
 * @author phuongtu
 */
public class PaneltyFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String note;
    private int organizationId;
    private String organizationName;

    public PaneltyFormBean() {
    }

    public PaneltyFormBean(PaneltyBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
        this.organizationId = bean.getOrganizationId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
