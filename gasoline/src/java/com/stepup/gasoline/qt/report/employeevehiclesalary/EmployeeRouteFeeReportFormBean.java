/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.employeevehiclesalary;

/**
 *
 * @author phuongtu
 */
public class EmployeeRouteFeeReportFormBean extends org.apache.struts.action.ActionForm {

    private int count;
    private String createdDate;
    private String routeName;
    private double distance;
    private double inQuantity;
    private double outQuantity;
    private double diffQuantity;
    private double totalQuantity;
    private int param100km;
    private int param1000kg;
    private double price;
    private double amount;
    private String store;
    private String note;

    public EmployeeRouteFeeReportFormBean() {
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getInQuantity() {
        return inQuantity;
    }

    public void setInQuantity(double inQuantity) {
        this.inQuantity = inQuantity;
    }

    public double getOutQuantity() {
        return outQuantity;
    }

    public void setOutQuantity(double outQuantity) {
        this.outQuantity = outQuantity;
    }

    public double getDiffQuantity() {
        return diffQuantity;
    }

    public void setDiffQuantity(double diffQuantity) {
        this.diffQuantity = diffQuantity;
    }

    public double getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(double totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public int getParam100km() {
        return param100km;
    }

    public void setParam100km(int param100km) {
        this.param100km = param100km;
    }

    public int getParam1000kg() {
        return param1000kg;
    }

    public void setParam1000kg(int param1000kg) {
        this.param1000kg = param1000kg;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
