/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.tripfee;

import com.stepup.gasoline.qt.bean.TripFeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddTripFeeAction extends SpineAction {

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
        TripFeeFormBean formBean = (TripFeeFormBean) form;
        VehicleDAO vehicleDAO = new VehicleDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        TripFeeBean bean = new TripFeeBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setQuantity(formBean.getQuantity());
        bean.setPrice(formBean.getPrice());
        bean.setAmount(formBean.getAmount());
        bean.setVehicleId(formBean.getVehicleId());
        bean.setNote(formBean.getNote());
        bean.setFee(formBean.getFee());
        try {
            if (bNew) {
                vehicleDAO.insertTripFee(bean);
            } else {
                vehicleDAO.updateTripFee(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
