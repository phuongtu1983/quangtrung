/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class OilBean {

    private int id;
    private String code;
    private String name;
    private float weight;
    private double price;
    private int vendorId;
    private int groupId;
    private int weightUnitId;
    private int baseUnitId;
    private int saleUnitId;
    private int organizationId;
    private int employeeCommissionId;
    private int status;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
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

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getWeightUnitId() {
        return weightUnitId;
    }

    public void setWeightUnitId(int weightUnitId) {
        this.weightUnitId = weightUnitId;
    }

    public int getBaseUnitId() {
        return baseUnitId;
    }

    public void setBaseUnitId(int baseUnitId) {
        this.baseUnitId = baseUnitId;
    }

    public int getSaleUnitId() {
        return saleUnitId;
    }

    public void setSaleUnitId(int saleUnitId) {
        this.saleUnitId = saleUnitId;
    }

    public int getEmployeeCommissionId() {
        return employeeCommissionId;
    }

    public void setEmployeeCommissionId(int employeeCommissionId) {
        this.employeeCommissionId = employeeCommissionId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

}
