/// <summary>
/// Author : phuongtu
/// Created Date : 28/10/2009
/// </summary>
package com.stepup.gasoline.qt.permission;

import java.io.Serializable;

public class ApplicationPermissionBean implements Serializable {

    //fields region
    private int perId;
    private String name;
    private String users;
    private String function;
    private int operation;

    //constructure region
    public ApplicationPermissionBean() {
    }

    //properties region
    public int getPerId() {
        return perId;
    }

    public void setPerId(int perId) {
        this.perId = perId;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
    }
}
