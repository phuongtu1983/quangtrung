/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.fraction;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.FractionDetailBean;
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
public class GetFractionShellAction extends SpineAction {

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
        int shellId = NumberUtil.parseInt(request.getParameter("shellId"), 0);
        ArrayList arrDetail = new ArrayList();
        FractionDetailBean bean = new FractionDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            ShellVendorDetailBean shellVendorBean = goodDAO.getShellVendor(shellId);
            if (shellVendorBean == null) {
                shellVendorBean = new ShellVendorDetailBean();
            }
            if (bean != null) {
                bean.setShellName(shellVendorBean.getName());
                bean.setShellId(shellVendorBean.getId());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.FRACTION_SHELL, arrDetail);

        return true;
    }
}
