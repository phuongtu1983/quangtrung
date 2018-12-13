/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessoryimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.AccessoryImportBean;
import com.stepup.gasoline.qt.bean.AccessoryImportDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
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
public class AddAccessoryImportAction extends SpineAction {

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
        AccessoryImportFormBean formBean = (AccessoryImportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        AccessoryImportBean bean = null;
        int gasImportId = formBean.getId();
        try {
            bean = goodDAO.getAccessoryImport(gasImportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (gasImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new AccessoryImportBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }

        bean.setId(formBean.getId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setCode(formBean.getCode());
        bean.setNote(formBean.getNote());
        bean.setVendorId(formBean.getVendorId());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertAccessoryImport(bean);
                formBean.setId(id);
                addAccessoryImportAccessory(formBean, needUpdate);
            } else {
                addAccessoryImportAccessory(formBean, needUpdate);
                goodDAO.updateAccessoryImport(bean);
            }
        } catch (Exception ex) {
        }
        return true;
    }

    private void addAccessoryImportAccessory(AccessoryImportFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getAccessoryImportDetail(formBean.getId());
            int length = formBean.getAccessoryId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getAccessoryImportDetailId()[i], 0);
                if (id == 0) {
                    AccessoryImportDetailBean bean = new AccessoryImportDetailBean();
                    bean.setAccessoryId(NumberUtil.parseInt(formBean.getAccessoryId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseInt(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                    bean.setAccessoryImportId(formBean.getId());
                    goodDAO.insertAccessoryImportDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    AccessoryImportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (AccessoryImportDetailBean) arrDetail.get(j);
                        if (oldBean.getId() == id) {
                            break;
                        }
                    }
                    if (j < arrDetail.size()) {
                        arrDetail.remove(j);
                        if (oldBean.getQuantity() != NumberUtil.parseDouble(formBean.getQuantity()[i], 0)) {
                            isUpdate = true;
                            oldBean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                        }
                        if (oldBean.getPrice() != NumberUtil.parseDouble(formBean.getPrice()[i], 0)) {
                            isUpdate = true;
                            oldBean.setPrice(NumberUtil.parseInt(formBean.getPrice()[i], 0));
                        }
                        if (oldBean.getAmount() != NumberUtil.parseDouble(formBean.getAmount()[i], 0)) {
                            isUpdate = true;
                            oldBean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                        }
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            goodDAO.updateAccessoryImportDetail(oldBean, formBean.getCreatedDate());
                        }
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
