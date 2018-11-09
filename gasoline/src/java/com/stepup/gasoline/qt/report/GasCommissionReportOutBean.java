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
public class GasCommissionReportOutBean {

    private String employeeIds;
    private double commission12;
    private double commission45;
    private double commissionLoVo;

    public String getEmployeeIds() {
        return employeeIds;
    }

    public void setEmployeeIds(String employeeIds) {
        this.employeeIds = employeeIds;
    }

    public double getCommission12() {
        return commission12;
    }

    public void setCommission12(double commission12) {
        this.commission12 = commission12;
    }

    public double getCommission45() {
        return commission45;
    }

    public void setCommission45(double commission45) {
        this.commission45 = commission45;
    }

    public double getCommissionLoVo() {
        return commissionLoVo;
    }

    public void setCommissionLoVo(double commissionLoVo) {
        this.commissionLoVo = commissionLoVo;
    }

}
