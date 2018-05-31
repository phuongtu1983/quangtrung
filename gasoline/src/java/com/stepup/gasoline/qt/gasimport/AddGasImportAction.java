/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GasImportBean;
import com.stepup.gasoline.qt.bean.GasImportDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddGasImportAction extends SpineAction {

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
        GasImportFormBean formBean = (GasImportFormBean) form;
        GasDAO gasDAO = new GasDAO();
        GasImportBean bean = null;
        int gasImportId = formBean.getId();
        try {
            bean = gasDAO.getGasImport(gasImportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (gasImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new GasImportBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setVendorId(formBean.getVendorId());
        bean.setStoreId(formBean.getStoreId());
        bean.setRate(formBean.getRate());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setPaymentMode(formBean.getPaymentMode());
        bean.setAccountId(formBean.getAccountId());
        try {
            if (bNew) {
                int id = gasDAO.insertGasImport(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateGasImport(bean);
            }
            addGasImportShell(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addGasImportShell(GasImportFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasImportDetail(formBean.getId());
            int length = formBean.getShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getGasImportDetailId()[i], 0);
                if (id == 0) {
                    GasImportDetailBean bean = new GasImportDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseFloat(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseFloat(formBean.getAmount()[i], 0));
                    bean.setGasImportId(formBean.getId());
                    gasDAO.insertGasImportDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    GasImportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (GasImportDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseDouble(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice()!= NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseFloat(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount()!= NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseFloat(formBean.getAmount()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateGasImportDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}