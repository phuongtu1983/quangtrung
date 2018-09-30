/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
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
public class PrintReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            String reportName = request.getParameter("reportName");
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            String templateFileName = "";
            if (!StringUtil.isBlankOrNull(reportName)) {
                Map beans = new HashMap();
                ExcelExport exporter = new ExcelExport();
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");
                ArrayList list = null;
                if (reportName.equals("reportlpgimport")) {
                    templateFileName = "bang_theo_doi_nhap_hang_lpg";
                    list = printLpgImportReport(fromDate, toDate, organizationIds);
                } else if (reportName.equals("reportlpgstock")) {
                    templateFileName = "so_theo_doi_san_luong_khi_hoa_long_lpg";
                    list = printLpgStockReport(fromDate, toDate, beans, organizationIds);
                }else if (reportName.equals("reportlpgstockorganization")) {
                    templateFileName = "so_theo_doi_nhap_xuat_khi_hoa_long_lpg";
                    list = printLpgStockOrganizationReport(fromDate, toDate);
                }
                templateFileName = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
                beans.put("qtrp_fromDate", fromDate);
                beans.put("qtrp_toDate", toDate);
                if (list == null) {
                    list = new ArrayList();
                }
                beans.put("dulieu", list);
                exporter.setBeans(beans);
                exporter.export(request, response, templateFileName, "report_" + reportName + ".xls");
            }

        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printLpgImportReport(String fromDate, String toDate, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgImportReport(fromDate, toDate, organizationIds);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printLpgStockReport(String fromDate, String toDate, Map beans, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgStockReport(fromDate, toDate, organizationIds);
            beans.put("qtrp_openingStock", fromDate);
        } catch (Exception ex) {
        }
        return list;
    }
    
    private ArrayList printLpgStockOrganizationReport(String fromDate, String toDate) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgStockOrganizationReport(fromDate, toDate);
        } catch (Exception ex) {
        }
        return list;
    }
}
