/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.cashbookmodule;

import com.stepup.core.util.LogUtil;
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
public class PrintCashBookModuleReportAction extends BaseAction {
    
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        
        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            ArrayList list = null;
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCashBookModuleReport(fromDate, toDate, organizationIds, request.getParameter("moduleId"));
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/bao_cao_quy_tien.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_cash_book_module.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }
        
        return true;
    }
    
    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
