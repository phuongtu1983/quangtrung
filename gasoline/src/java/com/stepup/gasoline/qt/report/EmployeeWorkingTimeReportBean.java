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
public class EmployeeWorkingTimeReportBean {

    private int count;
    private String employeeName;
    private String startDate;
    private float yearCount;
    private float enought2;
    private float notEnought2;
    private float seniority;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public float getYearCount() {
        return yearCount;
    }

    public void setYearCount(float yearCount) {
        this.yearCount = yearCount;
    }

    public float getEnought2() {
        return enought2;
    }

    public void setEnought2(float enought2) {
        this.enought2 = enought2;
    }

    public float getNotEnought2() {
        return notEnought2;
    }

    public void setNotEnought2(float notEnought2) {
        this.notEnought2 = notEnought2;
    }

    public float getSeniority() {
        return seniority;
    }

    public void setSeniority(float seniority) {
        this.seniority = seniority;
    }

}
