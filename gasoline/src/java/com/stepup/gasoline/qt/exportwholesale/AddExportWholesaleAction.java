/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.exportwholesale;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ExportWholesaleBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleDetailBean;
import com.stepup.gasoline.qt.bean.ExportWholesaleReturnShellDetailBean;
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
public class AddExportWholesaleAction extends SpineAction {

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
        ExportWholesaleFormBean formBean = (ExportWholesaleFormBean) form;
        GasDAO gasDAO = new GasDAO();
        ExportWholesaleBean bean = null;
        int exportWholesaleId = formBean.getId();
        try {
            bean = gasDAO.getExportWholesale(exportWholesaleId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (exportWholesaleId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new ExportWholesaleBean();
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
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = gasDAO.insertExportWholesale(bean);
                formBean.setId(id);
            } else {
                gasDAO.updateExportWholesale(bean);
            }
            addExportWholesaleDetail(formBean);
            addExportWholesaleReturnShell(formBean);
        } catch (Exception ex) {
        }
        return true;
    }

    private void addExportWholesaleDetail(ExportWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getExportWholesaleDetail(formBean.getId());
            if (formBean.getShellId() != null) {
                int length = formBean.getShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getExportWholesaleDetailId()[i], 0);
                    if (id == 0) {
                        ExportWholesaleDetailBean bean = new ExportWholesaleDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        bean.setPrice(NumberUtil.parseDouble(formBean.getPrice()[i], 0));
                        bean.setAmount(NumberUtil.parseDouble(formBean.getAmount()[i], 0));
                        bean.setExportWholesaleId(formBean.getId());
                        gasDAO.insertExportWholesaleDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        ExportWholesaleDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (ExportWholesaleDetailBean) arrDetail.get(j);
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
                                gasDAO.updateExportWholesaleDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            ExportWholesaleDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (ExportWholesaleDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteExportWholesaleDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addExportWholesaleReturnShell(ExportWholesaleFormBean formBean) {
        try {
            GasDAO gasDAO = new GasDAO();
            ArrayList arrDetail = gasDAO.getExportWholesaleReturnShellDetail(formBean.getId());
            if (formBean.getReturnShellId() != null) {
                int length = formBean.getReturnShellId().length;
                int id = 0;
                boolean isUpdate = false;
                for (int i = 0; i < length; i++) {
                    id = NumberUtil.parseInt(formBean.getExportWholesaleReturnShellDetailId()[i], 0);
                    if (id == 0) {
                        ExportWholesaleReturnShellDetailBean bean = new ExportWholesaleReturnShellDetailBean();
                        bean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                        bean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                        bean.setExportWholesaleId(formBean.getId());
                        gasDAO.insertExportWholesaleReturnShellDetail(bean);
                    } else {
                        isUpdate = false;
                        int j = 0;
                        ExportWholesaleReturnShellDetailBean oldBean = null;
                        for (; j < arrDetail.size(); j++) {
                            oldBean = (ExportWholesaleReturnShellDetailBean) arrDetail.get(j);
                            if (oldBean.getId() == id) {
                                break;
                            }
                        }
                        if (j < arrDetail.size()) {
                            arrDetail.remove(j);
                            if (oldBean.getShellId() != NumberUtil.parseInt(formBean.getReturnShellId()[i], 0)) {
                                isUpdate = true;
                                oldBean.setShellId(NumberUtil.parseInt(formBean.getReturnShellId()[i], 0));
                            }
                            if (oldBean.getQuantity() != NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0)) {
                                isUpdate = true;
                                oldBean.setQuantity(NumberUtil.parseInt(formBean.getReturnShellQuantity()[i], 0));
                            }
                            if (isUpdate) {
                                gasDAO.updateExportWholesaleReturnShellDetail(oldBean);
                            }
                        }
                    }
                }
            }
            String ids = "0,";
            ExportWholesaleReturnShellDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (ExportWholesaleReturnShellDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            gasDAO.deleteExportWholesaleReturnShellDetails(ids);
        } catch (Exception ex) {
        }
    }

}
