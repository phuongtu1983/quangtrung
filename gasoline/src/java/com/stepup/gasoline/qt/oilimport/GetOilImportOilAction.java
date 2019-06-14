/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.oilimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OilBean;
import com.stepup.gasoline.qt.bean.OilImportDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.Constants;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class GetOilImportOilAction extends SpineAction {

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
        int oilId = NumberUtil.parseInt(request.getParameter("oilId"), 0);
        ArrayList arrDetail = new ArrayList();
        ArrayList arrUnit = new ArrayList();
        OilImportDetailBean bean = new OilImportDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            OilBean goodBean = goodDAO.getOil(oilId);
            if (goodBean != null) {
                bean.setOilName(goodBean.getName());
                bean.setOilId(goodBean.getId());
                bean.setPrice(goodBean.getPrice());
                bean.setNo(NumberUtil.parseInt(request.getParameter("length"), 0));
            }
            arrUnit = goodDAO.getOilUnits(oilId);
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.OIL_IMPORT_OIL, arrDetail);
        request.setAttribute(Constants.UNIT_LIST, arrUnit);

        return true;
    }
}
