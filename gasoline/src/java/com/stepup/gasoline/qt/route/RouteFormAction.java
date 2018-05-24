/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.route;

import com.stepup.gasoline.qt.bean.RouteBean;
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
public class RouteFormAction extends SpineAction {

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
        RouteBean bean = null;
        String routeId = request.getParameter("routeId");
        if (!GenericValidator.isBlankOrNull(routeId)) {
            VehicleDAO vehicleDAO = new VehicleDAO();
            try {
                bean = vehicleDAO.getRoute(Integer.parseInt(routeId));
            } catch (Exception ex) {
            }
        }
        if (bean == null) {
            bean = new RouteBean();
        }
        request.setAttribute(Constants.ROUTE, bean);

        return true;
    }
}
