/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.common;

import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.report.ReportBean;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class BaseReportPanelFormAction extends SpineAction {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        ReportBean reportBean = new ReportBean();
        String name = request.getParameter("reportName");
        String header = "";
        if (name.equals("reportlpgimport")) {
            header = QTUtil.getBundleString("report.lpgImport.title");
        } else if (name.equals("reportlpgstock")) {
            header = QTUtil.getBundleString("report.lpgStock.title");
        } else if (name.equals("reportsum")) {
            header = QTUtil.getBundleString("report.sum.title");
        } else if (name.equals("reportcompare")) {
            header = QTUtil.getBundleString("report.compare.title");
        } else if (name.equals("reportsale")) {
            header = QTUtil.getBundleString("report.sale.title");
        } else if (name.equals("reportsalecustomer")) {
            header = QTUtil.getBundleString("report.saleCustomer.title");
        }else if (name.equals("reportcashbook")) {
            header = QTUtil.getBundleString("report.cashbook.title");
        }
        reportBean.setName(name);
        reportBean.setHeader(header);
        request.setAttribute(Constants.REPORT_BEAN, reportBean);
        return true;
    }
}
