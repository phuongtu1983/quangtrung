/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.organization;

import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class OrganizationTimesheetFormBean extends DynamicFieldValueParentFormBean {

    private int organizationId;
    private String organizationName;

    public OrganizationTimesheetFormBean() {
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

}
