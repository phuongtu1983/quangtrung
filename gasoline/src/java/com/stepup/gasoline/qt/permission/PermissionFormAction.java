/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.bean.PermissionDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.PermissionDAO;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.util.PermissionUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class PermissionFormAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        PermissionFormBean formBean = null;
        String id = request.getParameter("id");
        PermissionDAO permissionDAO = new PermissionDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                PermissionBean bean = permissionDAO.getPermission(Integer.parseInt(id));
                if (bean != null) {
                    formBean = new PermissionFormBean(bean);
                }
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new PermissionFormBean();
        }
        request.setAttribute(Constants.PERMISSION, formBean);

        ArrayList arrDet = null;
        try {
            arrDet = permissionDAO.getPermissionDetails(formBean.getPerId());
            PermissionDetailBean detBean = null;
            for (int i = 0; i < arrDet.size(); i++) {
                detBean = (PermissionDetailBean) arrDet.get(i);
                if (detBean.getOperation() == PermissionUtil.OPERATION_LIST) {
                    formBean.setFuncList(detBean.getFunction().split(","));
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_ADD) {
                    formBean.setFuncAdd(detBean.getFunction().split(","));
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_DELETE) {
                    formBean.setFuncDelete(detBean.getFunction().split(","));
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_EDIT) {
                    formBean.setFuncEdit(detBean.getFunction().split(","));
//                } else if (detBean.getOperation() == PermissionUtil.OPERATION_VIEW) {
//                    formBean.setFuncView(detBean.getFunction().split(","));
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_PRINT) {
                    formBean.setFuncPrint(detBean.getFunction().split(","));
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_OTHER) {
                    formBean.setFuncOther(detBean.getFunction().split(","));
                }
            }
        } catch (Exception ex) {
        }

        ArrayList arrEmp = new ArrayList();
        try {
            UserDAO empDAO = new UserDAO();
            arrEmp = empDAO.getUsers(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrEmp == null) {
            arrEmp = new ArrayList();
        }
        request.setAttribute(Constants.USER_LIST, arrEmp);

        ArrayList arrPerEmp = null;
        if (formBean.getPerId() != 0) {
            try {
                arrPerEmp = permissionDAO.getPermissionEmp(formBean.getPerId());
            } catch (Exception ex) {
            }
        }

        if (arrPerEmp == null) {
            arrPerEmp = new ArrayList();
        }
        request.setAttribute(Constants.PERMISSION_EMP_LIST, arrPerEmp);

        ArrayList arrFun = new ArrayList();
        PermissionViewBean perBean;

        perBean = new PermissionViewBean();
        perBean.setCounter("1");
        perBean.setLevel(1);
        perBean.setSharedId(1);
        perBean.setName(QTUtil.getBundleString("permission.title"));
        perBean.setValue(PermissionUtil.PER_PERMISSION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD
                + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2");
        perBean.setLevel(0);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("permission.list.title"));
        perBean.setValue(0);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("parameter.title"));
        perBean.setValue(PermissionUtil.PER_PARAMTER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("dynamicField.title"));
        perBean.setValue(PermissionUtil.PER_DYNAMIC_FIELD);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("organization.title"));
        perBean.setValue(PermissionUtil.PER_ORGANIZATION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("store.title"));
        perBean.setValue(PermissionUtil.PER_STORE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employee.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("user.title"));
        perBean.setValue(PermissionUtil.PER_USER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("unit.title"));
        perBean.setValue(PermissionUtil.PER_UNIT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellKind.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_KIND);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shell.title"));
        perBean.setValue(PermissionUtil.PER_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        request.setAttribute(Constants.PERMISSION_FUNC_LIST, arrFun);

        return true;
    }
}
