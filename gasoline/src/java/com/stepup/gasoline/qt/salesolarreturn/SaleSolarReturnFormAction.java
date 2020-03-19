/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salesolarreturn;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleSolarBean;
import com.stepup.gasoline.qt.bean.SaleSolarReturnBean;
import com.stepup.gasoline.qt.bean.SaleSolarReturnDetailBean;
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
public class SaleSolarReturnFormAction extends SpineAction {

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
        
        SaleSolarReturnFormBean formBean = null;
        int saleSolarReturnId = NumberUtil.parseInt(request.getParameter("saleSolarReturnId"), 0);
        int saleSolarId = NumberUtil.parseInt(request.getParameter("saleSolarId"), 0);
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        try {
            if (saleSolarReturnId != 0) {
                SaleSolarReturnBean bean = goodDAO.getSaleSolarReturn(saleSolarReturnId);
                arrDetail = goodDAO.getSaleSolarReturnDetail(saleSolarReturnId);
                if (bean != null) {
                    formBean = new SaleSolarReturnFormBean(bean);
                    if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_SALE_SOLAR_RETURN)) {
                        formBean.setCanEdit(1);
                    }
                }
            } else if (saleSolarId != 0) {
                SaleSolarBean saleSolarBean = goodDAO.getSaleSolar(saleSolarId);
                if (saleSolarBean != null) {
                    formBean = new SaleSolarReturnFormBean(saleSolarBean);
                    arrDetail = goodDAO.getSaleSolarReturnDetailBySaleSolarId(request.getParameter("saleSolarDetailIds"), QTUtil.getOrganizationManageds(request.getSession()));
                }
            }
        } catch (Exception ex) {
        }
        if (formBean == null) {
            formBean = new SaleSolarReturnFormBean();
        }
        
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.SALE_SOLAR_RETURN_SOLAR, arrDetail);
        
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
                String number = goodDAO.getNextSaleSolarReturnNumber(prefix, 4);
                prefix += number;
            }
            formBean.setCode(prefix);
            
            SaleSolarReturnDetailBean detailBean = null;
            double total = 0, commissionAmount = 0, gapCustomerAmount = 0, gapAgencyAmount = 0;
            for (int i = 0; i < arrDetail.size(); i++) {
                detailBean = (SaleSolarReturnDetailBean) arrDetail.get(i);
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
        
        request.setAttribute(Constants.SALE_SOLAR_RETURN, formBean);
        
        return true;
    }
}
