/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgimport;

import com.stepup.gasoline.qt.bean.LpgImportBean;
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
public class AddLpgImportAction extends SpineAction {

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
        LpgImportFormBean formBean = (LpgImportFormBean) form;
        GasDAO gasDAO = new GasDAO();
        
        boolean bNew = true;
        if (formBean.getId() != 0) {
            bNew = false;
        }
        LpgImportBean bean = new LpgImportBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setImportDate(formBean.getImportDate());
        bean.setVendorId(formBean.getVendorId());
        bean.setPaperQuantity(formBean.getPaperQuantity());
        bean.setActualQuantity(formBean.getActualQuantity());
        bean.setPrice(formBean.getPrice());
        bean.setVat(formBean.getVat());
        bean.setInvoiceTotal(formBean.getInvoiceTotal());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setRate(formBean.getRate());
        bean.setAccountId(formBean.getAccountId());
        bean.setRouteId(formBean.getRouteId());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                gasDAO.insertLpgImport(bean);
            } else {
                gasDAO.updateLpgImport(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
