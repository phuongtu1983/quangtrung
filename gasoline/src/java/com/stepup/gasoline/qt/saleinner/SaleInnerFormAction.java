/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleinner;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SaleInnerBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.GasDAO;
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
public class SaleInnerFormAction extends SpineAction {

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
        SaleInnerBean bean = null;
        String id = request.getParameter("saleInnerId");
        ArrayList arrDetail = null;
        GasDAO gasDAO = new GasDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int saleInnerId = NumberUtil.parseInt(id, 0);
                bean = gasDAO.getSaleInner(saleInnerId);
                arrDetail = gasDAO.getSaleInnerDetail(saleInnerId);
            } catch (Exception ex) {
            }
        }
        SaleInnerFormBean formBean = null;
        if (bean != null) {
            formBean = new SaleInnerFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_INNER)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new SaleInnerFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-SI-";
                    String number = gasDAO.getNextSaleInnerNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.SALE_INNER, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_INNER_GOOD, arrDetail);
        
        ArrayList arrShells = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            VendorDAO vendorDAO = new VendorDAO();
            String vendorIds = vendorDAO.getVendorOfOrganizations(organizationIds);
            arrShells = goodDAO.getShellVendor(organizationIds, vendorIds);
        } catch (Exception ex) {
        }
        if (arrShells == null) {
            arrShells = new ArrayList();
        }
        request.setAttribute(Constants.SHELL_LIST, arrShells);

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

        ArrayList arrEmployee = null;
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrEmployee = employeeDAO.getEmployees(EmployeeBean.STATUS_ACTIVE, organizationIds);
        } catch (Exception ex) {
        }
        if (arrEmployee == null) {
            arrEmployee = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_LIST, arrEmployee);

        return true;
    }
}
