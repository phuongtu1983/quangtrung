/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.agency;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.AgencyBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.util.Constants;
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
public class AgencyFormAction extends SpineAction {

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
        AgencyBean bean = null;
        String agencyid = request.getParameter("agencyId");
        ArrayList arrCustomerDetail = null;
        ArrayList arrFeeDetail = null;
        if (!GenericValidator.isBlankOrNull(agencyid)) {
            CustomerDAO customerDAO = new CustomerDAO();
            try {
                int agencyId = NumberUtil.parseInt(agencyid, 0);
                bean = customerDAO.getAgency(agencyId);
                arrCustomerDetail = customerDAO.getAgencyCustomerDetail(agencyId);
                arrFeeDetail = customerDAO.getAgencyCommissionDetail(agencyId);
            } catch (Exception ex) {
            }
        }
        AgencyFormBean formBean = null;
        if (bean == null) {
            formBean = new AgencyFormBean();
        } else {
            formBean = new AgencyFormBean(bean);
        }
        request.setAttribute(Constants.AGENCY, formBean);

        if (arrFeeDetail == null) {
            arrFeeDetail = new ArrayList();
        }
        request.setAttribute(Constants.AGENCY_COMMISSION, arrFeeDetail);
        
        if (arrCustomerDetail == null) {
            arrCustomerDetail = new ArrayList();
        }
        request.setAttribute(Constants.AGENCY_CUSTOMER, arrCustomerDetail);

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

        ArrayList arrStatus = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.active"));
        value.setValue(EmployeeBean.STATUS_ACTIVE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.inactive"));
        value.setValue(EmployeeBean.STATUS_INACTIVE + "");
        arrStatus.add(value);
        request.setAttribute(Constants.STATUS_LIST, arrStatus);
        return true;
    }
}
