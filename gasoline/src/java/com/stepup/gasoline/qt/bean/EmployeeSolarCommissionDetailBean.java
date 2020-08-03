/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class EmployeeSolarCommissionDetailBean {

    private int id;
    private int employeeSolarComissionId;
    private double from;
    private double to;
    private double commission;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeSolarComissionId() {
        return employeeSolarComissionId;
    }

    public void setEmployeeSolarComissionId(int employeeSolarComissionId) {
        this.employeeSolarComissionId = employeeSolarComissionId;
    }

    public double getFrom() {
        return from;
    }

    public void setFrom(double from) {
        this.from = from;
    }

    public double getTo() {
        return to;
    }

    public void setTo(double to) {
        this.to = to;
    }

    public double getCommission() {
        return commission;
    }

    public void setCommission(double commission) {
        this.commission = commission;
    }

}
