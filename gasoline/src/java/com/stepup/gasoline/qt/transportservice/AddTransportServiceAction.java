/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.transportservice;

import com.stepup.gasoline.qt.bean.TransportServiceBean;
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
public class AddTransportServiceAction extends SpineAction {

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
        TransportServiceFormBean formBean = (TransportServiceFormBean) form;
        VehicleDAO vehicleDAO = new VehicleDAO();
        
        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        TransportServiceBean bean = new TransportServiceBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVendorId(formBean.getVendorId());
        bean.setCustomer(formBean.getCustomer());
        bean.setInQuantity(formBean.getInQuantity());
        bean.setOutQuantity(formBean.getOutQuantity());
        bean.setPrice(formBean.getPrice());
        bean.setAmount(formBean.getAmount());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setRate(formBean.getRate());
        bean.setAccountId(formBean.getAccountId());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                vehicleDAO.insertTransportService(bean);
            } else {
                vehicleDAO.updateTransportService(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
