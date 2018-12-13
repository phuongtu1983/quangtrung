/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.goodimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.GoodImportBean;
import com.stepup.gasoline.qt.bean.GoodImportDetailBean;
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
public class AddGoodImportAction extends SpineAction {

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
        GoodImportFormBean formBean = (GoodImportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        GoodImportBean bean = null;
        int goodImportId = formBean.getId();
        try {
            bean = goodDAO.getGoodImport(goodImportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (goodImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new GoodImportBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }
        if (bean.getStoreId() != formBean.getStoreId()) {
            needUpdate = true;
        }

        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setNote(formBean.getNote());
        bean.setVendorId(formBean.getVendorId());
        bean.setStoreId(formBean.getStoreId());
        bean.setRate(formBean.getRate());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertGoodImport(bean);
                formBean.setId(id);
                addGoodImportGood(formBean, needUpdate);
            } else {
                addGoodImportGood(formBean, needUpdate);
                goodDAO.updateGoodImport(bean);
            }

        } catch (Exception ex) {
        }
        return true;
    }

    private void addGoodImportGood(GoodImportFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getGoodImportDetail(formBean.getId());
            int length = formBean.getGoodId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getGoodImportDetailId()[i], 0);
                if (id == 0) {
                    GoodImportDetailBean bean = new GoodImportDetailBean();
                    bean.setGoodId(NumberUtil.parseInt(formBean.getGoodId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseInt(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                    bean.setGoodImportId(formBean.getId());
                    goodDAO.insertGoodImportDetail(bean, formBean.getCreatedDate(), formBean.getStoreId());
                } else {
                    isUpdate = false;
                    int j = 0;
                    GoodImportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (GoodImportDetailBean) arrDetail.get(j);
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
                            goodDAO.updateGoodImportDetail(oldBean, formBean.getCreatedDate(), formBean.getStoreId());
                        }
                    }
                }
            }
            String ids = "0,";
            GoodImportDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (GoodImportDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteGoodImportDetails(ids);
        } catch (Exception ex) {
        }
    }
}
