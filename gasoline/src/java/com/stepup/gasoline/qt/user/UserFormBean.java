/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.user;

import com.stepup.gasoline.qt.bean.UserBean;

/**
 *
 * @author phuongtu
 */
public class UserFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private int empId;
    private int status;
    private String username;
    private String fullname;
    private String password;

    public UserFormBean() {
    }

    public UserFormBean(UserBean bean) {
        this.id = bean.getId();
        this.empId = bean.getEmpId();
        this.status = bean.getStatus();
        this.username = bean.getUsername();
        this.fullname = bean.getFullname();
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

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
