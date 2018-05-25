/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.customer;

import com.stepup.gasoline.qt.bean.CustomerBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.DynamicFieldValueAction;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
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
public class CustomerFormAction extends DynamicFieldValueAction {

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
    public boolean doMainAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        CustomerFormBean formBean = null;
        String customerid = request.getParameter("customerId");
        CustomerDAO customerDAO = new CustomerDAO();
        int seletecOrganizationId = 0;
        if (!GenericValidator.isBlankOrNull(customerid)) {
            try {
                formBean = customerDAO.getCustomer(Integer.parseInt(customerid));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new CustomerFormBean();
        }
        seletecOrganizationId = formBean.getOrganizationId();

        request.setAttribute(Constants.CUSTOMER, formBean);

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

        ArrayList arrKind = new ArrayList();
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("customer.detail.kind.wholesale"));
        value.setValue(CustomerBean.KIND_WHOLESALE + "");
        arrKind.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("customer.detail.kind.retail"));
        value.setValue(CustomerBean.KIND_RETAIL + "");
        arrKind.add(value);
        request.setAttribute(Constants.CUSTOMER_KIND_LIST, arrKind);

        ArrayList arrOrganization = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrOrganization = organizationDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrOrganization == null) {
            arrOrganization = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrganization);

        if (seletecOrganizationId == 0) {
            if (arrOrganization != null && arrOrganization.size() > 0) {
                OrganizationBean orgBean = (OrganizationBean) arrOrganization.get(0);
                seletecOrganizationId = orgBean.getId();
            }
        }
        super.setOrganizationId(seletecOrganizationId);
        super.setParentId(formBean.getId());
        return true;
    }

    @Override
    protected String getTableName() {
        return "customer";
    }
}
