/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.route;

import com.stepup.gasoline.qt.bean.RouteBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddRouteAction extends SpineAction {

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
        RouteFormBean formBean = (RouteFormBean) form;
        VehicleDAO vehicleDAO = new VehicleDAO();
        RouteBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = vehicleDAO.getRouteByName(formBean.getName());
        } catch (Exception ex) {
        }
        int routeId = formBean.getId();
        if (routeId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != routeId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = vehicleDAO.getRoute(routeId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("routeExisted", new ActionMessage("route.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getName().equals(bean.getName())) {
                    isUpdate = true;
                }
                if (formBean.getDistance() != bean.getDistance()) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new RouteBean();
        bean.setId(formBean.getId());
        bean.setName(formBean.getName());
        bean.setDistance(formBean.getDistance());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                vehicleDAO.insertRoute(bean);
            } else {
                if (isUpdate) {
                    vehicleDAO.updateRoute(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
