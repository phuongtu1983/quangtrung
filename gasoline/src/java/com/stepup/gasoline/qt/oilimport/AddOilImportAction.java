/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.OilImportBean;
import com.stepup.gasoline.qt.bean.OilImportDetailBean;
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
public class AddOilImportAction extends SpineAction {

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
        OilImportFormBean formBean = (OilImportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        OilImportBean bean = null;
        int goodImportId = formBean.getId();
        try {
            bean = goodDAO.getOilImport(goodImportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (goodImportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new OilImportBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }
        
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setNote(formBean.getNote());
        bean.setStoreId(formBean.getStoreId());
        bean.setVendorId(formBean.getVendorId());
        bean.setCommission(formBean.getCommission());
        bean.setRate(formBean.getRate());
        bean.setTotalBeforeCommission(formBean.getTotalBeforeCommission());
        bean.setTotal(formBean.getTotal());
        bean.setPaid(formBean.getPaid());
        bean.setDebt(formBean.getDebt());
        bean.setAccountId(formBean.getAccountId());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertOilImport(bean);
                formBean.setId(id);
                addOilImportOil(formBean, needUpdate);
            } else {
                addOilImportOil(formBean, needUpdate);
                goodDAO.updateOilImport(bean);
            }

        } catch (Exception ex) {
        }
        return true;
    }

    private void addOilImportOil(OilImportFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getOilImportDetail(formBean.getId());
            int length = formBean.getOilId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getOilImportDetailId()[i], 0);
                if (id == 0) {
                    OilImportDetailBean bean = new OilImportDetailBean();
                    bean.setOilId(NumberUtil.parseInt(formBean.getOilId()[i], 0));
                    bean.setUnitId(NumberUtil.parseInt(formBean.getUnitId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setPrice(NumberUtil.parseInt(formBean.getPrice()[i], 0));
                    bean.setAmount(NumberUtil.parseInt(formBean.getAmount()[i], 0));
                    bean.setOilImportId(formBean.getId());
                    goodDAO.insertOilImportDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    OilImportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (OilImportDetailBean) arrDetail.get(j);
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
                            goodDAO.updateOilImportDetail(oldBean, formBean.getCreatedDate(), formBean.getStoreId());
                        }
                    }
                }
            }
            String ids = "0,";
            OilImportDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (OilImportDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteOilImportDetails(ids);
        } catch (Exception ex) {
        }
    }
}
