/*
 * OnlineUserImpl.java
 *
 * Created on March 21, 2007, 4:49 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.auth;

import com.stepup.core.auth.OnlineUser;

/**
 *
 * @author Administrator
 */
public class OnlineUserImpl implements OnlineUser {

    private int memberID;
    private String memberName;
    private String fullName;
    private String email;
    private int employeeId;
    private String ipAddress;

    /** Creates a new instance of OnlineUserImpl */
    public OnlineUserImpl() {
    }

    public void setID(int memberID) {
        this.memberID = memberID;
    }

    @Override
    public int getID() {
        return memberID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String getFullName() {
        return fullName;
    }

    public void setName(String memberName) {
        this.memberName = memberName;
    }

    @Override
    public String getName() {
        return memberName;
    }

    @Override
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    @Override
    public boolean hasPermission(String func, String type) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
