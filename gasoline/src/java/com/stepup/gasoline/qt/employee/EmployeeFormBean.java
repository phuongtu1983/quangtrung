/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.dynamicfield.DynamicFieldValueParentFormBean;

/**
 *
 * @author phuongtu
 */
public class EmployeeFormBean extends DynamicFieldValueParentFormBean {

    private int id;
    private String fullname;
    private int status;
    private int seniority;
    private String statusName;
    private String email;
    private int organizationId;
    private String organizationName;
    private String birthday;
    private String startDate;
    private double salary;

    public EmployeeFormBean() {
        this.seniority = 1;
    }

    public EmployeeFormBean(EmployeeBean bean) {
        this.id = bean.getId();
        this.fullname = bean.getFullname();
        this.status = bean.getStatus();
        this.email = bean.getEmail();
        this.organizationId = bean.getOrganizationId();
        this.salary = bean.getSalary();
        this.birthday = bean.getBirthday();
        this.seniority = bean.getSeniority();
        this.startDate = bean.getStartDate();
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getSeniority() {
        return seniority;
    }

    public void setSeniority(int seniority) {
        this.seniority = seniority;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

}
