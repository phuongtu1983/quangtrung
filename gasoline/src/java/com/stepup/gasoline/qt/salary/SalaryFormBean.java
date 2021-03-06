/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salary;

import com.stepup.gasoline.qt.bean.SalaryBean;

/**
 *
 * @author phuongtu
 */
public class SalaryFormBean extends org.apache.struts.action.ActionForm {

    private int id;
    private String code;
    private String createdDate;
    private int organizationId;
    private int employeeId;
    private String employeeName;
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
    private String[] salaryFieldId;
    private String[] amount;
    private String[] note;

    public SalaryFormBean() {
    }

    public SalaryFormBean(SalaryBean bean) {
        this.id = bean.getId();
        this.code = bean.getCode();
        this.createdDate = bean.getCreatedDate();
        this.employeeId = bean.getEmployeeId();
        this.basicSalary = bean.getBasicSalary();
        this.realSalary = bean.getRealSalary();
        this.total = bean.getTotal();
        this.monthDay = bean.getMonthDay();
        this.workingDay = bean.getWorkingDay();
        this.commission = bean.getCommission();
        this.bonus = bean.getBonus();
        this.bhxh = bean.getBhxh();
        this.advance = bean.getAdvance();
        this.panelty = bean.getPanelty();
        this.seniority = bean.getSeniority();
        this.actualReceived = bean.getActualReceived();
        this.fieldAmount = bean.getFieldAmount();
        this.timesheetAmount = bean.getTimesheetAmount();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
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

    public int getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(int organizationId) {
        this.organizationId = organizationId;
    }

    public String[] getSalaryFieldId() {
        return salaryFieldId;
    }

    public void setSalaryFieldId(String[] salaryFieldId) {
        this.salaryFieldId = salaryFieldId;
    }

    public String[] getAmount() {
        return amount;
    }

    public void setAmount(String[] amount) {
        this.amount = amount;
    }

    public String[] getNote() {
        return note;
    }

    public void setNote(String[] note) {
        this.note = note;
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
