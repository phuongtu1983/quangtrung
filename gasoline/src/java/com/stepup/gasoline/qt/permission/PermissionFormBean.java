/// <summary>
/// Author : phuongtu
/// Created Date : 28/10/2009
/// </summary>
package com.stepup.gasoline.qt.permission;

import com.stepup.gasoline.qt.bean.PermissionBean;

public class PermissionFormBean extends org.apache.struts.action.ActionForm {

    //fields region
    private int perId;
    private String name;
    private String note;
    private String[] funcList;
    private String[] funcAdd;
    private String[] funcDelete;
    private String[] funcEdit;
    private String[] funcView;
    private String[] funcPrint;
    private String[] funcOther;
    private String[] permissionEmpId;
    private String[] permissionOrgId;

    //constructure region
    public PermissionFormBean() {
    }

    public PermissionFormBean(PermissionBean bean) {
        this.perId = bean.getId();
        this.name = bean.getName();
        this.note = bean.getNote();
    }

    //properties region
    public int getPerId() {
        return this.perId;
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

    public String[] getFuncAdd() {
        return funcAdd;
    }

    public void setFuncAdd(String[] funcAdd) {
        this.funcAdd = funcAdd;
    }

    public String[] getFuncDelete() {
        return funcDelete;
    }

    public void setFuncDelete(String[] funcDelete) {
        this.funcDelete = funcDelete;
    }

    public String[] getFuncEdit() {
        return funcEdit;
    }

    public void setFuncEdit(String[] funcEdit) {
        this.funcEdit = funcEdit;
    }

    public String[] getFuncList() {
        return funcList;
    }

    public void setFuncList(String[] funcList) {
        this.funcList = funcList;
    }

    public String[] getPermissionEmpId() {
        return permissionEmpId;
    }

    public void setPermissionEmpId(String[] permissionEmpId) {
        this.permissionEmpId = permissionEmpId;
    }

    public String[] getFuncView() {
        return funcView;
    }

    public void setFuncView(String[] funcView) {
        this.funcView = funcView;
    }

    public String[] getFuncOther() {
        return funcOther;
    }

    public void setFuncOther(String[] funcOther) {
        this.funcOther = funcOther;
    }

    public String[] getFuncPrint() {
        return funcPrint;
    }

    public void setFuncPrint(String[] funcPrint) {
        this.funcPrint = funcPrint;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String[] getPermissionOrgId() {
        return permissionOrgId;
    }

    public void setPermissionOrgId(String[] permissionOrgId) {
        this.permissionOrgId = permissionOrgId;
    }

}
