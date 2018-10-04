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
    public static int PER_EMPLOYEE = 3;
    public static int PER_USER = 4;
    public static int PER_PARAMTER = 5;
    public static int PER_ORGANIZATION = 6;
    public static int PER_STORE = 7;
    public static int PER_DYNAMIC_FIELD = 8;
    public static int PER_UNIT = 9;
    public static int PER_SHELL_KIND = 10;
    public static int PER_SHELL = 11;
    public static int PER_VENDOR = 12;
    public static int PER_ACCOUNT = 13;
    public static int PER_VEHICLE = 14;
    public static int PER_ROUTE = 15;
    public static int PER_ACCESSORY_KIND = 16;
    public static int PER_ACCESSORY = 17;
    public static int PER_PROMOTION_MATERIAL = 18;
    public static int PER_CUSTOMER = 19;
    public static int PER_EMPLOYEE_ADVANCE = 20;
    public static int PER_SALARY = 21;
    public static int PER_EMPLOYEE_TIMESHEET = 22;
    public static int PER_EMPLOYEE_OFF = 23;
    public static int PER_PETRO = 24;
    public static int PER_TRIP_FEE = 25;
    public static int PER_SHELL_IMPORT = 26;
    public static int PER_LPG_IMPORT = 27;
    public static int PER_FRACTION = 28;
    public static int PER_GAS_PRICE = 29;
    public static int PER_GAS_IMPORT = 30;
    public static int PER_ACCESSORY_IMPORT = 31;
    public static int PER_PROMOTION_MATERIAL_IMPORT = 32;
    public static int PER_PETRO_IMPORT = 33;
    public static int PER_GAS_WHOLESALE = 34;
    public static int PER_GAS_RETAIL = 35;
    public static int PER_SALE_ACCESSORY = 36;
    public static int PER_SALE_PETRO = 37;
    public static int PER_SALE_SHELL = 38;
    public static int PER_OLD_SHELL = 39;
    public static int PER_SHELL_RETURN = 40;
    public static int PER_GAS_RETURN = 41;
    public static int PER_SHELL_RETURN_SUPPLIER = 42;
    public static int PER_VEHICLE_OUT = 43;
    public static int PER_VEHICLE_IN = 44;
    public static int PER_EXPORT_WHOLESALE = 45;
    public static int PER_DEBT_VENDOR = 46;
    public static int PER_DEBT_RETAIL = 47;
    public static int PER_DEBT_WHOLESALE = 48;
    public static int PER_INCOME = 49;
    public static int PER_EXPENSE = 50;
    public static int PER_EMPLOYEE_OFF_INCREASE = 51;
    public static int PER_EMPLOYEE_OFF_MONEY = 52;
    public static int PER_FIXED_ASSET_GROUP = 53;
    public static int PER_FIXED_ASSET = 54;
    public static int PER_FIXED_ASSET_DEPRECIATION = 55;
    public static int PER_CONTRACT = 56;
    public static int PER_REPORT_LPG_IMPORT = 57;
    public static int PER_CUSTOMER_DOCUMENT = 58;
    public static int PER_LPG_SALE = 59;
    public static int PER_SHIELD_IMPORT = 60;
    public static int PER_SHIELD_DECREASE = 61;
    public static int PER_REPORT_LPG_STOCK = 62;
    public static int PER_REPORT_LPG_STOCK_SUM = 63;
    public static int PER_REPORT_SUM = 64;
    public static int PER_REPORT_COMPARE = 65;
    public static int PER_REPORT_SALE = 66;
    public static int PER_REPORT_SALE_CUSTOMER = 67;
}
