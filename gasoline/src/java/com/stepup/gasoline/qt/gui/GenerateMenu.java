/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gui;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.permission.ApplicationPermissionBean;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.util.PermissionUtil;
import java.util.ArrayList;

/**
 *
 * @author phuongtu
 */
public class GenerateMenu {

    private ArrayList<ApplicationPermissionBean> arrPer = null;

    public void generate(int memberId) {
        try {

            PermissionDAO permissionDAO = new PermissionDAO();
            arrPer = permissionDAO.getPermissionsOfEmployee(memberId);

            StringBuilder buff = new StringBuilder();
            buff.append("<?xml version=\"1.0\"?>");
            buff.append("<menu>");

            StringBuilder buffTemp = new StringBuilder();

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_PERMISSION + "," + PermissionUtil.PER_USER + "," + PermissionUtil.PER_PARAMTER)) {
                buffTemp.append("<item id=\"system\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.system")).append("\">");//start system
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_USER)) {
                    buffTemp.append("<item id=\"users\" complex=\"true\" text=\"").append(QTUtil.getBundleString("user.title")).append("\">");//start users
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_USER)) {
                        buffTemp.append("<item id=\"userlist\" text=\"").append(QTUtil.getBundleString("user.list.title")).append("\"/>");//list user
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_USER)) {
                        buffTemp.append("<item id=\"useradd\" text=\"").append(QTUtil.getBundleString("user.detail.add.title")).append("\"/>");//add user
                    }
                    buffTemp.append("</item>");//end users
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PARAMTER)) {
                    buffTemp.append("<item id=\"parameter\" text=\"").append(QTUtil.getBundleString("parameter.title")).append("\"/>");//parameter
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PERMISSION)) {
                    buffTemp.append("<item id=\"permissionlist\" text=\"").append(QTUtil.getBundleString("permission.title")).append("\"/>");//permission
                }
                buffTemp.append("</item>");//end system
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_ORGANIZATION + "," + PermissionUtil.PER_STORE + "," + PermissionUtil.PER_EMPLOYEE + "," + PermissionUtil.PER_ACCOUNT)) {
                buffTemp.append("<item id=\"organization\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.organization")).append("\">");//start organization
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {
                    buffTemp.append("<item id=\"organizations\" complex=\"true\" text=\"").append(QTUtil.getBundleString("organization.title")).append("\">");//start organizations
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ORGANIZATION)) {
                        buffTemp.append("<item id=\"organizationlist\" text=\"").append(QTUtil.getBundleString("organization.list.title")).append("\"/>");//list organization
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {
                        buffTemp.append("<item id=\"organizationadd\" text=\"").append(QTUtil.getBundleString("organization.detail.add.title")).append("\"/>");//add organization
                    }
                    buffTemp.append("</item>");//end organizations
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_STORE)) {
                    buffTemp.append("<item id=\"stores\" complex=\"true\" text=\"").append(QTUtil.getBundleString("store.title")).append("\">");//start stores
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_STORE)) {
                        buffTemp.append("<item id=\"storelist\" text=\"").append(QTUtil.getBundleString("store.list.title")).append("\"/>");//list store
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_STORE)) {
                        buffTemp.append("<item id=\"storeadd\" text=\"").append(QTUtil.getBundleString("store.detail.add.title")).append("\"/>");//add store
                    }
                    buffTemp.append("</item>");//end stores
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {
                    buffTemp.append("<item id=\"employees\" complex=\"true\" text=\"").append(QTUtil.getBundleString("employee.title")).append("\">");//start employees
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_EMPLOYEE)) {
                        buffTemp.append("<item id=\"employeelist\" text=\"").append(QTUtil.getBundleString("employee.list.title")).append("\"/>");//list employee
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {
                        buffTemp.append("<item id=\"employeeadd\" text=\"").append(QTUtil.getBundleString("employee.detail.add.title")).append("\"/>");//add employee
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"employeefiellist\" text=\"").append(QTUtil.getBundleString("employee.field.title")).append("\"/>");//add employee field
                    }
                    buffTemp.append("</item>");//end employees
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCOUNT)) {
                    buffTemp.append("<item id=\"accounts\" complex=\"true\" text=\"").append(QTUtil.getBundleString("account.title")).append("\">");//start accounts
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_ACCOUNT)) {
                        buffTemp.append("<item id=\"accountlist\" text=\"").append(QTUtil.getBundleString("account.list.title")).append("\"/>");//list account
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCOUNT)) {
                        buffTemp.append("<item id=\"accountadd\" text=\"").append(QTUtil.getBundleString("account.detail.add.title")).append("\"/>");//add account
                    }
                    buffTemp.append("</item>");//end accounts
                }
                buffTemp.append("</item>");//end organization
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_UNIT + "," + PermissionUtil.PER_SHELL_KIND + "," + PermissionUtil.PER_SHELL)) {
                buffTemp.append("<item id=\"good\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.good")).append("\">");//start good
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_UNIT)) {
                    buffTemp.append("<item id=\"units\" complex=\"true\" text=\"").append(QTUtil.getBundleString("unit.title")).append("\">");//start units
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_UNIT)) {
                        buffTemp.append("<item id=\"unitlist\" text=\"").append(QTUtil.getBundleString("unit.list.title")).append("\"/>");//list unit
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_UNIT)) {
                        buffTemp.append("<item id=\"unitadd\" text=\"").append(QTUtil.getBundleString("unit.detail.add.title")).append("\"/>");//add unit
                    }
                    buffTemp.append("</item>");//end units
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_KIND)) {
                    buffTemp.append("<item id=\"shellkinds\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shellKind.title")).append("\">");//start shell kind
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL_KIND)) {
                        buffTemp.append("<item id=\"shellkindlist\" text=\"").append(QTUtil.getBundleString("shellKind.list.title")).append("\"/>");//list shell kind
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_KIND)) {
                        buffTemp.append("<item id=\"shellkindadd\" text=\"").append(QTUtil.getBundleString("shellKind.detail.add.title")).append("\"/>");//add shell kind
                    }
                    buffTemp.append("</item>");//end shell kinds
                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL)) {
                    buffTemp.append("<item id=\"shells\" complex=\"true\" text=\"").append(QTUtil.getBundleString("shell.title")).append("\">");//start shell
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_SHELL)) {
                        buffTemp.append("<item id=\"shelllist\" text=\"").append(QTUtil.getBundleString("shell.list.title")).append("\"/>");//list shell
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL)) {
                        buffTemp.append("<item id=\"shelladd\" text=\"").append(QTUtil.getBundleString("shell.detail.add.title")).append("\"/>");//add shell
                    }
                    buffTemp.append("</item>");//end shells
                }
                buffTemp.append("</item>");//end good
            }

            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_VENDOR)) {
                buffTemp.append("<item id=\"vendor\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.vendor")).append("\">");//start vendor
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {
                    buffTemp.append("<item id=\"vendors\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vendor.title")).append("\">");//start vendors
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendorlist\" text=\"").append(QTUtil.getBundleString("vendor.list.title")).append("\"/>");//list vendor
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {
                        buffTemp.append("<item id=\"vendoradd\" text=\"").append(QTUtil.getBundleString("vendor.detail.add.title")).append("\"/>");//add vendor
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {
                        buffTemp.append("<item id=\"vendorfiellist\" text=\"").append(QTUtil.getBundleString("vendor.field.title")).append("\"/>");//add vendor field
                    }
                    buffTemp.append("</item>");//end vendors
                }
                buffTemp.append("</item>");//end vendor
            }
            
            if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD,
                    PermissionUtil.PER_VEHICLE)) {
                buffTemp.append("<item id=\"other\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.other")).append("\">");//start other
                if (isHasPermission(PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE)) {
                    buffTemp.append("<item id=\"vehicles\" complex=\"true\" text=\"").append(QTUtil.getBundleString("vehicle.title")).append("\">");//start vehicles
                    if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_VEHICLE)) {
                        buffTemp.append("<item id=\"vehiclelist\" text=\"").append(QTUtil.getBundleString("vehicle.list.title")).append("\"/>");//list vehicle
                    }
                    if (isHasPermission(PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE)) {
                        buffTemp.append("<item id=\"vehicleadd\" text=\"").append(QTUtil.getBundleString("vehicle.detail.add.title")).append("\"/>");//add vehicle
                    }
                    buffTemp.append("</item>");//end vehicles
                }
                buffTemp.append("</item>");//end other
            }

            if (buffTemp.length() > 0) {
                buff.append("<item id=\"list\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.list.title")).append("\">");//start list
                buff.append(buffTemp);
                buff.append("</item>");//end list
            }
            buffTemp = new StringBuilder();

            buff.append("<item id=\"setting\" complex=\"true\" text=\"").append(QTUtil.getBundleString("menu.admin.setting.title")).append("\">");//start setting
            buff.append("<item id=\"resetpassword\" text=\"").append(QTUtil.getBundleString("message.passwordform.title")).append("\"/>");//reset pasword
            buff.append("</item>");//end setting
            buff.append("<item id=\"logout\" text=\"").append(QTUtil.getBundleString("logout.title")).append("\"/>");//logout
            buff.append("</menu>");

            UserDAO userDAO = new UserDAO();
            userDAO.updateUserMenu(memberId, buff.toString());
        } catch (Exception ex) {
        }
    }

    private boolean isHasPermission(int operation, String functions) {
        try {
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
        } catch (Exception ex) {
        }
        return false;
    }

    private boolean isHasPermission(String operations, String functions) {
        try {
            ApplicationPermissionBean permission = null;
            String[] opes = operations.split(",");
            for (int i = 0; i < arrPer.size(); i++) {
                permission = (ApplicationPermissionBean) arrPer.get(i);
                for (int k = 0; k < opes.length; k++) {
                    if (permission.getOperation() == NumberUtil.parseInt(opes[k], 0)) {
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
        } catch (Exception ex) {
        }
        return false;
    }

    private boolean isHasPermission(int operation, int function) {
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
        return false;
    }

    private boolean isHasPermission(String operations, int function) {
        ApplicationPermissionBean permission = null;
        String[] opes = operations.split(",");
        for (int i = 0; i < arrPer.size(); i++) {
            permission = (ApplicationPermissionBean) arrPer.get(i);
            for (int k = 0; k < opes.length; k++) {
                if (permission.getOperation() == NumberUtil.parseInt(opes[k], 0)) {
                    String func = "," + permission.getFunction() + ",";
                    if (func.contains("," + function + ",")) {
                        return true;
                    }
                }
            }

        }
        return false;
    }
}
