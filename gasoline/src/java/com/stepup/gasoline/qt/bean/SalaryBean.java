/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.bean;

/**
 *
 * @author phuongtu
 */
public class SalaryBean {

    private int id;
    private String code;
    private String createdDate;
    private int employeeId;
    private double basicSalary;
    private double realSalary;
    private double total;
    private int monthDay;
    private int workingDay;
    private double commission;
    private double bonus;
    private double bhxh;
    private double advance;
    private double panelty;
    private double seniority;
    private double actualReceived;
    private double fieldAmount;
    private double timesheetAmount;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }

    public double getRealSalary() {
        return realSalary;
    }

    public void setRealSalary(double realSalary) {
        this.realSalary = realSalary;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getMonthDay() {
        return monthDay;
    }

    public void setMonthDay(int monthDay) {
        this.monthDay = monthDay;
    }

    public int getWorkingDay() {
        return workingDay;
    }

    public void setWorkingDay(int workingDay) {
        this.workingDay = workingDay;
    }

    public double getCommission() {
        return commission;
    }

    public void setCommission(double commission) {
        this.commission = commission;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getBhxh() {
        return bhxh;
    }

    public void setBhxh(double bhxh) {
        this.bhxh = bhxh;
    }

    public double getActualReceived() {
        return actualReceived;
    }

    public void setActualReceived(double actualReceived) {
        this.actualReceived = actualReceived;
    }

    public double getAdvance() {
        return advance;
    }

    public void setAdvance(double advance) {
        this.advance = advance;
    }

    public double getPanelty() {
        return panelty;
    }

    public void setPanelty(double panelty) {
        this.panelty = panelty;
    }

    public double getSeniority() {
        return seniority;
    }

    public void setSeniority(double seniority) {
        this.seniority = seniority;
    }

    public double getFieldAmount() {
        return fieldAmount;
    }

    public void setFieldAmount(double fieldAmount) {
        this.fieldAmount = fieldAmount;
    }

    public double getTimesheetAmount() {
        return timesheetAmount;
    }

    public void setTimesheetAmount(double timesheetAmount) {
        this.timesheetAmount = timesheetAmount;
    }

}
