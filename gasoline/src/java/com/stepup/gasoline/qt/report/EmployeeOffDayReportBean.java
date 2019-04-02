/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

/**
 *
 * @author Administrator
 */
public class EmployeeOffDayReportBean {

    private int employeeId;
    private int dayoffId;
    private float quantity;

    public EmployeeOffDayReportBean() {
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public float getQuantity() {
        return quantity;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    public int getDayoffId() {
        return dayoffId;
    }

    public void setDayoffId(int dayoffId) {
        this.dayoffId = dayoffId;
    }

}
