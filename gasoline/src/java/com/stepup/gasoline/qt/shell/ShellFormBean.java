/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shell;

import com.stepup.gasoline.qt.bean.ShellBean;

/**
 *
 * @author phuongtu
 */
public class ShellFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String name;
    private String code;
    private int kindId;
    private int unitId;
    private double price;
    private int status;
    private String statusName;
    private int vendorId;
    private String vendorName;

    private String[] shellVendorDetailId;
    private String[] shellVendorId;

    public ShellFormBean() {
    }

    public ShellFormBean(ShellBean bean) {
        this.id = bean.getId();
        this.name = bean.getName();
        this.code = bean.getCode();
        this.kindId = bean.getKindId();
        this.unitId = bean.getUnitId();
        this.price = bean.getPrice();
        this.status = bean.getStatus();
        this.vendorId = bean.getVendorId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getKindId() {
        return kindId;
    }

    public void setKindId(int kindId) {
        this.kindId = kindId;
    }

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String[] getShellVendorDetailId() {
        return shellVendorDetailId;
    }

    public void setShellVendorDetailId(String[] shellVendorDetailId) {
        this.shellVendorDetailId = shellVendorDetailId;
    }

    public String[] getShellVendorId() {
        return shellVendorId;
    }

    public void setShellVendorId(String[] shellVendorId) {
        this.shellVendorId = shellVendorId;
    }

}
