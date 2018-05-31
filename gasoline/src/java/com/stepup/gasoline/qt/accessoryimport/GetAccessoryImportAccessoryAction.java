/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.accessoryimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.AccessoryBean;
import com.stepup.gasoline.qt.bean.AccessoryImportDetailBean;
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
public class GetAccessoryImportAccessoryAction extends SpineAction {

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
        int accessoryId = NumberUtil.parseInt(request.getParameter("accessoryId"), 0);
        ArrayList arrDetail = new ArrayList();
        AccessoryImportDetailBean bean = new AccessoryImportDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            AccessoryBean accessoryBean = goodDAO.getAccessory(accessoryId);
            if (accessoryBean != null) {
                bean.setAccessoryName(accessoryBean.getName());
                bean.setAccessoryId(accessoryBean.getId());
                bean.setUnitId(accessoryBean.getUnitId());
                bean.setUnitName(accessoryBean.getUnitName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.ACCESSORY_IMPORT_ACCESSORY, arrDetail);

        return true;
    }
}
