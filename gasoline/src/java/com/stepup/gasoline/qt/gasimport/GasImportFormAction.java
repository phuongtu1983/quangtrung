/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasimport;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.GasImportBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
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
public class GasImportFormAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
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
        GasImportBean bean = null;
        String id = request.getParameter("gasImportId");
        ArrayList arrDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getGasImport(gasImportId);
                arrDetail = gasDAO.getGasImportDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        GasImportFormBean formBean = null;
        if (bean != null) {
            formBean = new GasImportFormBean(bean);
        } else {
            formBean = new GasImportFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-GI-";
                    String number = gasDAO.getNextGasImportNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.GAS_IMPORT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.GAS_IMPORT_SHELL, arrDetail);

        ArrayList arrShell = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrShell = goodDAO.getShells(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrShell == null) {
            arrShell = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShell);

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
            arrVendor = vendorDAO.getVendors(organizationIds);
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);
        
        ArrayList arrStore = null;
        try {
            OrganizationDAO orgDAO = new OrganizationDAO();
            arrStore = orgDAO.getStores(organizationIds);
        } catch (Exception ex) {
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        request.setAttribute(Constants.STORE_LIST, arrStore);
        
        return true;
    }
}
