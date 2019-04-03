/*
 * TMUtil.java
 *
 * Created on March 26, 2007, 11:08 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.util;

import com.stepup.core.auth.OnlineUser;
import com.stepup.core.util.DateUtil;
import com.stepup.core.util.StringUtil;
import java.io.File;
import java.util.Calendar;
import java.util.ResourceBundle;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.validator.GenericValidator;

/**
 *
 * @author Administrator
 */
public class QTUtil {

    final public static String storageRoot = "storage";

    /**
     * Creates a new instance of TMUtil
     */
    public QTUtil() {
    }

    public static String getBundleString(String key) {
        return ResourceBundle.getBundle("resources").getString(key);
    }

    public static String displayMemberInfo(OnlineUser member, boolean isShowLastLogon) {
        if (member == null) {
            return getBundleString("message.welcomedefault");
        }
        String str = getBundleString("message.welcome");
        if (StringUtil.isBlankOrNull(member.getFullName())) {
            str = str + " <span class=\"userstyle\">" + member.getName() + "</span>";
        } else {
            str = str + " <span class=\"userstyle\">" + member.getFullName() + "</span>";
        }
        return str;

    }

    public static int getMemberID(HttpSession session) {
        int memberid = -1;
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            memberid = user.getID();
        }
        return memberid;
    }

    public static int getEmployeeId(HttpSession session) {
        int employeeId = -1;
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            employeeId = user.getEmployeeId();
        }
        return employeeId;
    }

    public static String getMemberIPAdress(HttpSession session) {
        String ip = "";
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            ip = user.getIpAddress();
        }
        return ip;
    }

    public static String getMemberFullName(HttpSession session) {
        String fullName = "";
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            fullName = user.getFullName();
        }
        return fullName;
    }

    public static String getMemberFirstName(HttpSession session) {
        String fullName = "";
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            fullName = user.getFullName();
            if (!GenericValidator.isBlankOrNull(fullName)) {
                int ind = fullName.lastIndexOf(" ");
                if (ind > -1) {
                    fullName = fullName.substring(ind);
                }
            }
        }
        return fullName;
    }

    public static String getMemberName(HttpSession session) {
        String memberName = "";
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            memberName = user.getName();
        }
        return memberName;
    }

    public static int getOrganizationId(HttpSession session) {
        int organizationId = 0;
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            OnlineUser user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
            organizationId = user.getOrganizationId();
        }
        return organizationId;
    }

    public static String getOrganizationManageds(HttpSession session) {
        if ((session != null) && (session.getAttribute(Constants.PERMISSION_ORGANIZATION_MANAGED) != null)) {
            return (String) session.getAttribute(Constants.PERMISSION_ORGANIZATION_MANAGED);
        }
        return "";
    }

    public static OnlineUser getOnlineUser(HttpSession session) {
        OnlineUser user = null;
        if ((session != null) && (session.getAttribute(Constants.EMPLOYEE_OBJ) != null)) {
            user = (OnlineUser) session.getAttribute(Constants.EMPLOYEE_OBJ);
        }
        return user;
    }

    public static String getParameter(String parameter, HttpServletRequest request) {
        String retStr = "";
        if (!StringUtil.isBlankOrNull(parameter)) {
            retStr = request.getParameter(parameter);
            if (StringUtil.isBlankOrNull(retStr)) {
                retStr = (String) request.getAttribute(parameter);
                if (StringUtil.isBlankOrNull(retStr)) {
                    retStr = (String) request.getSession().getAttribute(parameter);
                    if (StringUtil.isBlankOrNull(retStr)) {
                        retStr = "";
                    }
                }
            }
        }
        return retStr;
    }

    public static void createFullFolder(String pathName) {
        String str = pathName.replace('\\', '/');
        StringTokenizer token = new StringTokenizer(str, "/");
        String dir = "";
        while (token.hasMoreTokens()) {
            str = token.nextToken();
            if (str.indexOf(':') == 1) {
                dir = str;
            } else {
                dir = dir + "/" + str;
                try {
                    new File(dir).mkdir();
                } catch (Exception ex) {
                }
            }
        }
    }

    public static String getFileName(String pathName) {
        String pthName = pathName.replace('\\', '/');
        return pthName.substring(pthName.lastIndexOf('/') + 1);
    }

    public static String getSpaces(int length) {
        String str = "";
        for (int i = 0; i < length; i++) {
            str += "&nbsp;";
        }
        return str;
    }

    public static String getMenuSpaces(int length, HttpServletRequest request) {
        String uagent = request.getHeader("user-agent");
        if (uagent.indexOf("Firefox") == -1) {
            return "";
        }
        String str = "";
        for (int i = 0; i < length; i++) {
            str += "&nbsp;";
        }
        return str;
    }

    public static boolean isInSet(int value, int[] arrValues) {
        for (int i = 0; i < arrValues.length; i++) {
            if (value == arrValues[i]) {
                return true;
            }
        }
        return false;
    }

    public static boolean isInSet(String value, String[] arrValues) {
        for (int i = 0; i < arrValues.length; i++) {
            if (value.equals(arrValues[i])) {
                return true;
            }
        }
        return false;
    }

    public static int getActualOff(String fromDate, String toDate) {
        int result = 1;
        try {
            Calendar fromC = Calendar.getInstance();
            fromC.setTime(DateUtil.convertStringToDate(fromDate, "dd/MM/yyyy"));

            Calendar toC = Calendar.getInstance();
            toC.setTime(DateUtil.convertStringToDate(toDate, "dd/MM/yyyy"));

            while (toC.after(fromC)) {
                if (fromC.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                    result++;
                }
                fromC.add(Calendar.DATE, 1);
            }
        } catch (Exception ex) {

        }
        return result;
    }
}
