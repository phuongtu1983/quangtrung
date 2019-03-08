/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.lpgimport;

import com.stepup.core.util.OutputUtil;
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
        bean.setImportDate(formBean.getImportDate());
        bean.setCode(formBean.getCode());
        bean.setVendorId(formBean.getVendorId());
        bean.setKind(formBean.getKind());
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
                int id = gasDAO.insertLpgImport(bean);
                bean.setId(id);
            } else {
                gasDAO.updateLpgImport(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        String json = "{\"id\":\"" + bean.getId() + "\"";
        json += "}";
        OutputUtil.sendStringToOutput(response, json);
        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
