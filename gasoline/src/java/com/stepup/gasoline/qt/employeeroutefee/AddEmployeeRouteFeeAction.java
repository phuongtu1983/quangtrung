/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employeeroutefee;

import com.stepup.gasoline.qt.bean.EmployeeRouteFeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.VehicleDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddEmployeeRouteFeeAction extends SpineAction {

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
        EmployeeRouteFeeFormBean formBean = (EmployeeRouteFeeFormBean) form;
        VehicleDAO vehicleDAO = new VehicleDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        EmployeeRouteFeeBean bean = new EmployeeRouteFeeBean();
        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setEmployeeId(formBean.getEmployeeId());
        bean.setRouteId(formBean.getRouteId());
        bean.setVehicleId(formBean.getVehicleId());
        bean.setInQuantity(formBean.getInQuantity());
        bean.setOutQuantity(formBean.getOutQuantity());
        bean.setPrice(formBean.getPrice());
        bean.setStore(formBean.getStore());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                vehicleDAO.insertEmployeeRouteFee(bean);
            } else {
                vehicleDAO.updateEmployeeRouteFee(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
