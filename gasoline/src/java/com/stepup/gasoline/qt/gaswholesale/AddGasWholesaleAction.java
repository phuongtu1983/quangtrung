/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.GasWholesaleBean;
import com.stepup.gasoline.qt.bean.GasWholesaleDetailBean;
import com.stepup.gasoline.qt.bean.GasWholesaleFeeDetailBean;
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

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }

        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setDiscount(formBean.getDiscount());
        bean.setTotalPay(formBean.getTotalPay());
        bean.setAccountId(formBean.getAccountId());
        bean.setVehicleOutId(formBean.getVehicleOutId());
        bean.setGasReturn(formBean.getGasReturn());
        bean.setGasReturnPrice(formBean.getGasReturnPrice());
        bean.setGasReturnAmount(formBean.getGasReturnAmount());
        bean.setOldDebt(formBean.getOldDebt());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertGasWholesale(bean);
                formBean.setId(id);
                addGasWholesaleDetail(formBean, needUpdate);
                addGasWholesalePromotionMaterial(formBean, needUpdate);
                addGasWholesaleReturnShellDetail(formBean, needUpdate);
                addGasWholesaleFee(formBean);
            } else {
                addGasWholesaleDetail(formBean, needUpdate);
                addGasWholesalePromotionMaterial(formBean, needUpdate);
                addGasWholesaleReturnShellDetail(formBean, needUpdate);
                addGasWholesaleFee(formBean);
                gasDAO.updateGasWholesale(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addGasWholesaleDetail(GasWholesaleFormBean formBean, boolean needUpdate) {
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
                        gasDAO.insertGasWholesaleDetail(bean, formBean.getCreatedDate());
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
                            if (needUpdate) {
                                isUpdate = true;
                            }
                            if (isUpdate) {
                                gasDAO.updateGasWholesaleDetail(oldBean, formBean.getCreatedDate());
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

    private void addGasWholesalePromotionMaterial(GasWholesaleFormBean formBean, boolean needUpdate) {
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
                        gasDAO.insertGasWholesalePromotionMaterialDetail(bean, formBean.getCreatedDate());
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
                            if (needUpdate) {
                                isUpdate = true;
                            }
                            if (isUpdate) {
                                gasDAO.updateGasWholesalePromotionMaterialDetail(oldBean, formBean.getCreatedDate());
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

    private void addGasWholesaleReturnShellDetail(GasWholesaleFormBean formBean, boolean needUpdate) {
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
                        gasDAO.insertGasWholesaleReturnShellDetail(bean, formBean.getCreatedDate());
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
                            if (needUpdate) {
                                isUpdate = true;
                            }
                            if (isUpdate) {
                                gasDAO.updateGasWholesaleReturnShellDetail(oldBean, formBean.getCreatedDate());
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

    private void addGasWholesaleFee(GasWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getGasWholesaleFeeDetail(formBean.getId());
            if (formBean.getFeeId() != null) {
                int length = formBean.getFeeId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getGasWholesaleFeeDetailId()[i], 0);
                    if (id == 0) {
                        GasWholesaleFeeDetailBean bean = new GasWholesaleFeeDetailBean();
                        bean.setFeeId(NumberUtil.parseInt(formBean.getFeeId()[i], 0));
                        bean.setAmount(NumberUtil.parseInt(formBean.getFeeAmount()[i], 0));
                        bean.setNote(formBean.getFeeNote()[i]);
                        bean.setGasWholesaleId(formBean.getId());
                        gasDAO.insertGasWholesaleFeeDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        GasWholesaleFeeDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (GasWholesaleFeeDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getAmount() != NumberUtil.parseInt(formBean.getFeeAmount()[i], 0)) {
                                isUpdate = true;
                                oldBean.setAmount(NumberUtil.parseInt(formBean.getFeeAmount()[i], 0));
                            }
                            if (!oldBean.getNote().equals(formBean.getFeeNote()[i])) {
                                isUpdate = true;
                                oldBean.setNote(formBean.getFeeNote()[i]);
                            }
                            if (isUpdate) {
                                gasDAO.updateGasWholesaleFeeDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            GasWholesaleFeeDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (GasWholesaleFeeDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteGasWholesaleFeeDetails(ids);
        } catch (Exception ex) {
        }
    }
}
