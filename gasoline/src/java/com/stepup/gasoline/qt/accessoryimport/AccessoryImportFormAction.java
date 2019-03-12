/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessoryimport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.AccessoryImportBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
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
public class AccessoryImportFormAction extends SpineAction {

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
        AccessoryImportBean bean = null;
        String id = request.getParameter("accessoryImportId");
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int accessoryImportId = NumberUtil.parseInt(id, 0);
                bean = goodDAO.getAccessoryImport(accessoryImportId);
                arrDetail = goodDAO.getAccessoryImportDetail(accessoryImportId);
            } catch (Exception ex) {
            }
        }
        AccessoryImportFormBean formBean = null;
        if (bean != null) {
            formBean = new AccessoryImportFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_ACCESSORY_IMPORT)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new AccessoryImportFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-AI-";
                    String number = goodDAO.getNextAccessoryImportNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.ACCESSORY_IMPORT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.ACCESSORY_IMPORT_ACCESSORY, arrDetail);

        ArrayList arrAccessory = null;
        try {
            arrAccessory = goodDAO.getAccessorys(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrAccessory == null) {
            arrAccessory = new ArrayList();
        }
        request.setAttribute(Constants.ACCESSORY_LIST, arrAccessory);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrAccount = null;
        try {
            AccountDAO accountDAO = new AccountDAO();
            arrAccount = accountDAO.getAccounts(organizationIds);
        } catch (Exception ex) {
        }
        if (arrAccount == null) {
            arrAccount = new ArrayList();
        }
        request.setAttribute(Constants.ACCOUNT_LIST, arrAccount);

        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_GOOD + "");
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        return true;
    }
}
