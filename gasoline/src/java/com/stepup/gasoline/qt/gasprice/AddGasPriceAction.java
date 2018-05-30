/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasprice;

import com.stepup.gasoline.qt.bean.GasPriceBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddGasPriceAction extends SpineAction {

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
        GasPriceFormBean formBean = (GasPriceFormBean) form;
        GasDAO gasDAO = new GasDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        GasPriceBean bean = new GasPriceBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setFromDate(formBean.getFromDate());
        bean.setToDate(formBean.getToDate());
        bean.setPrice(formBean.getPrice());
        bean.setNote(formBean.getNote());
        bean.setKind(formBean.getKind());
        try {
            if (bNew) {
                gasDAO.insertGasPrice(bean);
            } else {
                gasDAO.updateGasPrice(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
