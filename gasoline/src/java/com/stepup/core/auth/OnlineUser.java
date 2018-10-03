/*
 * OnlineUser.java
 *
 * Created on March 21, 2007, 10:30 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.core.auth;

/**
 *
 * @author Administrator
 */
public interface OnlineUser {

    public abstract int getID();

    public abstract int getEmployeeId();

    public abstract String getName();

    public abstract String getFullName();

    public abstract String getEmail();

    public abstract String getIpAddress();

    public abstract int getOrganizationId();

    public abstract boolean hasPermission(String func, String type);
}
