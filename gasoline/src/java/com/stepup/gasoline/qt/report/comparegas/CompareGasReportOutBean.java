/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparegas;

/**
 *
 * @author Administrator
 */
public class CompareGasReportOutBean {

    private double amountDebt;
    private double closingAmountDebt;
    private int shell12Debt;
    private int shell45Debt;
    private int closingShell12Debt;
    private int closingShell45Debt;
    private String customerCode;

    public double getAmountDebt() {
        return amountDebt;
    }

    public void setAmountDebt(double amountDebt) {
        this.amountDebt = amountDebt;
    }

    public double getClosingAmountDebt() {
        return closingAmountDebt;
    }

    public void setClosingAmountDebt(double closingAmountDebt) {
        this.closingAmountDebt = closingAmountDebt;
    }

    public int getShell12Debt() {
        return shell12Debt;
    }

    public void setShell12Debt(int shell12Debt) {
        this.shell12Debt = shell12Debt;
    }

    public int getShell45Debt() {
        return shell45Debt;
    }

    public void setShell45Debt(int shell45Debt) {
        this.shell45Debt = shell45Debt;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public int getClosingShell12Debt() {
        return closingShell12Debt;
    }

    public void setClosingShell12Debt(int closingShell12Debt) {
        this.closingShell12Debt = closingShell12Debt;
    }

    public int getClosingShell45Debt() {
        return closingShell45Debt;
    }

    public void setClosingShell45Debt(int closingShell45Debt) {
        this.closingShell45Debt = closingShell45Debt;
    }

}
