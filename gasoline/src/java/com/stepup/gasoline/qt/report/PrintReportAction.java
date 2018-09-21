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
                if (reportName.equals("reportlpgimport")) {
                    templateFileName = "bang_theo_doi_nhap_hang_lpg";
                }
                templateFileName = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
                Map beans = new HashMap();
                ExcelExport exporter = new ExcelExport();
                printLpgImportReport(request.getParameter("fromDate"), request.getParameter("toDate"), beans, exporter, organizationIds);
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

    private void printLpgImportReport(String fromDate, String toDate, Map beans, ExcelExport exporter, String organizationIds) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getLpgImportReport(fromDate, toDate, organizationIds);
            beans.put("dulieu", list);
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            exporter.setBeans(beans);
        } catch (Exception ex) {
        }
    }
}
