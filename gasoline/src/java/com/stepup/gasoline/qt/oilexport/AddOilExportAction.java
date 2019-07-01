/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilexport;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.OilExportBean;
import com.stepup.gasoline.qt.bean.OilExportDetailBean;
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
public class AddOilExportAction extends SpineAction {

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
        OilExportFormBean formBean = (OilExportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        OilExportBean bean = null;
        int goodExportId = formBean.getId();
        try {
            bean = goodDAO.getOilExport(goodExportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (goodExportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new OilExportBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }
        
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setOilSaleId(formBean.getOilSaleId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setNote(formBean.getNote());
        bean.setTotal(formBean.getTotal());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertOilExport(bean);
                formBean.setId(id);
                addOilExportOil(formBean, needUpdate);
            } else {
                addOilExportOil(formBean, needUpdate);
                goodDAO.updateOilExport(bean);
            }

        } catch (Exception ex) {
        }
        return true;
    }

    private void addOilExportOil(OilExportFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getOilExportDetail(formBean.getId());
            int length = formBean.getOilId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getOilExportDetailId()[i], 0);
                if (id == 0) {
                    OilExportDetailBean bean = new OilExportDetailBean();
                    bean.setOilId(NumberUtil.parseInt(formBean.getOilId()[i], 0));
                    bean.setOilSaleDetailId(NumberUtil.parseInt(formBean.getOilSaleDetailId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setOilExportId(formBean.getId());
                    goodDAO.insertOilExportDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    OilExportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (OilExportDetailBean) arrDetail.get(j);
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
                        if (needUpdate) {
                            isUpdate = true;
                        }
                        if (isUpdate) {
                            goodDAO.updateOilExportDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            OilExportDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (OilExportDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteOilExportDetails(ids);
        } catch (Exception ex) {
        }
    }
}
