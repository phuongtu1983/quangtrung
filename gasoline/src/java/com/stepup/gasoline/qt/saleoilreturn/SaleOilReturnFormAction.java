/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoilreturn;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnBean;
import com.stepup.gasoline.qt.bean.SaleOilReturnDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class SaleOilReturnFormAction extends SpineAction {

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
        
        SaleOilReturnFormBean formBean = null;
        int saleOilReturnId = NumberUtil.parseInt(request.getParameter("saleOilReturnId"), 0);
        int saleOilId = NumberUtil.parseInt(request.getParameter("saleOilId"), 0);
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        try {
            if (saleOilReturnId != 0) {
                SaleOilReturnBean bean = goodDAO.getSaleOilReturn(saleOilReturnId);
                arrDetail = goodDAO.getSaleOilReturnDetail(saleOilReturnId);
                if (bean != null) {
                    formBean = new SaleOilReturnFormBean(bean);
                    if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_OIL_RETURN)) {
                        formBean.setCanEdit(1);
                    }
                }
            } else if (saleOilId != 0) {
                SaleOilBean saleOilBean = goodDAO.getSaleOil(saleOilId);
                if (saleOilBean != null) {
                    formBean = new SaleOilReturnFormBean(saleOilBean);
                    arrDetail = goodDAO.getSaleOilReturnDetailBySaleOilId(request.getParameter("saleOilDetailIds"), QTUtil.getOrganizationManageds(request.getSession()));
                }
            }
        } catch (Exception ex) {
        }
        if (formBean == null) {
            formBean = new SaleOilReturnFormBean();
        }
        
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_OIL_RETURN_OIL, arrDetail);
        
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
        
        ArrayList arrCustomer = new ArrayList();
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            CustomerFormBean customerFormBean = customerDAO.getCustomer(formBean.getCustomerId());
            if (customerFormBean != null) {
                arrCustomer.add(customerFormBean);
            }
        } catch (Exception ex) {
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);
        
        try {
            String prefix = "";
            if (formBean.getId() == 0) {
                prefix = DateUtil.today("yyyyMMdd") + "-OR-";
                String number = goodDAO.getNextSaleOilReturnNumber(prefix, 4);
                prefix += number;
            }
            formBean.setCode(prefix);
            
            SaleOilReturnDetailBean detailBean = null;
            double total = 0, commissionAmount = 0, gapCustomerAmount = 0, gapAgencyAmount = 0;
            for (int i = 0; i < arrDetail.size(); i++) {
                detailBean = (SaleOilReturnDetailBean) arrDetail.get(i);
                total += detailBean.getAmount();
                commissionAmount += detailBean.getFirstAmount() * detailBean.getCommission() / 100;
                gapCustomerAmount += detailBean.getGapCustomerAmount() * detailBean.getQuantity();
                gapAgencyAmount += detailBean.getGapAgencyAmount() * detailBean.getQuantity();
            }
            formBean.setTotal(total);
            formBean.setTotalPay(total);
            formBean.setDebt(total);
            formBean.setCommissionAmount(commissionAmount);
            formBean.setGapAgencyAmount(gapAgencyAmount);
            formBean.setGapCustomerAmount(gapCustomerAmount);
        } catch (Exception ex) {
        }
        
        request.setAttribute(Constants.SALE_OIL_RETURN, formBean);
        
        return true;
    }
}
