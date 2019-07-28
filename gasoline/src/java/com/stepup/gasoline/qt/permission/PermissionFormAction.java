/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.PermissionBean;
import com.stepup.gasoline.qt.bean.PermissionDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
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
                PermissionBean bean = permissionDAO.getPermission(NumberUtil.parseInt(id, 0));
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
                } else if (detBean.getOperation() == PermissionUtil.OPERATION_EDIT_PAST) {
                    formBean.setFuncEditPast(detBean.getFunction().split(","));
                }
            }
        } catch (Exception ex) {
        }

        ArrayList arrEmp = new ArrayList();
        try {
            UserDAO empDAO = new UserDAO();
            arrEmp = empDAO.getUsers(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrEmp == null) {
            arrEmp = new ArrayList();
        }
        request.setAttribute(Constants.USER_LIST, arrEmp);

        ArrayList arrOrg = new ArrayList();
        try {
            OrganizationDAO orgDAO = new OrganizationDAO();
            arrOrg = orgDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOrg == null) {
            arrOrg = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrg);

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

        ArrayList arrPerOrg = null;
        if (formBean.getPerId() != 0) {
            try {
                arrPerOrg = permissionDAO.getPermissionOrg(formBean.getPerId());
            } catch (Exception ex) {
            }
        }

        if (arrPerOrg == null) {
            arrPerOrg = new ArrayList();
        }
        request.setAttribute(Constants.PERMISSION_ORG_LIST, arrPerOrg);

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
        perBean.setName(QTUtil.getBundleString("message.permission.func.list"));
        perBean.setValue(0);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_PRINT + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
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
        perBean.setCounter("2.2");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("openingStock.title"));
        perBean.setValue(PermissionUtil.PER_OPENING_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.3");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("dynamicField.title"));
        perBean.setValue(PermissionUtil.PER_DYNAMIC_FIELD);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.4");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("organization.title"));
        perBean.setValue(PermissionUtil.PER_ORGANIZATION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.5");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("store.title"));
        perBean.setValue(PermissionUtil.PER_STORE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.6");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employee.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.7");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("user.title"));
        perBean.setValue(PermissionUtil.PER_USER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.8");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("unit.title"));
        perBean.setValue(PermissionUtil.PER_UNIT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.9");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellKind.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_KIND);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.10");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shell.title"));
        perBean.setValue(PermissionUtil.PER_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.11");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vendor.title"));
        perBean.setValue(PermissionUtil.PER_VENDOR);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.12");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("account.title"));
        perBean.setValue(PermissionUtil.PER_ACCOUNT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.13");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("dayoff.title"));
        perBean.setValue(PermissionUtil.PER_DAY_OFF);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.14");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("otherBonus.title"));
        perBean.setValue(PermissionUtil.PER_OTHER_BONUS);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.15");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("panelty.title"));
        perBean.setValue(PermissionUtil.PER_PANELTY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.16");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicle.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.17");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedassetgroup.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET_GROUP);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.18");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedasset.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.19");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("route.title"));
        perBean.setValue(PermissionUtil.PER_ROUTE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.20");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessoryKind.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY_KIND);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.21");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessory.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.22");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("promotionMaterial.title"));
        perBean.setValue(PermissionUtil.PER_PROMOTION_MATERIAL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.23");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("customer.title"));
        perBean.setValue(PermissionUtil.PER_CUSTOMER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.24");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("customerDocument.title"));
        perBean.setValue(PermissionUtil.PER_CUSTOMER_DOCUMENT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.25");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("customerDiscount.title"));
        perBean.setValue(PermissionUtil.PER_CUSTOMER_DISCOUNT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.26");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeAdvance.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_ADVANCE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.27");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("borrow.title"));
        perBean.setValue(PermissionUtil.PER_BORROW);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.28");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeTimesheet.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_TIMESHEET);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.29");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOff.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.30");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOffIncrease.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF_INCREASE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.31");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOffMoney.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF_MONEY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.32");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employee.title") + " - " + QTUtil.getBundleString("otherBonus.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OTHER_BONUS);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.33");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employee.title") + " - " + QTUtil.getBundleString("panelty.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_PANELTY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.34");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("salary.title"));
        perBean.setValue(PermissionUtil.PER_SALARY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.35");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("petro.title"));
        perBean.setValue(PermissionUtil.PER_PETRO);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.36");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("good.title"));
        perBean.setValue(PermissionUtil.PER_GOOD);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.37");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("unitRate.title"));
        perBean.setValue(PermissionUtil.PER_UNIT_RATE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.38");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("agency.title"));
        perBean.setValue(PermissionUtil.PER_AGENCY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.39");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oilGroup.title"));
        perBean.setValue(PermissionUtil.PER_OIL_GROUP);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.40");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOilCommission.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OIL_COMMISSION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.41");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oil.title"));
        perBean.setValue(PermissionUtil.PER_OIL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.42");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("tripFee.title"));
        perBean.setValue(PermissionUtil.PER_TRIP_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.43");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("tripOil.title"));
        perBean.setValue(PermissionUtil.PER_TRIP_OIL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.44");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeRouteFee.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_ROUTE_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.45");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellImport.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.46");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("lpgImport.title"));
        perBean.setValue(PermissionUtil.PER_LPG_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.47");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("lpgSale.title"));
        perBean.setValue(PermissionUtil.PER_LPG_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.48");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fraction.title"));
        perBean.setValue(PermissionUtil.PER_FRACTION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.49");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasPrice.title"));
        perBean.setValue(PermissionUtil.PER_GAS_PRICE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.50");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasImport.title"));
        perBean.setValue(PermissionUtil.PER_GAS_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.51");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessoryImport.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.52");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("promotionMaterialImport.title"));
        perBean.setValue(PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.53");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("petroImport.title"));
        perBean.setValue(PermissionUtil.PER_PETRO_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.54");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("salePetro.title"));
        perBean.setValue(PermissionUtil.PER_SALE_PETRO);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.55");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oilImport.title"));
        perBean.setValue(PermissionUtil.PER_OIL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("2.56");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oilExport.title"));
        perBean.setValue(PermissionUtil.PER_OIL_EXPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.57");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleOil.title"));
        perBean.setValue(PermissionUtil.PER_SALE_OIL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.58");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleOilReturn.title"));
        perBean.setValue(PermissionUtil.PER_SALE_OIL_RETURN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.59");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleOilReturnStore.title"));
        perBean.setValue(PermissionUtil.PER_SALE_OIL_RETURN_STORE);
        perBean.setOperations("," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.60");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("goodImport.title"));
        perBean.setValue(PermissionUtil.PER_GOOD_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.61");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleGood.title"));
        perBean.setValue(PermissionUtil.PER_SALE_GOOD);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.62");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasWholesale.title"));
        perBean.setValue(PermissionUtil.PER_GAS_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.63");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasWholeSale.fee.list.title"));
        perBean.setValue(PermissionUtil.PER_GAS_WHOLESALE_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

//        perBean = new PermissionViewBean();
//        perBean.setCounter("2.1");
//        perBean.setLevel(2);
//        perBean.setSharedId(2);
//        perBean.setName(QTUtil.getBundleString("gasRetail.title"));
//        perBean.setValue(PermissionUtil.PER_GAS_RETAIL);
//        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
//        arrFun.add(perBean);
        perBean = new PermissionViewBean();
        perBean.setCounter("2.64");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleAccessory.title"));
        perBean.setValue(PermissionUtil.PER_SALE_ACCESSORY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.65");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedAssetDepreciation.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET_DEPRECIATION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.66");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleInner.title"));
        perBean.setValue(PermissionUtil.PER_SALE_INNER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.67");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleShell.title"));
        perBean.setValue(PermissionUtil.PER_SALE_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.68");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oldShell.title"));
        perBean.setValue(PermissionUtil.PER_OLD_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.69");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellReturn.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_RETURN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

//        perBean = new PermissionViewBean();
//        perBean.setCounter("2.1");
//        perBean.setLevel(2);
//        perBean.setSharedId(2);
//        perBean.setName(QTUtil.getBundleString("gasReturn.title"));
//        perBean.setValue(PermissionUtil.PER_GAS_RETURN);
//        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
//        arrFun.add(perBean);
        perBean = new PermissionViewBean();
        perBean.setCounter("2.70");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellReturnSupplier.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_RETURN_SUPPLIER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.71");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("loVo.title"));
        perBean.setValue(PermissionUtil.PER_LO_VO);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.72");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicleOut.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE_OUT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.73");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicleIn.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE_IN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.74");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("exportWholesale.title"));
        perBean.setValue(PermissionUtil.PER_EXPORT_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.75");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("transportService.title"));
        perBean.setValue(PermissionUtil.PER_TRANSPORT_SERVICE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.76");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("contract.title"));
        perBean.setValue(PermissionUtil.PER_CONTRACT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("2.77");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("invoice.title"));
        perBean.setValue(PermissionUtil.PER_INVOICE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.78");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtVendor.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_VENDOR);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

//        perBean = new PermissionViewBean();
//        perBean.setCounter("2.1");
//        perBean.setLevel(2);
//        perBean.setSharedId(2);
//        perBean.setName(QTUtil.getBundleString("debtRetail.title"));
//        perBean.setValue(PermissionUtil.PER_DEBT_RETAIL);
//        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
//        arrFun.add(perBean);
        perBean = new PermissionViewBean();
        perBean.setCounter("2.79");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtWholesale.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.80");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("income.title"));
        perBean.setValue(PermissionUtil.PER_INCOME);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.81");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("expense.title"));
        perBean.setValue(PermissionUtil.PER_EXPENSE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.82");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shieldImport.title"));
        perBean.setValue(PermissionUtil.PER_SHIELD_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.83");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shieldDecrease.title"));
        perBean.setValue(PermissionUtil.PER_SHIELD_DECREASE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.84");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtAdjustment.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_ADJUSTMENT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_EDIT_PAST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3");
        perBean.setLevel(0);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("message.permission.report.list"));
        perBean.setValue(0);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgImport.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.2");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgSale.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.3");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.vendorDebt.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_VENDOR_DEBT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.4");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgStock.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.5");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgStockSum.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_STOCK_SUM);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.6");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgStockSumOrganization.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_STOCK_SUM_ORGANIZATION);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.7");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.sum.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_SUM);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.8");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compare.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.9");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compareLPG.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE_LPG);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.10");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compareVendor.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE_VENDOR);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.11");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compareLPGVendorCustomer.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE_LPG_VENDOR_CUSTOMER);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.12");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compareGas.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE_GAS);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.13");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.sale.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.14");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.saleCustomer.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_SALE_CUSTOMER);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.15");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.cashbook.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_CASH_BOOK);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.16");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.gascommission.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_GAS_COMMISION);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.17");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.gasemployeecommission.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_GAS_EMPLOYEE_COMMISION);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.18");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.shell.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.19");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.petroImport.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_PETRO_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.20");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.petroSale.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_PETRO_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.21");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.petroStock.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_PETRO_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.22");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.petroStockStore.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_PETRO_STOCK_STORE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.23");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compareGood.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE_GOOD);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.24");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.transportFee.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_TRANSPORT_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.25");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.vehicleFee.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_VEHICLE_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.26");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.vehicleSale.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_VEHICLE_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.27");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.transportService.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_TRANSPORT_SERVICE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.28");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.employeesalary.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_EMPLOYEE_SALARY);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.29");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.employeeoff.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_EMPLOYEE_OFF);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.30");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.employeeworking.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_EMPLOYEE_WORKING);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.31");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.employeevehiclesalary.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_EMPLOYEE_VEHICLE_SALARY);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.32");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilImport.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.33");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilStock.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.34");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilStockSum.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_STOCK_SUM);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.35");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilSale.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.36");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilCompare.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_COMPARE);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.37");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilCommissionAgency.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_COMMISSION_AGENCY);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("3.38");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilCommissionCustomer.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_COMMISSION_CUSTOMER);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.39");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilVendorStock.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_VENDOR_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("3.40");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilVendorDebt.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_VENDOR_DEBT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("3.40");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.oilCustomerDebt.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_OIL_CUSTOMER_DEBT);
        perBean.setOperations("," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        request.setAttribute(Constants.PERMISSION_FUNC_LIST, arrFun);

        return true;
    }
}
