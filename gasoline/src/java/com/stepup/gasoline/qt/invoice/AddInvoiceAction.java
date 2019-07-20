/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.invoice;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.InvoiceBean;
import com.stepup.gasoline.qt.bean.InvoiceDetailBean;
import com.stepup.gasoline.qt.bean.InvoicePaidDetailBean;
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
public class AddInvoiceAction extends SpineAction {

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
        InvoiceFormBean formBean = (InvoiceFormBean) form;
        ContractDAO contractDAO = new ContractDAO();
        InvoiceBean oldBean = null;
        boolean bNew = false;
        boolean isExist = false;
        try {
            oldBean = contractDAO.getInvoiceByNumber(formBean.getNumber());
        } catch (Exception ex) {
        }
        int invoiceId = formBean.getId();
        if (invoiceId == 0) {
            bNew = true;
            if (oldBean != null) {
                isExist = true;
            }
        } else {
            bNew = false;
            if (oldBean != null && oldBean.getId() != invoiceId) {
                isExist = true;
            }
        }
        if (isExist) {
            ActionMessages errors = new ActionMessages();
            errors.add("invoiceExisted", new ActionMessage("invoice.save.error"));
            saveErrors(request, errors);
            return false;
        }
        InvoiceBean bean = new InvoiceBean();
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
                invoiceId = contractDAO.insertInvoice(bean);
                formBean.setId(invoiceId);
                addInvoiceDetail(formBean);
                addInvoicePaidDetail(formBean);
            } else {
                addInvoiceDetail(formBean);
                addInvoicePaidDetail(formBean);
                contractDAO.updateInvoice(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }

    private void addInvoiceDetail(InvoiceFormBean formBean) {
        try {
            ContractDAO contractDAO = new ContractDAO();
            ArrayList arrDetail = contractDAO.getInvoiceDetail(formBean.getId());
            int length = formBean.getOilSaleDetailId().length;
            int id = 0;
            boolean isUpdate = false;
            String checkedOilSaleDetailIds = "0";
            if (formBean.getOilSaleDetailPaid() != null) {
                for (int i = 0; i < formBean.getOilSaleDetailPaid().length; i++) {
                    checkedOilSaleDetailIds += "," + formBean.getOilSaleDetailPaid()[i];
                }
            }
            checkedOilSaleDetailIds += ",0";
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getInvoiceDetailId()[i], 0);
                if (id == 0) {
                    InvoiceDetailBean bean = new InvoiceDetailBean();
                    bean.setOilSaleDetailId(NumberUtil.parseInt(formBean.getOilSaleDetailId()[i], 0));
                    if (checkedOilSaleDetailIds.indexOf("," + bean.getOilSaleDetailId() + ",") > -1) {
                        bean.setOilSaleDetailPaid(1);
                    } else {
                        bean.setOilSaleDetailPaid(0);
                    }
                    bean.setInvoiceId(formBean.getId());
                    contractDAO.insertInvoiceDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    InvoiceDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (InvoiceDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        int checked = 0;
                        if (checkedOilSaleDetailIds.indexOf("," + oldBean.getOilSaleDetailId() + ",") > -1) {
                            checked = 1;
                        }
                        if (oldBean.getOilSaleDetailPaid() != checked) {
                            isUpdate = true;
                            oldBean.setOilSaleDetailPaid(checked);
                        }
                        if (isUpdate) {
                            contractDAO.updateInvoiceDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            InvoiceDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (InvoiceDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            contractDAO.deleteInvoiceDetails(ids);
        } catch (Exception ex) {
        }
    }

    private void addInvoicePaidDetail(InvoiceFormBean formBean) {
        try {
            ContractDAO contractDAO = new ContractDAO();
            ArrayList arrDetail = contractDAO.getInvoicePaidDetail(formBean.getId());
            int length = formBean.getInvoicePaidDetailId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getInvoicePaidDetailId()[i], 0);
                if (id == 0) {
                    InvoicePaidDetailBean bean = new InvoicePaidDetailBean();
                    bean.setPaidDate(formBean.getPaidDate()[i] + "");
                    bean.setAmount(NumberUtil.parseDouble(formBean.getPaidAmount()[i], 0));
                    bean.setInvoiceId(formBean.getId());
                    contractDAO.insertInvoicePaidDetail(bean);
                } else {
                    isUpdate = false;
                    int j = 0;
                    InvoicePaidDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (InvoicePaidDetailBean) arrDetail.get(j);
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
                            contractDAO.updateInvoicePaidDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            InvoicePaidDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (InvoicePaidDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            contractDAO.deleteInvoicePaidDetails(ids);
        } catch (Exception ex) {
        }
    }
}
