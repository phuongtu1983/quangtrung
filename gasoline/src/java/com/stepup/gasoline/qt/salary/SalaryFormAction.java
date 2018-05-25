/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.salary;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.DynamicFieldValueAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
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
public class SalaryFormAction extends DynamicFieldValueAction {

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
        SalaryFormBean formBean = null;
        String salaryId = request.getParameter("salaryId");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        int seletecOrganizationId = 0;
        if (!GenericValidator.isBlankOrNull(salaryId)) {
            try {
                formBean = employeeDAO.getSalary(Integer.parseInt(salaryId));
            } catch (Exception ex) {
            }
        }
        if (formBean == null) {
            formBean = new SalaryFormBean();
            try {
                String prefix = "";
                prefix = DateUtil.today("yyyyMMdd") + "-SA-";
                String number = employeeDAO.getNextSalaryNumber(prefix, 4);
                prefix += number;
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.SALARY, formBean);

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
        return "vendor";
    }
}
