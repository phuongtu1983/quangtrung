/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.gasoline.qt.bean.EmployeeBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String fullname;
    private int status;
    private String statusName;
    private String email;
    private int organizationId;
    private String organizationName;
    private double salary;

    public EmployeeFormBean() {
    }

    public EmployeeFormBean(EmployeeBean bean) {
        this.id = bean.getId();
        this.fullname = bean.getFullname();
        this.status = bean.getStatus();
        this.email = bean.getEmail();
        this.organizationId = bean.getOrganizationId();
        this.salary = bean.getSalary();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

}
