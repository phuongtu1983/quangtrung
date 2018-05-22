/// <summary>
/// Author : phuongtu
/// Created Date : 28/10/2009
/// </summary>
package com.stepup.gasoline.qt.bean;

public class PermissionDetailBean {

    //fields region
    private int id; // primary key
    private int perId; // foreign key : reference to permission(per_id)
    private String function;
    private int operation;

    //constructure region
    public PermissionDetailBean() {
    }

    public PermissionDetailBean(int id) {
        this.id = id;
    }

    public PermissionDetailBean(int id, int operation, String function) {
        this.id = id;
        this.function = function;
        this.operation = operation;
    }

    public PermissionDetailBean(int operation, String function) {
        this.function = function;
        this.operation = operation;
    }

    //properties region
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
    }

    public int getPerId() {
        return this.perId;
    }

    public void setPerId(int perId) {
        this.perId = perId;
    }

    public String getFunction() {
        return this.function;
    }

    public void setFunction(String function) {
        this.function = function;
    }
}
