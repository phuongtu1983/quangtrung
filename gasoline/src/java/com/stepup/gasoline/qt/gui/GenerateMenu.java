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
//                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PARAMTER)) {
//                    buffTemp.append("<item id=\"parameter\" text=\"").append(QTUtil.getBundleString("parameter.title")).append("\"/>");//parameter
//                }
                if (isHasPermission(PermissionUtil.OPERATION_LIST, PermissionUtil.PER_PERMISSION)) {
                    buffTemp.append("<item id=\"permissionlist\" text=\"").append(QTUtil.getBundleString("permission.title")).append("\"/>");//permission
                }
                buffTemp.append("</item>");//end system
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
