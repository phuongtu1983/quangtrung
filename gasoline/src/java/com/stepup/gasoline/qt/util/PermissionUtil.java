/*
 * TMUtil.java
 *
 * Created on March 26, 2007, 11:08 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.util;

import com.stepup.gasoline.qt.permission.ApplicationPermissionBean;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class PermissionUtil {

    /**
     * Creates a new instance of TMUtil
     */
    public PermissionUtil() {
    }

    public static boolean hasPermission(HttpServletRequest request, int operation, int function) {
        HttpSession session = request.getSession();
        if ((session != null) && (session.getAttribute(Constants.PERMISSION_USER_LIST) != null)) {
            ArrayList<ApplicationPermissionBean> arrPer = (ArrayList<ApplicationPermissionBean>) session.getAttribute(Constants.PERMISSION_USER_LIST);
            ApplicationPermissionBean permission = null;
            for (int i = 0; i < arrPer.size(); i++) {
                permission = (ApplicationPermissionBean) arrPer.get(i);
                if (permission.getOperation() == operation) {
                    String func = "," + permission.getFunction() + ",";
                    if (func.contains("," + function + ",")) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static boolean hasOneOfPermission(HttpServletRequest request, int operation, String functions) {
        HttpSession session = request.getSession();
        if ((session != null) && (session.getAttribute(Constants.PERMISSION_USER_LIST) != null)) {
            ArrayList<ApplicationPermissionBean> arrPer = (ArrayList<ApplicationPermissionBean>) session.getAttribute(Constants.PERMISSION_USER_LIST);
            ApplicationPermissionBean permission = null;
            for (int i = 0; i < arrPer.size(); i++) {
                permission = (ApplicationPermissionBean) arrPer.get(i);
                if (permission.getOperation() == operation) {
                    String[] p = functions.split(",");
                    String func = "," + permission.getFunction() + ",";
                    for (int j = 0; j < p.length; j++) {
                        if (func.contains(',' + p[j] + ',')) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public static String getPermissionIds(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String ids = "0";
        if ((session != null) && (session.getAttribute(Constants.PERMISSION_USER_LIST) != null)) {
            ArrayList<ApplicationPermissionBean> arrPer = (ArrayList<ApplicationPermissionBean>) session.getAttribute(Constants.PERMISSION_USER_LIST);
            ApplicationPermissionBean permission = null;
            for (int i = 0; i < arrPer.size(); i++) {
                permission = (ApplicationPermissionBean) arrPer.get(i);
                ids += "," + permission.getPerId();
            }
        }
        return ids;
    }
    //operation
    public static int OPERATION_LIST = 1;
    public static int OPERATION_ADD = 2;
    public static int OPERATION_DELETE = 3;//3
    public static int OPERATION_EDIT = 4;//4
//    public static int OPERATION_VIEW = 5;//5
    public static int OPERATION_PRINT = 6;
    public static int OPERATION_OTHER = 7;
    //function
    public static int PER_PERMISSION = 1;
//    public static int PER_LOG = 2;
//    public static int PER_EMPLOYEE = 3;
    public static int PER_USER = 4;
    public static int PER_PARAMTER = 5;
    public static int PER_ORGANIZATION = 6;

}
