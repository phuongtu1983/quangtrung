/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilexport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OilExportBean;
import com.stepup.gasoline.qt.bean.SaleOilBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.customer.CustomerFormBean;
import com.stepup.gasoline.qt.dao.CustomerDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.ReportDAO;
import java.util.ArrayList;
import java.util.Date;
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
public class PrintOilExportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            int oilExportId = NumberUtil.parseInt(request.getParameter("oilExportId"), 0);
            ArrayList list = null;
            SaleOilReportOutBean outBean = new SaleOilReportOutBean();
            list = printOilExportReport(oilExportId, outBean);
            beans.put("qtrp_code", outBean.getExportNumber());
            beans.put("qtrp_customerName", outBean.getCustomerName());
            beans.put("qtrp_customerAddress", outBean.getCustomerAddress());
            beans.put("qtrp_customerPhone", outBean.getCustomerPhone());
            beans.put("qtrp_customerCommission", outBean.getCustomerCommission());
            beans.put("qtrp_customerCommissionAmount", outBean.getCustomerCommissionAmount());
            beans.put("qtrp_total", outBean.getTotal());
            beans.put("qtrp_paid", outBean.getPaid());
            beans.put("qtrp_debt", outBean.getDebt());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/phieu_xuat_kho_oil.xls");
            Date exportDate = DateUtil.convertStringToDate(outBean.getExportDate(), "dd/MM/yyyy");
            beans.put("qtrp_day", DateUtil.formatDate(exportDate, "dd"));
            beans.put("qtrp_month", DateUtil.formatDate(exportDate, "MM"));
            beans.put("qtrp_year", DateUtil.formatDate(exportDate, "yyyy"));
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);
            exporter.setBeans(beans);
            exporter.export(request, response, templateFileName, "phieu_xuat_kho.xls");
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printOilExportReport(int oilExportId, SaleOilReportOutBean outBean) {
        ArrayList list = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            OilExportBean oilExportBean = goodDAO.getOilExport(oilExportId);
            if (oilExportBean != null) {
                SaleOilBean saleOilBean = goodDAO.getSaleOil(oilExportBean.getOilSaleId());
                if (saleOilBean == null) {
                    saleOilBean = new SaleOilBean();
                }
                outBean.setCode(oilExportBean.getCode());
                outBean.setCustomerCommission(saleOilBean.getCommission());
                outBean.setCustomerCommissionAmount(saleOilBean.getCommissionAmount());
                outBean.setTotal(oilExportBean.getTotal());
                outBean.setPaid(0);
                outBean.setDebt(oilExportBean.getTotal());
                outBean.setExportDate(oilExportBean.getCreatedDate());
                outBean.setExportNumber(oilExportBean.getCode());
                CustomerFormBean customerBean = customerDAO.getCustomer(oilExportBean.getCustomerId());
                if (customerBean != null) {
                    outBean.setCustomerAddress(customerBean.getAddress());
                    outBean.setCustomerName(customerBean.getName());
                    outBean.setCustomerPhone(customerBean.getPhone());
                }
                ReportDAO reportDAO = new ReportDAO();
                list = reportDAO.getOilExportReport(oilExportId);
            }

        } catch (Exception ex) {
        }
        return list;
    }
}
