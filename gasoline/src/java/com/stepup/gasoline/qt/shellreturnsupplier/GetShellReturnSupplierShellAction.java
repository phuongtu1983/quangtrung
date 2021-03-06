/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.shellreturnsupplier;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.ShellReturnSupplierDetailBean;
import com.stepup.gasoline.qt.bean.ShellBean;
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
public class GetShellReturnSupplierShellAction extends SpineAction {

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
        ShellReturnSupplierDetailBean bean = new ShellReturnSupplierDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            ShellBean shellBean = goodDAO.getShell(shellId);
            if (shellBean != null) {
                bean.setShellName(shellBean.getName());
                bean.setShellId(shellBean.getId());
                bean.setUnitId(shellBean.getUnitId());
                bean.setUnitName(shellBean.getUnitName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.SHELL_RETURN_SUPPLIER_SHELL, arrDetail);

        return true;
    }
}
