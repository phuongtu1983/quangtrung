/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.goodimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GoodBean;
import com.stepup.gasoline.qt.bean.GoodImportDetailBean;
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
public class GetGoodImportGoodAction extends SpineAction {

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
        int goodId = NumberUtil.parseInt(request.getParameter("goodId"), 0);
        ArrayList arrDetail = new ArrayList();
        GoodImportDetailBean bean = new GoodImportDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            GoodBean goodBean = goodDAO.getGood(goodId);
            if (goodBean != null) {
                bean.setGoodName(goodBean.getName());
                bean.setGoodId(goodBean.getId());
                bean.setUnitId(goodBean.getUnitId());
                bean.setUnitName(goodBean.getUnitName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.GOOD_IMPORT_GOOD, arrDetail);

        return true;
    }
}
