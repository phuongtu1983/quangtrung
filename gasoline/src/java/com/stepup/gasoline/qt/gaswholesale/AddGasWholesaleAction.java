/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GasWholesaleBean;
import com.stepup.gasoline.qt.bean.GasWholesaleDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesalePromotionMaterialDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesaleReturnShellDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddGasWholesaleAction extends SpineAction {

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
        GasWholesaleFormBean formBean = (GasWholesaleFormBean) form;
        GasDAO gasDAO = new GasDAO();
        GasWholesaleBean bean = null;
        int gasWholesaleId = formBean.getId();
        try {
            bean = gasDAO.getGasWholesale(gasWholesaleId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (gasWholesaleId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new GasWholesaleBean();
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
        bean.setGasReturn(formBean.getGasReturn());
        bean.setGasReturnPrice(formBean.getGasReturnPrice());
        bean.setGasReturnAmount(formBean.getGasReturnAmount());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertGasWholesale(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateGasWholesale(bean);
            }
            addGasWholesaleDetail(formBean);
            addGasWholesalePromotionMaterial(formBean);
            addGasWholesaleReturnShellDetail(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addGasWholesaleDetail(GasWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasWholesaleDetail(formBean.getId());
            if (formBean.getShellId() != null) {
                int length = formBean.getShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getGasWholesaleDetailId()[i], 0);
                    if (id == 0) {
                        GasWholesaleDetailBean bean = new GasWholesaleDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        bean.setGasWholesaleId(formBean.getId());
                        gasDAO.insertGasWholesaleDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        GasWholesaleDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (GasWholesaleDetailBean) arrDetail.get(j);
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
                                gasDAO.updateGasWholesaleDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            GasWholesaleDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (GasWholesaleDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteGasWholesaleDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addGasWholesalePromotionMaterial(GasWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasWholesalePromotionMaterialDetail(formBean.getId());
            if (formBean.getPromotionMaterialId() != null) {
                int length = formBean.getPromotionMaterialId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getGasWholesalePromotionMaterialDetailId()[i], 0);
                    if (id == 0) {
                        GasWholesalePromotionMaterialDetailBean bean = new GasWholesalePromotionMaterialDetailBean();
                        bean.setPromotionMaterialId(NumberUtil.parseInt(formBean.getPromotionMaterialId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getPromotionMaterialQuantity()[i], 0));
                        bean.setGasWholesaleId(formBean.getId());
                        gasDAO.insertGasWholesalePromotionMaterialDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        GasWholesalePromotionMaterialDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (GasWholesalePromotionMaterialDetailBean) arrDetail.get(j);
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
                                gasDAO.updateGasWholesalePromotionMaterialDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            GasWholesalePromotionMaterialDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (GasWholesalePromotionMaterialDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteGasWholesalePromotionMaterialDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addGasWholesaleReturnShellDetail(GasWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasWholesaleReturnShellDetail(formBean.getId());
            if (formBean.getReturnShellId() != null) {
                int length = formBean.getReturnShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getGasWholesaleReturnShellDetailId()[i], 0);
                    if (id == 0) {
                        GasWholesaleReturnShellDetailBean bean = new GasWholesaleReturnShellDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                        bean.setGasWholesaleId(formBean.getId());
                        gasDAO.insertGasWholesaleReturnShellDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        GasWholesaleReturnShellDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (GasWholesaleReturnShellDetailBean) arrDetail.get(j);
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
                                gasDAO.updateGasWholesaleReturnShellDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            GasWholesaleReturnShellDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (GasWholesaleReturnShellDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteGasWholesaleReturnShellDetails(ids);
        } catch (Exception ex) {
        }
    }
}
