/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehicle;

import com.stepup.gasoline.qt.bean.VehicleBean;
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
public class AddVehicleAction extends SpineAction {

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
        VehicleFormBean formBean = (VehicleFormBean) form;
        VehicleDAO vehicleDAO = new VehicleDAO();
        VehicleBean bean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            bean = vehicleDAO.getVehicleByPlate(formBean.getPlate());
        } catch (Exception ex) {
        }
        int vehicleId = formBean.getId();
        if (vehicleId == 0) {
            bNew = true;
            if (bean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (bean != null && bean.getId() != vehicleId) {
                isExist = true;
            }
            try {
                if (bean == null) {
                    bean = vehicleDAO.getVehicle(vehicleId);
                }
            } catch (Exception ex) {
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("vehicleExisted", new ActionMessage("vehicle.save.error"));
            saveErrors(request, errors);
            return false;
        }
        boolean isUpdate = false;
        try {
            if (bNew) {
            } else {
                if (!formBean.getPlate().equals(bean.getPlate())) {
                    isUpdate = true;
                }
                if (!formBean.getNote().equals(bean.getNote())) {
                    isUpdate = true;
                }
            }
        } catch (Exception ex) {
        }
        bean = new VehicleBean();
        bean.setId(formBean.getId());
        bean.setPlate(formBean.getPlate());
        bean.setNote(formBean.getNote());
        try {
            if (bNew) {
                vehicleDAO.insertVehicle(bean);
            } else {
                if (isUpdate) {
                    vehicleDAO.updateVehicle(bean);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
