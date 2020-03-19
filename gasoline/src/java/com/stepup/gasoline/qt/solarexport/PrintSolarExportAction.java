/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solarexport;

import com.stepup.core.util.DateUtil;
import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SolarExportBean;
import com.stepup.gasoline.qt.bean.SaleSolarBean;
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
public class PrintSolarExportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            Map beans = new HashMap();
            ExcelExport exporter = new ExcelExport();
            int solarExportId = NumberUtil.parseInt(request.getParameter("solarExportId"), 0);
            ArrayList list = null;
            SaleSolarReportOutBean outBean = new SaleSolarReportOutBean();
            list = printSolarExportReport(solarExportId, outBean);
            beans.put("qtrp_code", outBean.getExportNumber());
            beans.put("qtrp_customerName", outBean.getCustomerName());
            beans.put("qtrp_customerAddress", outBean.getCustomerAddress());
            beans.put("qtrp_customerPhone", outBean.getCustomerPhone());
            beans.put("qtrp_customerCommission", outBean.getCustomerCommission());
            beans.put("qtrp_customerCommissionAmount", outBean.getCustomerCommissionAmount());
            beans.put("qtrp_total", outBean.getTotal());
            beans.put("qtrp_paid", outBean.getPaid());
            beans.put("qtrp_debt", outBean.getDebt());
            String templateFileName = request.getSession().getServletContext().getRealPath("/templates/phieu_xuat_kho_solar.xls");
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

    private ArrayList printSolarExportReport(int solarExportId, SaleSolarReportOutBean outBean) {
        ArrayList list = null;
        try {
            GoodDAO goodDAO = new GoodDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            SolarExportBean solarExportBean = goodDAO.getSolarExport(solarExportId);
            if (solarExportBean != null) {
                SaleSolarBean saleSolarBean = goodDAO.getSaleSolar(solarExportBean.getSolarSaleId());
                if (saleSolarBean == null) {
                    saleSolarBean = new SaleSolarBean();
                }
                outBean.setCode(solarExportBean.getCode());
                outBean.setCustomerCommission(saleSolarBean.getCommission());
                outBean.setCustomerCommissionAmount(saleSolarBean.getCommissionAmount());
                outBean.setTotal(solarExportBean.getTotal());
                outBean.setPaid(0);
                outBean.setDebt(solarExportBean.getTotal());
                outBean.setExportDate(solarExportBean.getCreatedDate());
                outBean.setExportNumber(solarExportBean.getCode());
                CustomerFormBean customerBean = customerDAO.getCustomer(solarExportBean.getCustomerId());
                if (customerBean != null) {
                    outBean.setCustomerAddress(customerBean.getAddress());
                    outBean.setCustomerName(customerBean.getName());
                    outBean.setCustomerPhone(customerBean.getPhone());
                }
                ReportDAO reportDAO = new ReportDAO();
                list = reportDAO.getSolarExportReport(solarExportId);
            }

        } catch (Exception ex) {
        }
        return list;
    }
}
