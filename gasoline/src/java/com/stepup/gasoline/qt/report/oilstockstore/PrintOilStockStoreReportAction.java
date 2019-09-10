/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.oilstockstore;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.oil.OilFormBean;
import com.stepup.gasoline.qt.report.DynamicColumnExcelReporter;
import com.stepup.gasoline.qt.report.OilStockReportOutBean;
import com.stepup.gasoline.qt.store.StoreFormBean;
import com.stepup.gasoline.qt.util.QTUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
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
public class PrintOilStockStoreReportAction extends BaseAction {

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

            String session = QTUtil.getEmployeeId(request.getSession()) + "_" + Calendar.getInstance().getTimeInMillis();
            String templateFileName = "so_theo_doi_nxt_tong_hop_oil_store";
            String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
            printReport(fromDate, toDate, organizationIds, storeId, request, response, templateFileName, session, beans, exporter);
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printReport(String fromDate, String toDate, String organizationIds, int storeId, HttpServletRequest request, HttpServletResponse response,
            String fileName, String sessionId, Map beans, ExcelExport exporter) {
        ArrayList list = null;
        try {
            String tempFileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + "_temp.xls");
            fileName = request.getSession().getServletContext().getRealPath("/templates/" + fileName + ".xls");
            GoodDAO goodDAO = new GoodDAO();
            ReportDAO reportDAO = new ReportDAO();

            FileUtil.copyFile(fileName, tempFileName);
            File f = new File(tempFileName);
            ArrayList arrHideCol = new ArrayList();
            arrHideCol.add(2);
            arrHideCol.add(3);
            arrHideCol.add(4);

            OilStockReportOutBean outBean = new OilStockReportOutBean();
            list = reportDAO.getOilStockStoreReport(fromDate, toDate, organizationIds, storeId, 0, sessionId, outBean);

            ArrayList oils = goodDAO.getOils(outBean.getOilIds());

            beans.put("datedata", list);
            DynamicColumnExcelReporter.createOilStockReportColumns(tempFileName, oils, f);

            OilFormBean oil = null;

            for (int i = 0; i < oils.size(); i++) {
                oil = (OilFormBean) oils.get(i);
                try {
                    list = reportDAO.getOilStockStoreReport(fromDate, toDate, organizationIds, storeId, oil.getId(), sessionId, outBean);
                } catch (Exception ex) {
                }
                beans.put("dynamicdata" + oil.getId(), list);
                beans.put("openingStock" + oil.getId(), outBean.getOpeningStock());
                beans.put("closingStock" + oil.getId(), outBean.getClosingStock());
            }
            reportDAO.clearOilStockReport(sessionId);

            short[] hiddenCols = new short[arrHideCol.size()];
            for (int i = 0; i < arrHideCol.size(); i++) {
                hiddenCols[i] = Short.parseShort(arrHideCol.get(i) + "");
            }
            exporter.setHiddenCols(hiddenCols);
            exporter.setBeans(beans);
            exporter.export(request, response, tempFileName, "oil_stock_store_report.xls");
            f.delete();
        } catch (Exception ex) {
        }
        return list;
    }
}
