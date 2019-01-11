/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparevendor;

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
public class PrintCompareVendorReportAction extends BaseAction {
    
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
            CompareVendorReportOutBean outBean = new CompareVendorReportOutBean();
            list = printCompareVendorReport(fromDate, toDate, vendorId, organizationIds, outBean);
            beans.put("qtrp_companyName", outBean.getCompanyName());
            beans.put("qtrp_companyAddress", outBean.getCompanyAddress());
            beans.put("qtrp_companyPhone", outBean.getCompanyPhone());
            beans.put("qtrp_companyFax", outBean.getCompanyFax());
            beans.put("qtrp_vendorName", outBean.getVendorName());
//            beans.put("qtrp_vendorAddress", outBean.getVendorAddress());
//            beans.put("qtrp_vendorTax", outBean.getVendorTax());
            beans.put("qtrp_openingStockAmount", outBean.getOpeningStockAmount());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_ncc.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_compare_ncc.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }
        
        return true;
    }
    
    @Override
    protected boolean isReturnStream() {
        return true;
    }
    
    private ArrayList printCompareVendorReport(String fromDate, String toDate, int vendorId, String organizationIds, CompareVendorReportOutBean outBean) {
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
            VendorDAO vendorDAO = new VendorDAO();
            VendorFormBean vendorBean = vendorDAO.getVendor(vendorId);
            if (vendorBean != null) {
//                outBean.setVendorAddress(vendorBean.get());
                outBean.setVendorName(vendorBean.getName());
//                outBean.setVendorTax(vendorBean.getTax());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCompareVendorReport(fromDate, toDate, organizationIds, vendorId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
