/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salepetro;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SalePetroBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.store.StoreFormBean;
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
public class SalePetroFormAction extends SpineAction {

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
        SalePetroBean bean = null;
        String id = request.getParameter("salePetroId");
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int gasImportId = Integer.parseInt(id);
                bean = goodDAO.getSalePetro(gasImportId);
                arrDetail = goodDAO.getSalePetroDetail(gasImportId);
            } catch (Exception ex) {
            }
        }
        SalePetroFormBean formBean = null;
        if (bean != null) {
            formBean = new SalePetroFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_PETRO)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new SalePetroFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-SP-";
                    String number = goodDAO.getNextSalePetroNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.SALE_PETRO, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_PETRO_GOOD, arrDetail);

        ArrayList arrAccessories = null;
        try {
            arrAccessories = goodDAO.getPetros(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
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

        ArrayList arrStore = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            if (formBean.getStoreId() != 0) {
                StoreFormBean storeFormBean = organizationDAO.getStore(formBean.getStoreId());
                if (storeFormBean == null) {
                    storeFormBean = new StoreFormBean();
                }
                if (arrStore == null) {
                    arrStore = new ArrayList();
                }
                arrStore.add(storeFormBean);
            } else {
                arrStore = organizationDAO.getStores(organizationIds, VendorBean.IS_PETRO);
            }
        } catch (Exception ex) {
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        request.setAttribute(Constants.STORE_LIST, arrStore);

        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            if (formBean.getCustomerId() != 0) {
                CustomerFormBean customerFormBean = customerDAO.getCustomer(formBean.getCustomerId());
                if (customerFormBean == null) {
                    customerFormBean = new CustomerFormBean();
                }
                if (arrCustomer == null) {
                    arrCustomer = new ArrayList();
                }
                arrCustomer.add(customerFormBean);
            } else {
                arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_PETRO);
            }
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        return true;
    }
}
