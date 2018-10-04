/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.permission;

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
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_PRINT + ",");
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

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vendor.title"));
        perBean.setValue(PermissionUtil.PER_VENDOR);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("account.title"));
        perBean.setValue(PermissionUtil.PER_ACCOUNT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicle.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedassetgroup.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET_GROUP);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedasset.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("route.title"));
        perBean.setValue(PermissionUtil.PER_ROUTE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessoryKind.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY_KIND);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessory.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("promotionMaterial.title"));
        perBean.setValue(PermissionUtil.PER_PROMOTION_MATERIAL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("customer.title"));
        perBean.setValue(PermissionUtil.PER_CUSTOMER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("customerDocument.title"));
        perBean.setValue(PermissionUtil.PER_CUSTOMER_DOCUMENT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeAdvance.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_ADVANCE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeTimesheet.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_TIMESHEET);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOff.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOffIncrease.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF_INCREASE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("employeeOffMoney.title"));
        perBean.setValue(PermissionUtil.PER_EMPLOYEE_OFF_MONEY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("salary.title"));
        perBean.setValue(PermissionUtil.PER_SALARY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("petro.title"));
        perBean.setValue(PermissionUtil.PER_PETRO);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("tripFee.title"));
        perBean.setValue(PermissionUtil.PER_TRIP_FEE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellImport.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("lpgImport.title"));
        perBean.setValue(PermissionUtil.PER_LPG_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("lpgSale.title"));
        perBean.setValue(PermissionUtil.PER_LPG_SALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fraction.title"));
        perBean.setValue(PermissionUtil.PER_FRACTION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasPrice.title"));
        perBean.setValue(PermissionUtil.PER_GAS_PRICE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasImport.title"));
        perBean.setValue(PermissionUtil.PER_GAS_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("accessoryImport.title"));
        perBean.setValue(PermissionUtil.PER_ACCESSORY_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("promotionMaterialImport.title"));
        perBean.setValue(PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("petroImport.title"));
        perBean.setValue(PermissionUtil.PER_PETRO_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasWholesale.title"));
        perBean.setValue(PermissionUtil.PER_GAS_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
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
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleAccessory.title"));
        perBean.setValue(PermissionUtil.PER_SALE_ACCESSORY);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("salePetro.title"));
        perBean.setValue(PermissionUtil.PER_SALE_PETRO);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("fixedAssetDepreciation.title"));
        perBean.setValue(PermissionUtil.PER_FIXED_ASSET_DEPRECIATION);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("saleShell.title"));
        perBean.setValue(PermissionUtil.PER_SALE_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("oldShell.title"));
        perBean.setValue(PermissionUtil.PER_OLD_SHELL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellReturn.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_RETURN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("gasReturn.title"));
        perBean.setValue(PermissionUtil.PER_GAS_RETURN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shellReturnSupplier.title"));
        perBean.setValue(PermissionUtil.PER_SHELL_RETURN_SUPPLIER);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicleOut.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE_OUT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("vehicleIn.title"));
        perBean.setValue(PermissionUtil.PER_VEHICLE_IN);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("exportWholesale.title"));
        perBean.setValue(PermissionUtil.PER_EXPORT_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("contract.title"));
        perBean.setValue(PermissionUtil.PER_CONTRACT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + "," + PermissionUtil.OPERATION_PRINT + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtVendor.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_VENDOR);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtRetail.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_RETAIL);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("debtWholesale.title"));
        perBean.setValue(PermissionUtil.PER_DEBT_WHOLESALE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("income.title"));
        perBean.setValue(PermissionUtil.PER_INCOME);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("expense.title"));
        perBean.setValue(PermissionUtil.PER_EXPENSE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shieldImport.title"));
        perBean.setValue(PermissionUtil.PER_SHIELD_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("2.1");
        perBean.setLevel(2);
        perBean.setSharedId(2);
        perBean.setName(QTUtil.getBundleString("shieldDecrease.title"));
        perBean.setValue(PermissionUtil.PER_SHIELD_DECREASE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + "," + PermissionUtil.OPERATION_ADD + "," + PermissionUtil.OPERATION_EDIT + "," + PermissionUtil.OPERATION_DELETE + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3");
        perBean.setLevel(0);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("message.permission.report.list"));
        perBean.setValue(0);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgImport.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_IMPORT);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgStock.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_STOCK);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.lpgStockOrganization.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_LPG_STOCK_SUM);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.sum.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_SUM);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);
        
        perBean = new PermissionViewBean();
        perBean.setCounter("3.1");
        perBean.setLevel(2);
        perBean.setSharedId(3);
        perBean.setName(QTUtil.getBundleString("report.compare.title"));
        perBean.setValue(PermissionUtil.PER_REPORT_COMPARE);
        perBean.setOperations("," + PermissionUtil.OPERATION_LIST + ",");
        arrFun.add(perBean);

        request.setAttribute(Constants.PERMISSION_FUNC_LIST, arrFun);

        return true;
    }
}
