/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.exportwholesale;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class ExportWholesaleFormAction extends SpineAction {

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
        ExportWholesaleBean bean = null;
        String id = request.getParameter("exportWholesaleId");
        ArrayList arrDetail = null;
        ArrayList arrReturnShelDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = gasDAO.getExportWholesale(gasImportId);
                arrDetail = gasDAO.getExportWholesaleDetail(gasImportId);
                arrReturnShelDetail = gasDAO.getExportWholesaleReturnShellDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        ExportWholesaleFormBean formBean = null;
        if (bean != null) {
            formBean = new ExportWholesaleFormBean(bean);
        } else {
            formBean = new ExportWholesaleFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-EW-";
                    String number = gasDAO.getNextExportWholesaleNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.EXPORT_WHOLESALE, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.EXPORT_WHOLESALE_SHELL, arrDetail);

        if (arrReturnShelDetail == null) {
            arrReturnShelDetail = new ArrayList();
        }
        request.setAttribute(Constants.EXPORT_WHOLESALE_RETURN, arrReturnShelDetail);

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

        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(organizationIds, CustomerBean.KIND_RETAIL);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
