/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.report.vehiclefee;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VehicleBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.dao.VehicleDAO;
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
public class PrintVehicleFeeReportAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            int vehicleId = NumberUtil.parseInt(request.getParameter("vehicleId"), 0);

            VehicleDAO vehicleDAO = new VehicleDAO();
            VehicleBean vehicleBean = vehicleDAO.getVehicle(vehicleId);

            Map beans = new HashMap();
            beans.put("qtrp_fromDate", fromDate);
            beans.put("qtrp_toDate", toDate);
            beans.put("qtrp_vehicleName", vehicleBean.getPlate());

            ArrayList list = null;
            try {
                String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
                ReportDAO reportDAO = new ReportDAO();
                list = reportDAO.getVehicleFeeReport(fromDate, toDate, organizationIds, vehicleId);
            } catch (Exception ex) {
            }

            String templateFileName = "so_theo_doi_chi_phi_xe";
            String sourceFile = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
            if (list == null) {
                list = new ArrayList();
            }
            beans.put("dulieu", list);

            ExcelExport exporter = new ExcelExport();
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
