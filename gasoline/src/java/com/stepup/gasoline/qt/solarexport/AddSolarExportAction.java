/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.solarexport;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.SolarExportBean;
import com.stepup.gasoline.qt.bean.SolarExportDetailBean;
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
public class AddSolarExportAction extends SpineAction {

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
        SolarExportFormBean formBean = (SolarExportFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SolarExportBean bean = null;
        int goodExportId = formBean.getId();
        try {
            bean = goodDAO.getSolarExport(goodExportId);
        } catch (Exception ex) {
        }
        boolean bNew = false;
        if (goodExportId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        if (bean == null) {
            bean = new SolarExportBean();
        }

        boolean needUpdate = false;
        if (StringUtil.isEqual(bean.getCreatedDate(), formBean.getCreatedDate())) {
            needUpdate = true;
        }
        
        bean.setId(formBean.getId());
        bean.setCode(formBean.getCode());
        bean.setSolarSaleId(formBean.getSolarSaleId());
        bean.setCustomerId(formBean.getCustomerId());
        bean.setCreatedDate(formBean.getCreatedDate());
        bean.setNote(formBean.getNote());
        bean.setTotal(formBean.getTotal());
        bean.setCreatedEmployeeId(QTUtil.getEmployeeId(request.getSession()));
        try {
            if (bNew) {
                int id = goodDAO.insertSolarExport(bean);
                formBean.setId(id);
                addSolarExportSolar(formBean, needUpdate);
            } else {
                addSolarExportSolar(formBean, needUpdate);
                goodDAO.updateSolarExport(bean);
            }

        } catch (Exception ex) {
        }
        return true;
    }

    private void addSolarExportSolar(SolarExportFormBean formBean, boolean needUpdate) {
        try {
            GoodDAO goodDAO = new GoodDAO();
            ArrayList arrDetail = goodDAO.getSolarExportDetail(formBean.getId());
            int length = formBean.getSolarId().length;
            int id = 0;
            boolean isUpdate = false;
            for (int i = 0; i < length; i++) {
                id = NumberUtil.parseInt(formBean.getSolarExportDetailId()[i], 0);
                if (id == 0) {
                    SolarExportDetailBean bean = new SolarExportDetailBean();
                    bean.setSolarId(NumberUtil.parseInt(formBean.getSolarId()[i], 0));
                    bean.setSolarSaleDetailId(NumberUtil.parseInt(formBean.getSolarSaleDetailId()[i], 0));
                    bean.setQuantity(NumberUtil.parseInt(formBean.getQuantity()[i], 0));
                    bean.setSolarExportId(formBean.getId());
                    goodDAO.insertSolarExportDetail(bean, formBean.getCreatedDate());
                } else {
                    isUpdate = false;
                    int j = 0;
                    SolarExportDetailBean oldBean = null;
                    for (; j < arrDetail.size(); j++) {
                        oldBean = (SolarExportDetailBean) arrDetail.get(j);
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
                            goodDAO.updateSolarExportDetail(oldBean);
                        }
                    }
                }
            }
            String ids = "0,";
            SolarExportDetailBean oldBean = null;
            for (int i = 0; i < arrDetail.size(); i++) {
                oldBean = (SolarExportDetailBean) arrDetail.get(i);
                ids += oldBean.getId() + ",";
            }
            ids += "0";
            goodDAO.deleteSolarExportDetails(ids);
        } catch (Exception ex) {
        }
    }
}
