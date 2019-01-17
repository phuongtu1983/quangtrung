/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.transportservice;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
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
public class PrintTransportServiceReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int vendorId = NumberUtil.parseInt(request.getParameter("vendorId"), 0);
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            ArrayList list = null;
            TransportServiceReportOutBean outBean = new TransportServiceReportOutBean();
            list = printTransportServiceReport(fromDate, toDate, vendorId, organizationIds, outBean);
            beans.put("qtrp_companyName", outBean.getCompanyName());
            beans.put("qtrp_companyAddress", outBean.getCompanyAddress());
            beans.put("qtrp_companyPhone", outBean.getCompanyPhone());
            beans.put("qtrp_companyTax", outBean.getCompanyTax());
            beans.put("qtrp_customerName", outBean.getCustomerName());
            beans.put("qtrp_customerAddress", outBean.getCustomerAddress());
            beans.put("qtrp_customerTax", outBean.getCustomerTax());
            beans.put("qtrp_customerPhone", outBean.getCustomerPhone());
            beans.put("qtrp_customerFax", outBean.getCustomerFax());
            beans.put("qtrp_amountDebt", outBean.getAmountDebt());
            beans.put("qtrp_closingDebt", outBean.getClosingDebt());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_van_chuyen_thue.xls");
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
            exporter.export(request, response, templateFileName, "report_van_chuyen_thue.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printTransportServiceReport(String fromDate, String toDate, int vendorId, String organizationIds, TransportServiceReportOutBean outBean) {
        ArrayList list = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            OrganizationBean orgBean = organizationDAO.getOrganization(organizationIds);
            if (orgBean != null) {
                outBean.setCompanyAddress(orgBean.getAddress());
                outBean.setCompanyTax(orgBean.getTax());
                outBean.setCompanyName(orgBean.getName());
                outBean.setCompanyPhone(orgBean.getPhone());
            }
            VendorDAO vendorDAO = new VendorDAO();
            VendorFormBean vendorBean = vendorDAO.getVendor(vendorId);
            if (vendorBean != null) {
                outBean.setCustomerAddress(vendorBean.getAddress());
                outBean.setCustomerName(vendorBean.getName());
                outBean.setCustomerTax(vendorBean.getTax());
                outBean.setCustomerPhone(vendorBean.getPhone());
                outBean.setCustomerFax(vendorBean.getFax());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getTransportServiceReport(fromDate, toDate, organizationIds, vendorId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
