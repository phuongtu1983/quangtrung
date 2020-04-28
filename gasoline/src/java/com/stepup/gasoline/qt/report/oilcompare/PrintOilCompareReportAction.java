/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.oilcompare;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class PrintOilCompareReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int customerId = NumberUtil.parseInt(request.getParameter("customerId"), 0);
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            ArrayList list = null;
            OilCompareReportOutBean outBean = new OilCompareReportOutBean();
            list = printOilCompareReport(fromDate, toDate, customerId, organizationIds, outBean);
            beans.put("qtrp_companyName", outBean.getCompanyName());
            beans.put("qtrp_companyAddress", outBean.getCompanyAddress());
            beans.put("qtrp_companyPhone", outBean.getCompanyPhone());
            beans.put("qtrp_companyFax", outBean.getCompanyFax());
            beans.put("qtrp_customerName", outBean.getCustomerName());
            beans.put("qtrp_customerAddress", outBean.getCustomerAddress());
            beans.put("qtrp_customerPhone", outBean.getCustomerPhone());
            beans.put("qtrp_openingAmountStock", outBean.getOpeningAmountStock());
            beans.put("qtrp_customerCommission", outBean.getCustomerCommission());
            beans.put("qtrp_customerCommissionAmount", outBean.getCustomerCommissionAmount());
            beans.put("qtrp_customerPaid", outBean.getCustomerPaid());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_oil.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            beans.put("qtrp_day", DateUtil.today("dd"));
            beans.put("qtrp_month", DateUtil.today("MM"));
            beans.put("qtrp_year", DateUtil.today("yyyy"));
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_oil_compare.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printOilCompareReport(String fromDate, String toDate, int customerId, String organizationIds, OilCompareReportOutBean outBean) {
        ArrayList list = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            OrganizationBean orgBean = organizationDAO.getOrganization(organizationIds);
            if (orgBean != null) {
                outBean.setCompanyAddress(orgBean.getAddress());
                outBean.setCompanyFax(orgBean.getFax());
                outBean.setCompanyName(orgBean.getName());
                outBean.setCompanyPhone(orgBean.getPhone());
            }
            CustomerDAO customerDAO = new CustomerDAO();
            CustomerFormBean customerBean = customerDAO.getCustomer(customerId);
            if (customerBean != null) {
                outBean.setCustomerAddress(customerBean.getAddress());
                outBean.setCustomerName(customerBean.getName());
                outBean.setCustomerPhone(customerBean.getPhone());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getOilCompareReport(fromDate, toDate, organizationIds, customerId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
