/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.compareagencycommission;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.AgencyBean;
import com.stepup.gasoline.qt.bean.OrganizationBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.CustomerDAO;
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
public class PrintCompareAgencyCommissionReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int agencyId = NumberUtil.parseInt(request.getParameter("agencyId"), 0);
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            ArrayList list = null;
            CompareAgencyCommissionReportOutBean outBean = new CompareAgencyCommissionReportOutBean();
            list = printCompareAgencyCommissionReport(fromDate, toDate, agencyId, organizationIds, outBean);
            beans.put("qtrp_agencyName", outBean.getAgencyName());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/doi_chieu_cong_no_oil.xls");
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "report_compare_oil.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printCompareAgencyCommissionReport(String fromDate, String toDate, int agencyId, String organizationIds, CompareAgencyCommissionReportOutBean outBean) {
        ArrayList list = null;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            AgencyBean agencyBean = customerDAO.getAgency(agencyId);
            if (agencyBean != null) {
                outBean.setAgencyName(agencyBean.getName());
            }
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.getCompareAgencyCommissionReport(fromDate, toDate, organizationIds, agencyId);
        } catch (Exception ex) {
        }
        return list;
    }
}
