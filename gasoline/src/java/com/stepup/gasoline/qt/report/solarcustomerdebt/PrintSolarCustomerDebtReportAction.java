/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.solarcustomerdebt;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
public class PrintSolarCustomerDebtReportAction extends BaseAction {

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
            SolarCustomerDebtReportOutBean outBean = new SolarCustomerDebtReportOutBean();
            list = printSolarCustomerDebtReport(fromDate, toDate, customerId, organizationIds, outBean);
            beans.put("qtrp_customerName", outBean.getCustomerName());
            beans.put("qtrp_closingDebt", outBean.getClosingDebt());
            beans.put("qtrp_openingDebt", outBean.getOpeningDebt());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/bang_theo_doi_cong_no_khach_hang_solar.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "bang_theo_doi_cong_no_khach_hang.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printSolarCustomerDebtReport(String fromDate, String toDate, int customerId, String organizationIds, SolarCustomerDebtReportOutBean outBean) {
        ArrayList list = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            CustomerFormBean customerBean = customerDAO.getCustomer(customerId);
            if (customerBean != null) {
                outBean.setCustomerName(customerBean.getName());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getSolarCustomerDebtReport(fromDate, toDate, organizationIds, customerId, outBean);
        } catch (Exception ex) {
        }
        return list;
    }
}
