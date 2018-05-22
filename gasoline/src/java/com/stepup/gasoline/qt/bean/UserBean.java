/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class UserBean {

    private int id;
    private int empId;
    private String fullname;
    private String username;
    private String password;
    private int status;
    private String statusName;

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getEmpId() {
        return empId;
    }

    public String getFullname() {
        return fullname;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
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
}
