/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.lpgstocksumorganization;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
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
public class PrintLpgStockSumOrganizationReportAction extends BaseAction {

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
            LpgStockSumOrganizationReportOutBean outBean = new LpgStockSumOrganizationReportOutBean();
            list = printLpgStockSumOrganizationReport(fromDate, toDate, organizationIds, vendorId, outBean);
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/so_theo_doi_nhap_xuat_khi_hoa_long_lpg_vendor.xls");
            beans.put("qtrp_vendorName", outBean.getVendorName());
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            beans.put("qtrp_shieldStock", outBean.getShieldStock());
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_lpg_stock.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printLpgStockSumOrganizationReport(String fromDate, String toDate, String organizationIds, int vendorId, LpgStockSumOrganizationReportOutBean outBean) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            VendorFormBean vendorBean = vendorDAO.getVendor(vendorId);
            if (vendorBean != null) {
                outBean.setVendorName(vendorBean.getName());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgStockSumOrganizationReport(fromDate, toDate, organizationIds, vendorId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
