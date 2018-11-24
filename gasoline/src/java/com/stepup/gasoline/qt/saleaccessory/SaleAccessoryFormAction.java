/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleaccessory;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SaleAccessoryBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class SaleAccessoryFormAction extends SpineAction {

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
        SaleAccessoryBean bean = null;
        String id = request.getParameter("saleAccessoryId");
        ArrayList arrDetail = null;
        ArrayList arrChangeDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = goodDAO.getSaleAccessory(gasImportId);
                arrDetail = goodDAO.getSaleAccessoryDetail(gasImportId);
                arrChangeDetail = goodDAO.getSaleAccessoryChangeDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        SaleAccessoryFormBean formBean = null;
        if (bean != null) {
            formBean = new SaleAccessoryFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_ACCESSORY)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new SaleAccessoryFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-SA-";
                    String number = goodDAO.getNextSaleAccessoryNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.SALE_ACCESSORY, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_ACCESSORY_GOOD, arrDetail);

        if (arrChangeDetail == null) {
            arrChangeDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_ACCESSORY_CHANGE_GOOD, arrChangeDetail);

        ArrayList arrAccessories = null;
        try {
            arrAccessories = goodDAO.getAccessorys(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrAccessories == null) {
            arrAccessories = new ArrayList();
        }
        request.setAttribute(Constants.GOOD_LIST, arrAccessories);

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

        return true;
    }
}
