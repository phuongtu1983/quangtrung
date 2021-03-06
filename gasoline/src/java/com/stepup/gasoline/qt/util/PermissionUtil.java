/*
 * TMUtil.java
 *
 * Created on March 26, 2007, 11:08 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.util;

import com.stepup.core.util.NumberUtil;
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

//    public static boolean hasOneOfPermission(HttpServletRequest request, int operation, String functions) {
//        HttpSession session = request.getSession();
//        if ((session != null) && (session.getAttribute(Constants.PERMISSION_USER_LIST) != null)) {
//            ArrayList<ApplicationPermissionBean> arrPer = (ArrayList<ApplicationPermissionBean>) session.getAttribute(Constants.PERMISSION_USER_LIST);
//            ApplicationPermissionBean permission = null;
//            for (int i = 0; i < arrPer.size(); i++) {
//                permission = (ApplicationPermissionBean) arrPer.get(i);
//                if (permission.getOperation() == operation) {
//                    String[] p = functions.split(",");
//                    String func = "," + permission.getFunction() + ",";
//                    for (int j = 0; j < p.length; j++) {
//                        if (func.contains(',' + p[j] + ',')) {
//                            return true;
//                        }
//                    }
//                }
//            }
//        }
//        return false;
//    }
    public static boolean hasOneOfPermission(HttpServletRequest request, int operation, String functions) {
        boolean result = false;
        String[] p = functions.split(",");
        for (int j = 0; j < p.length; j++) {
            result = hasPermission(request, operation, NumberUtil.parseInt(p[j], 0));
            if (result) {
                return result;
            }
        }
        return false;
    }

    public static boolean hasOneOfPermission(HttpServletRequest request, String operations, int function) {
        boolean result = false;
        String[] o = operations.split(",");
        for (int j = 0; j < o.length; j++) {
            result = hasPermission(request, NumberUtil.parseInt(o[j], 0), function);
            if (result) {
                return result;
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
    public static int OPERATION_EDIT_PAST = 8;
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
    public static int PER_REPORT_CASH_BOOK = 68;
    public static int PER_REPORT_LPG_STOCK_SUM_ORGANIZATION = 69;
    public static int PER_CUSTOMER_DISCOUNT = 70;
    public static int PER_REPORT_PETRO_IMPORT = 71;
    public static int PER_REPORT_PETRO_SALE = 72;
    public static int PER_REPORT_PETRO_STOCK = 73;
    public static int PER_REPORT_PETRO_STOCK_STORE = 74;
    public static int PER_GOOD = 75;
    public static int PER_GOOD_IMPORT = 76;
    public static int PER_SALE_GOOD = 77;
    public static int PER_REPORT_COMPARE_GOOD = 78;
    public static int PER_REPORT_GAS_COMMISION = 79;
    public static int PER_REPORT_GAS_EMPLOYEE_COMMISION = 80;
    public static int PER_REPORT_VENDOR_DEBT = 81;
    public static int PER_LO_VO = 82;
    public static int PER_OPENING_STOCK_ACCESSORY = 83;
    public static int PER_REPORT_TRANSPORT_FEE = 84;
    public static int PER_REPORT_VEHICLE_FEE = 85;
    public static int PER_REPORT_COMPARE_VENDOR = 86;
    public static int PER_REPORT_VEHICLE_SALE = 87;
    public static int PER_REPORT_COMPARE_LPG = 88;
    public static int PER_REPORT_LPG_SALE = 89;
    public static int PER_TRANSPORT_SERVICE = 90;
    public static int PER_REPORT_TRANSPORT_SERVICE = 91;
    public static int PER_REPORT_COMPARE_GAS = 92;
    public static int PER_DEBT_ADJUSTMENT = 93;
    public static int PER_REPORT_COMPARE_LPG_VENDOR_CUSTOMER = 94;
    public static int PER_SALE_INNER = 95;
    public static int PER_GAS_WHOLESALE_FEE = 96;
    public static int PER_REPORT_SHELL = 97;
    public static int PER_DAY_OFF = 98;
    public static int PER_OTHER_BONUS = 99;
    public static int PER_PANELTY = 100;
    public static int PER_EMPLOYEE_OTHER_BONUS = 101;
    public static int PER_EMPLOYEE_PANELTY = 102;
    public static int PER_REPORT_EMPLOYEE_SALARY = 103;
    public static int PER_REPORT_EMPLOYEE_OFF = 104;
    public static int PER_REPORT_EMPLOYEE_WORKING = 105;
    public static int PER_EMPLOYEE_ROUTE_FEE = 106;
    public static int PER_REPORT_EMPLOYEE_VEHICLE_SALARY = 107;
    public static int PER_TRIP_OIL = 108;
    public static int PER_BORROW = 109;
    public static int PER_UNIT_RATE = 110;
    public static int PER_AGENCY = 111;
    public static int PER_OIL_GROUP = 112;
    public static int PER_OIL = 113;
    public static int PER_EMPLOYEE_COMMISSION = 114;
    public static int PER_AGENCTY_CUSTOMER_COMMISSION = 115;
    public static int PER_EMPLOYEE_OIL_COMMISSION = 116;
    public static int PER_OIL_IMPORT = 117;
    public static int PER_SALE_OIL = 118;
    public static int PER_REPORT_OIL_IMPORT = 119;
    public static int PER_REPORT_OIL_STOCK = 120;
    public static int PER_REPORT_OIL_STOCK_SUM = 121;
    public static int PER_REPORT_OIL_SALE = 122;
    public static int PER_REPORT_OIL_COMPARE = 123;
    public static int PER_REPORT_OIL_COMMISSION_AGENCY = 124;
    public static int PER_REPORT_OIL_VENDOR_STOCK = 125;
    public static int PER_SALE_OIL_RETURN = 126;
    public static int PER_SALE_OIL_RETURN_STORE = 127;
    public static int PER_OIL_EXPORT = 128;
    public static int PER_REPORT_OIL_VENDOR_DEBT = 129;
    public static int PER_INVOICE = 130;
    public static int PER_REPORT_OIL_COMMISSION_CUSTOMER = 131;
    public static int PER_REPORT_OIL_CUSTOMER_DEBT = 132;
    public static int PER_SOLAR_IMPORT = 133;
    public static int PER_SALE_SOLAR = 134;
    public static int PER_SOLAR_EXPORT = 135;
    public static int PER_SALE_SOLAR_RETURN = 136;
    public static int PER_SOLAR_GROUP = 137;
    public static int PER_SOLAR = 138;
    public static int PER_EMPLOYEE_SOLAR_COMMISSION = 139;
    public static int PER_SALE_SOLAR_RETURN_STORE = 140;
    public static int PER_REPORT_SOLAR_IMPORT = 141;
    public static int PER_REPORT_SOLAR_STOCK = 142;
    public static int PER_REPORT_SOLAR_STOCK_SUM = 143;
    public static int PER_REPORT_SOLAR_SALE = 144;
    public static int PER_REPORT_SOLAR_COMPARE = 145;
    public static int PER_REPORT_SOLAR_COMMISSION_AGENCY = 146;
    public static int PER_REPORT_SOLAR_VENDOR_STOCK = 147;
    public static int PER_REPORT_SOLAR_VENDOR_DEBT = 148;
    public static int PER_REPORT_SOLAR_COMMISSION_CUSTOMER = 149;
    public static int PER_REPORT_SOLAR_CUSTOMER_DEBT = 150;
    public static int PER_INVOICE_SOLAR = 151;
    public static int PER_OPENING_STOCK_CUSTOMER = 152;
    public static int PER_OPENING_STOCK_GOOD = 153;
    public static int PER_OPENING_STOCK_LPG = 154;
    public static int PER_OPENING_STOCK_CASH = 155;
    public static int PER_OPENING_STOCK_PETRO = 156;
    public static int PER_OPENING_STOCK_PROMOTION_MATERIAL = 157;
    public static int PER_OPENING_STOCK_GAS_SHELL = 158;
    public static int PER_OPENING_STOCK_SHELL = 159;
    public static int PER_OPENING_STOCK_SHIELD = 160;
    public static int PER_OPENING_STOCK_VENDOR = 161;
    public static int PER_OPENING_STOCK_OIL = 162;
    public static int PER_OPENING_STOCK_SOLAR = 163;
    public static int PER_REPORT_CASH_BOOK_MODULE = 164;
    public static int PER_REPORT_PETRO_SALE_CUSTOMER = 165;
    public static int PER_REPORT_OIL_SALE_CUSTOMER = 166;
    public static int PER_REPORT_SOLAR_SALE_CUSTOMER = 167;
}
