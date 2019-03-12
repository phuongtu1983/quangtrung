/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparelpgvendorcustomer;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendorcustomer.VendorCustomerFormBean;
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
public class PrintCompareLPGVendorCustomerReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int vendorCustomerId = NumberUtil.parseInt(request.getParameter("vendorCustomerId"), 0);
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            ArrayList list = null;
            CompareLPGVendorCustomerReportOutBean outBean = new CompareLPGVendorCustomerReportOutBean();
            list = printCompareLPGVendorCustomerReport(fromDate, toDate, organizationIds, vendorCustomerId, outBean);
            beans.put("qtrp_vendorName", outBean.getVendorName());
            beans.put("qtrp_openingStock", outBean.getOpeningStock());
            beans.put("qtrp_endingStock", outBean.getEndingStock());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_ncc_kh.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_compare_lpg_ncc_kh.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printCompareLPGVendorCustomerReport(String fromDate, String toDate, String organizationIds, int vendorCustomerId, CompareLPGVendorCustomerReportOutBean outBean) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            VendorCustomerFormBean vendorCustomerBean = vendorDAO.getVendorCustomer(vendorCustomerId);
            if (vendorCustomerBean != null) {
                outBean.setVendorName(vendorCustomerBean.getVendorName());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCompareLPGVendorCustomerReport(fromDate, toDate, organizationIds, vendorCustomerId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
