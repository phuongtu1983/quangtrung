/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgsale;

import com.stepup.gasoline.qt.bean.LpgSaleBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddLpgSaleAction extends SpineAction {

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
        LpgSaleFormBean formBean = (LpgSaleFormBean) form;
        GasDAO gasDAO = new GasDAO();

        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        LpgSaleBean bean = new LpgSaleBean();
        bean.setId(formBean.getId());
        bean.setSaleDate(formBean.getSaleDate());
        bean.setCode(formBean.getCode());
        bean.setKind(formBean.getKind());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setQuantity(formBean.getQuantity());
        bean.setPrice(formBean.getPrice());
        bean.setPriceTransport(formBean.getPriceTransport());
        bean.setVat(formBean.getVat());
        bean.setRate(formBean.getRate());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setAccountId(formBean.getAccountId());
        bean.setRouteId(formBean.getRouteId());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                gasDAO.insertLpgSale(bean);
            } else {
                gasDAO.updateLpgSale(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
