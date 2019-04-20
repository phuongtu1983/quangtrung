/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.agency;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.AgencyCustomerDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetAgencyCustomerAction extends SpineAction {

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
        int customerId = NumberUtil.parseInt(request.getParameter("customerId"), 0);
        ArrayList arrDetail = new ArrayList();
        AgencyCustomerDetailBean customerDetailBean = new AgencyCustomerDetailBean();
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            CustomerFormBean customer = customerDAO.getCustomer(customerId);
            if (customer != null) {
                customerDetailBean.setCustomerId(customer.getId());
                customerDetailBean.setCustomerName(customer.getName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(customerDetailBean);
        request.setAttribute(Constants.AGENCY_CUSTOMER, arrDetail);

        return true;
    }
}
