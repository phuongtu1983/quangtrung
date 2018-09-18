/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author kngo
 */
public class FileAttachmentBean {

    //fields region
    private int id;
    private String name;
    private String source;
    private String href;
    private int employeeId;
    private String employeeName;
    private int type;
    private int parentId;
    private String createdDate;

    //constructure region
    public FileAttachmentBean() {
    }

    public FileAttachmentBean(int id) {
        this.id = id;
    }

    public FileAttachmentBean(int id, String name, String source, String href, String createdDate, int employeeId, int type, int parentId) {
        this.id = id;
        this.name = name;
        this.source = source;
        this.href = href;
        this.createdDate = createdDate;
        this.employeeId = employeeId;
        this.type = type;
        this.parentId = parentId;
    }

    public String getSource() {
        return this.source;
    }

    public void setSource(String source) {
        this.source = source.replace("\\", "/");
    }

    public String getHref() {
        return this.href;
    }

    public void setHref(String href) {
        this.href = href.replace("\\", "/");
    }

    public String getCreatedDate() {
        return this.createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

}
