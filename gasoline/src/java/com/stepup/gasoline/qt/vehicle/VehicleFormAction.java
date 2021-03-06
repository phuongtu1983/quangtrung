/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicle;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.VehicleBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.util.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class VehicleFormAction extends SpineAction {

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
        VehicleBean bean = null;
        String vehicleId = request.getParameter("vehicleId");
        if (!GenericValidator.isBlankOrNull(vehicleId)) {
            VehicleDAO vehicleDAO = new VehicleDAO();
            try {
                bean = vehicleDAO.getVehicle(NumberUtil.parseInt(vehicleId, 0));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new VehicleBean();
        }
        request.setAttribute(Constants.VEHICLE, bean);

        return true;
    }
}
