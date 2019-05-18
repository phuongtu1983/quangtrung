/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilimport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OilImportBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
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
public class OilImportFormAction extends SpineAction {

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
        OilImportBean bean = null;
        String id = request.getParameter("oilImportId");
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int oilImportId = NumberUtil.parseInt(id, 0);
                bean = goodDAO.getOilImport(oilImportId);
                arrDetail = goodDAO.getOilImportDetail(oilImportId);
            } catch (Exception ex) {
            }
        }
        OilImportFormBean formBean = null;
        if (bean != null) {
            formBean = new OilImportFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_OIL_IMPORT)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new OilImportFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-OI-";
                    String number = goodDAO.getNextOilImportNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.OIL_IMPORT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.OIL_IMPORT_OIL, arrDetail);

        ArrayList arrOil = null;
        try {
            arrOil = goodDAO.getOils(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOil == null) {
            arrOil = new ArrayList();
        }
        request.setAttribute(Constants.OIL_LIST, arrOil);

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
            arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_OIL + "");
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        if (formBean.getId() == 0 && arrVendor.size() > 0) {
            VendorFormBean vendorBean = (VendorFormBean) arrVendor.get(0);
            formBean.setCommission(vendorBean.getCommissionOnImport());
        }

        ArrayList arrStore = null;
        try {
            OrganizationDAO orgDAO = new OrganizationDAO();
            arrStore = orgDAO.getStores(organizationIds, VendorBean.IS_OIL);
        } catch (Exception ex) {
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        request.setAttribute(Constants.STORE_LIST, arrStore);

        return true;
    }
}
