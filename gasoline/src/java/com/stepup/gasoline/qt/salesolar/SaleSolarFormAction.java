/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolar;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.SaleSolarBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class SaleSolarFormAction extends SpineAction {

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
        SaleSolarBean bean = null;
        String id = request.getParameter("saleSolarId");
        ArrayList arrDetail = null;
        ArrayList arrPromotionMaterialDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int saleSolarId = NumberUtil.parseInt(id, 0);
                bean = goodDAO.getSaleSolar(saleSolarId);
                arrDetail = goodDAO.getSaleSolarDetail(saleSolarId);
                arrPromotionMaterialDetail = goodDAO.getSaleSolarPromotionMaterialDetail(saleSolarId);
            } catch (Exception ex) {
            }
        }
        SaleSolarFormBean formBean = null;
        if (bean != null) {
            formBean = new SaleSolarFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_SOLAR)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new SaleSolarFormBean();
            formBean.setIsCalculateAgencyCommission(true);
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-SO-";
                    String number = goodDAO.getNextSaleSolarNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.SALE_SOLAR, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_SOLAR_SOLAR, arrDetail);

        if (arrPromotionMaterialDetail == null) {
            arrPromotionMaterialDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_SOLAR_PROMOTION_MATERIAL, arrPromotionMaterialDetail);

        ArrayList arrSolars = null;
        try {
            arrSolars = goodDAO.getSolars(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrSolars == null) {
            arrSolars = new ArrayList();
        }
        request.setAttribute(Constants.SOLAR_LIST, arrSolars);

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
            arrCustomer = customerDAO.getCustomers(organizationIds, VendorBean.IS_SOLAR);
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);

        ArrayList arrKind = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("saleSolar.detail.commission.kind.invoice"));
        value.setValue(SaleSolarBean.COMMISSION_KIND_INVOICE + "");
        arrKind.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("saleSolar.detail.commission.kind.direct"));
        value.setValue(SaleSolarBean.COMMISSION_KIND_DIRECT + "");
        arrKind.add(value);
        request.setAttribute(Constants.COMMISSION_KIND_LIST, arrKind);

        return true;
    }
}
