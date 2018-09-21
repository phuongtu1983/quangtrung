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
        }
        reportBean.setName(name);
        reportBean.setHeader(header);
        request.setAttribute(Constants.REPORT_BEAN, reportBean);
        return true;
    }
}
