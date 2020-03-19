/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoicesolar;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.InvoiceSolarBean;
import com.stepup.gasoline.qt.bean.InvoiceSolarDetailBean;
import com.stepup.gasoline.qt.bean.InvoiceSolarPaidDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ContractDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 *
 * @author phuongtu
 */
public class AddInvoiceSolarAction extends SpineAction {

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
        InvoiceSolarFormBean formBean = (InvoiceSolarFormBean) form;
        ContractDAO contractDAO = new ContractDAO();
        InvoiceSolarBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = contractDAO.getInvoiceSolarByNumber(formBean.getNumber());
        } catch (Exception ex) {
        }
        int invoiceSolarId = formBean.getId();
        if (invoiceSolarId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != invoiceSolarId) {
                isExist = true;
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("invoiceSolarExisted", new ActionMessage("invoiceSolar.save.error"));
            saveErrors(request, errors);
            return false;
        }
        InvoiceSolarBean bean = new InvoiceSolarBean();
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setNumber(formBean.getNumber());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setAmount(formBean.getAmount());
        bean.setAmountPaid(formBean.getAmountPaid());
        bean.setNote(formBean.getNote());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                invoiceSolarId = contractDAO.insertInvoiceSolar(bean);
                formBean.setId(invoiceSolarId);
                addInvoiceSolarDetail(formBean);
                addInvoiceSolarPaidDetail(formBean);
            } else {
                addInvoiceSolarDetail(formBean);
                addInvoiceSolarPaidDetail(formBean);
                contractDAO.updateInvoiceSolar(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addInvoiceSolarDetail(InvoiceSolarFormBean formBean) {
        try {
            ContractDAO contractDAO = new ContractDAO();
            ArrayList arrDetail = contractDAO.getInvoiceSolarDetail(formBean.getId());
            int length = formBean.getSolarSaleDetailId().length;
            int id = 0;
            boolean isUpdate = false;
            String checkedSolarSaleDetailPaidIds = "0";
            String checkedSolarSaleDetailCommissionedIds = "0";
            if (formBean.getSolarSaleDetailPaid() != null) {
                for (int i = 0; i < formBean.getSolarSaleDetailPaid().length; i++) {
                    checkedSolarSaleDetailPaidIds += "," + formBean.getSolarSaleDetailPaid()[i];
                }
            }
            if (formBean.getSolarSaleDetailCommissioned() != null) {
                for (int i = 0; i < formBean.getSolarSaleDetailCommissioned().length; i++) {
                    checkedSolarSaleDetailCommissionedIds += "," + formBean.getSolarSaleDetailCommissioned()[i];
                }
            }
            checkedSolarSaleDetailPaidIds += ",0";
            checkedSolarSaleDetailCommissionedIds += ",0";
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getInvoiceSolarDetailId()[i], 0);
                if (id == 0) {
                    InvoiceSolarDetailBean bean = new InvoiceSolarDetailBean();
                    bean.setSolarSaleDetailId(NumberUtil.parseInt(formBean.getSolarSaleDetailId()[i], 0));
                    bean.setSolarSalePaidDetailAmount(NumberUtil.parseDouble(formBean.getSolarSalePaidDetailAmount()[i], 0));
                    if (checkedSolarSaleDetailPaidIds.indexOf("," + bean.getSolarSaleDetailId() + ",") > -1) {
                        bean.setSolarSaleDetailPaid(1);
                    } else {
                        bean.setSolarSaleDetailPaid(0);
                    }
                    if (checkedSolarSaleDetailCommissionedIds.indexOf("," + bean.getSolarSaleDetailId() + ",") > -1) {
                        bean.setSolarSaleDetailCommissioned(1);
                    } else {
                        bean.setSolarSaleDetailCommissioned(0);
                    }
                    bean.setInvoiceSolarId(formBean.getId());
                    contractDAO.insertInvoiceSolarDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    InvoiceSolarDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (InvoiceSolarDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        int paidChecked = 0;
                        int commissionChecked = 0;
                        if (checkedSolarSaleDetailPaidIds.indexOf("," + oldBean.getSolarSaleDetailId() + ",") > -1) {
                            paidChecked = 1;
                        }
                        if (checkedSolarSaleDetailCommissionedIds.indexOf("," + oldBean.getSolarSaleDetailId() + ",") > -1) {
                            commissionChecked = 1;
                        }
                        if (oldBean.getSolarSalePaidDetailAmount() != NumberUtil.parseDouble(formBean.getSolarSalePaidDetailAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setSolarSalePaidDetailAmount(NumberUtil.parseDouble(formBean.getSolarSalePaidDetailAmount()[i], 0));
                        }
                        if (oldBean.getSolarSaleDetailPaid() != paidChecked) {
                            isUpdate = true;
                            oldBean.setSolarSaleDetailPaid(paidChecked);
                        }
                        if (oldBean.getSolarSaleDetailCommissioned() != commissionChecked) {
                            isUpdate = true;
                            oldBean.setSolarSaleDetailCommissioned(commissionChecked);
                        }
                        if (isUpdate) {
                            contractDAO.updateInvoiceSolarDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            InvoiceSolarDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (InvoiceSolarDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            contractDAO.deleteInvoiceSolarDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addInvoiceSolarPaidDetail(InvoiceSolarFormBean formBean) {
        try {
            ContractDAO contractDAO = new ContractDAO();
            ArrayList arrDetail = contractDAO.getInvoiceSolarPaidDetail(formBean.getId());
            int length = formBean.getInvoiceSolarPaidDetailId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getInvoiceSolarPaidDetailId()[i], 0);
                if (id == 0) {
                    InvoiceSolarPaidDetailBean bean = new InvoiceSolarPaidDetailBean();
                    bean.setPaidDate(formBean.getPaidDate()[i] + "");
                    bean.setAmount(NumberUtil.parseDouble(formBean.getPaidAmount()[i], 0));
                    bean.setInvoiceSolarId(formBean.getId());
                    contractDAO.insertInvoiceSolarPaidDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    InvoiceSolarPaidDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (InvoiceSolarPaidDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getPaidAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseDouble(formBean.getPaidAmount()[i], 0));
                        }
                        if (isUpdate) {
                            contractDAO.updateInvoiceSolarPaidDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            InvoiceSolarPaidDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (InvoiceSolarPaidDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            contractDAO.deleteInvoiceSolarPaidDetails(ids);
        } catch (Exception ex) {
        }
    }
}
