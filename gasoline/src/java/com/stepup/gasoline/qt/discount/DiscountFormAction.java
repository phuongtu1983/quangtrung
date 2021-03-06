/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.discount;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.DiscountBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.util.Constants;
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
public class DiscountFormAction extends SpineAction {

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
        DiscountBean bean = null;
        int discountId = NumberUtil.parseInt(request.getParameter("discountId"), 0);
        ArrayList arrFeeDetail = null;
        ArrayList arrFeeCustomer = null;
        if (discountId != 0) {
            CustomerDAO customerDAO = new CustomerDAO();
            try {
                bean = customerDAO.getDiscount(discountId);
                arrFeeDetail = customerDAO.getDiscountCommissionDetail(discountId);
                arrFeeCustomer = customerDAO.getDiscountCommissionCustomer(discountId);
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new DiscountBean();
        }
        request.setAttribute(Constants.DISCOUNT, bean);

        if (arrFeeDetail == null) {
            arrFeeDetail = new ArrayList();
        }
        request.setAttribute(Constants.DISCOUNT_COMMISSION, arrFeeDetail);

        
        if (arrFeeCustomer == null) {
            arrFeeCustomer = new ArrayList();
        }
        request.setAttribute(Constants.DISCOUNT_COMMISSION_CUSTOMER, arrFeeCustomer);

        ArrayList arrCustomer = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            arrCustomer = customerDAO.getCustomers(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrCustomer == null) {
            arrCustomer = new ArrayList();
        }
        request.setAttribute(Constants.CUSTOMER_LIST, arrCustomer);
        
        return true;
    }
}
