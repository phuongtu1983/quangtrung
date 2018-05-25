/// <summary>
/// Author : phuongtu
/// Created Date : 28/10/2009
/// </summary>
package com.stepup.gasoline.qt.bean;

public class PermissionBean {

    //fields region
    private int id; // primary key
    private String name;
    private String users;
    private String organizations;
    private String note;
    private String userNames;

    //constructure region
    public PermissionBean() {
    }

    public PermissionBean(int id) {
        this.id = id;
    }

    public PermissionBean(int id, String name) {
        this.id = id;
        this.name = name;
    }

    //properties region
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
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

    public String getUserNames() {
        return userNames;
    }

    public void setUserNames(String userNames) {
        this.userNames = userNames;
    }

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    public String getOrganizations() {
        return organizations;
    }

    public void setOrganizations(String organizations) {
        this.organizations = organizations;
    }

}
