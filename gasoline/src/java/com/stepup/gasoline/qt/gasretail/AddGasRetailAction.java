/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gasretail;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GasRetailBean;
import com.stepup.gasoline.qt.bean.GasRetailDetailBean;
import com.stepup.gasoline.qt.bean.GasRetailPromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.GasRetailReturnShellDetailBean;
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
public class AddGasRetailAction extends SpineAction {

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
        GasRetailFormBean formBean = (GasRetailFormBean) form;
        GasDAO gasDAO = new GasDAO();
        GasRetailBean bean = null;
        int gasRetailId = formBean.getId();
        try {
            bean = gasDAO.getGasRetail(gasRetailId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (gasRetailId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new GasRetailBean();
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setDiscount(formBean.getDiscount());
        bean.setTotalPay(formBean.getTotalPay());
        bean.setAccountId(formBean.getAccountId());
        bean.setVehicleId(formBean.getVehicleId());
        try {
            if (bNew) {
                int id = gasDAO.insertGasRetail(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateGasRetail(bean);
            }
            addGasRetailDetail(formBean);
            addGasRetailPromotionMaterial(formBean);
            addGasRetailReturnShellDetail(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addGasRetailDetail(GasRetailFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasRetailDetail(formBean.getId());
            int length = formBean.getShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getGasRetailDetailId()[i], 0);
                if (id == 0) {
                    GasRetailDetailBean bean = new GasRetailDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseFloat(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseFloat(formBean.getAmount()[i], 0));
                    bean.setGasRetailId(formBean.getId());
                    gasDAO.insertGasRetailDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    GasRetailDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (GasRetailDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateGasRetailDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    private void addGasRetailPromotionMaterial(GasRetailFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasRetailPromotionMaterialDetail(formBean.getId());
            int length = formBean.getPromotionMaterialId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getGasRetailPromotionMaterialDetailId()[i], 0);
                if (id == 0) {
                    GasRetailPromotionMaterialDetailBean bean = new GasRetailPromotionMaterialDetailBean();
                    bean.setPromotionMaterialId(NumberUtil.parseInt(formBean.getPromotionMaterialId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getPromotionMaterialQuantity()[i], 0));
                    bean.setGasRetailId(formBean.getId());
                    gasDAO.insertGasRetailPromotionMaterialDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    GasRetailPromotionMaterialDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (GasRetailPromotionMaterialDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateGasRetailPromotionMaterialDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    private void addGasRetailReturnShellDetail(GasRetailFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasRetailReturnShellDetail(formBean.getId());
            int length = formBean.getReturnShellId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getGasRetailReturnShellDetailId()[i], 0);
                if (id == 0) {
                    GasRetailReturnShellDetailBean bean = new GasRetailReturnShellDetailBean();
                    bean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                    bean.setQuantity(NumberUtil.parseFloat(formBean.getReturnShellQuantity()[i], 0));
                    bean.setGasRetailId(formBean.getId());
                    gasDAO.insertGasRetailReturnShellDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    GasRetailReturnShellDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (GasRetailReturnShellDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                        }
                        if (isUpdate) {
                            gasDAO.updateGasRetailReturnShellDetail(oldBean);
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
