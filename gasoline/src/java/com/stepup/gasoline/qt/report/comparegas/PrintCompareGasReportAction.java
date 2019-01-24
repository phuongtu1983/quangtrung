/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.comparegas;

import com.stepup.core.util.DateUtil;
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
public class PrintCompareGasReportAction extends BaseAction {

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
            CompareGasReportOutBean outBean = new CompareGasReportOutBean();
            list = printCompareGasReport(fromDate, toDate, vendorId, organizationIds, outBean);
            beans.put("qtrp_customerCode", outBean.getCustomerCode());
            beans.put("qtrp_amountDebt", outBean.getAmountDebt());
            beans.put("qtrp_closingAmountDebt", outBean.getClosingAmountDebt());
            beans.put("qtrp_shell12Debt", outBean.getShell12Debt());
            beans.put("qtrp_shell45Debt", outBean.getShell45Debt());
            beans.put("qtrp_closingShell12Debt", outBean.getClosingShell12Debt());
            beans.put("qtrp_closingShell45Debt", outBean.getClosingShell45Debt());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_gas_binh.xls");
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
            exporter.export(request, response, templateFileName, "report_compare_gas.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printCompareGasReport(String fromDate, String toDate, int vendorId, String organizationIds, CompareGasReportOutBean outBean) {
        ArrayList list = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            VendorFormBean vendorBean = vendorDAO.getVendor(vendorId);
            if (vendorBean != null) {
                outBean.setCustomerCode(vendorBean.getCode());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCompareGasReport(fromDate, toDate, organizationIds, vendorId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
