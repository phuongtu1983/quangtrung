/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vehicleout.VehicleOutFormBean;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetVehicleOutByDateAction extends SpineAction {

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
        try {
            String date = request.getParameter("date");
            ArrayList arrVehicleOut = null;
            try {
                GasDAO gasDAO = new GasDAO();
                String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
                arrVehicleOut = gasDAO.searchVehicleOut(date, date, organizationIds);
            } catch (Exception ex) {
            }
            if (arrVehicleOut == null) {
                arrVehicleOut = new ArrayList();
            }
            String json = "{\"options\":[";
            VehicleOutFormBean bean = null;
            for (int i = 0; i < arrVehicleOut.size(); i++) {
                bean = (VehicleOutFormBean) arrVehicleOut.get(i);
                json += "[\"" + bean.getId() + "\",\"" + bean.getCode() + " - " + bean.getVehiclePlate() + "\"]";
                if (i < arrVehicleOut.size() - 1) {
                    json += ",";
                }
            }
            json += "]}";
            OutputUtil.sendStringToOutput(response, json);
        } catch (Exception ex) {
        }
        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
