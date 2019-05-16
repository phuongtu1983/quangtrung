/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oil;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.OilBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.UnitDAO;
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
public class OilFormAction extends SpineAction {

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
        OilBean bean = null;
        String oilId = request.getParameter("oilId");
        if (!GenericValidator.isBlankOrNull(oilId)) {
            GoodDAO goodDAO = new GoodDAO();
            try {
                bean = goodDAO.getOil(NumberUtil.parseInt(oilId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new OilBean();
        }
        request.setAttribute(Constants.OIL, bean);

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

        ArrayList arrUnit = null;
        try {
            UnitDAO unitDAO = new UnitDAO();
            arrUnit = unitDAO.getUnits(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrUnit == null) {
            arrUnit = new ArrayList();
        }
        request.setAttribute(Constants.UNIT_LIST, arrUnit);

        ArrayList arrOilGroup = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            arrOilGroup = goodDAO.getOilGroups(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrOilGroup == null) {
            arrOilGroup = new ArrayList();
        }
        request.setAttribute(Constants.OIL_GROUP_LIST, arrOilGroup);

        ArrayList arrOilCommission = null;
        try {
            EmployeeDAO employeeDAO = new EmployeeDAO();
            arrOilCommission = employeeDAO.getEmployeeOilCommissions();
        } catch (Exception ex) {
        }
        if (arrOilCommission == null) {
            arrOilCommission = new ArrayList();
        }
        request.setAttribute(Constants.EMPLOYEE_OIL_COMMISSION_LIST, arrOilCommission);

        ArrayList arrOrg = null;
        try {
            OrganizationDAO orgDAO = new OrganizationDAO();
            arrOrg = orgDAO.getOrganizations(EmployeeBean.STATUS_ACTIVE, QTUtil.getOrganizationManageds(request.getSession()));
        } catch (Exception ex) {
        }
        if (arrOrg == null) {
            arrOrg = new ArrayList();
        }
        request.setAttribute(Constants.ORGANIZATION_LIST, arrOrg);

        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            arrVendor = vendorDAO.getVendors(QTUtil.getOrganizationManageds(request.getSession()), VendorBean.IS_OIL + "");
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        return true;
    }
}
