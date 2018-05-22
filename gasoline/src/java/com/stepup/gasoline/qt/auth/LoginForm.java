/*
 * LoginForm.java
 *
 * Created on December 8, 2006, 11:40 AM
 */
package com.stepup.gasoline.qt.auth;

public class LoginForm extends org.apache.struts.action.ActionForm {

    private String username;
    private String password;
    private String md5pw;
    private String remember;

    public LoginForm() {
    }

    public String getMd5pw() {
        return md5pw;
    }

    public void setMd5pw(String md5pw) {
        this.md5pw = md5pw;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRemember() {
        return remember;
    }

    public void setRemember(String remember) {
        this.remember = remember;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
