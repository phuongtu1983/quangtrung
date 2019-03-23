/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleinner;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleInnerDetailBean;
import com.stepup.gasoline.qt.bean.ShellBean;
import com.stepup.gasoline.qt.bean.ShellVendorDetailBean;
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
public class GetSaleInnerGoodAction extends SpineAction {

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
        try {
            GoodDAO goodDAO = new GoodDAO();
            SaleInnerDetailBean bean = new SaleInnerDetailBean();
            ShellVendorDetailBean shellVendorBean = goodDAO.getShellVendor(goodId);
            if (shellVendorBean == null) {
                shellVendorBean = new ShellVendorDetailBean();
            }
            ShellBean shellBean = goodDAO.getShell(shellVendorBean.getShellId());
            if (shellBean != null) {
                bean.setShellName(shellVendorBean.getName());
                bean.setShellId(shellVendorBean.getId());
                bean.setUnitId(shellBean.getUnitId());
                bean.setUnitName(shellBean.getUnitName());
            }
            arrDetail.add(bean);
        } catch (Exception ex) {
        }

        request.setAttribute(Constants.SALE_INNER_GOOD, arrDetail);

        return true;
    }
}
