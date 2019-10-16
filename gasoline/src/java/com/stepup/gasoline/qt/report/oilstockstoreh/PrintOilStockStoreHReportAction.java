/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.oilstockstoreh;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.store.StoreFormBean;
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
public class PrintOilStockStoreHReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();

            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int storeId = NumberUtil.parseInt(request.getParameter("storeId"), 0);

            OrganizationDAO organizationDAO = new OrganizationDAO();
            StoreFormBean storeBean = organizationDAO.getStore(storeId);

            beans.put("qtrp_storeName", storeBean.getName());
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);

            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());

            String templateFileName = "so_theo_doi_nxt_tong_hop_oil_store_h";
            String sourceFile = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
            ReportDAO reportDAO = new ReportDAO();
            ArrayList list = reportDAO.getOilStockStoreHReport(fromDate, toDate, organizationIds, storeId);
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, sourceFile, templateFileName + ".xls");
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
