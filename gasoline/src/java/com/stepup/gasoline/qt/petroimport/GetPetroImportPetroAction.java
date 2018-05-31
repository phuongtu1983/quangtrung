/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.petroimport;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.PetroBean;
import com.stepup.gasoline.qt.bean.PetroImportDetailBean;
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
public class GetPetroImportPetroAction extends SpineAction {

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
        int petroId = NumberUtil.parseInt(request.getParameter("petroId"), 0);
        ArrayList arrDetail = new ArrayList();
        PetroImportDetailBean bean = new PetroImportDetailBean();
        try {
            GoodDAO goodDAO = new GoodDAO();
            PetroBean petroBean = goodDAO.getPetro(petroId);
            if (petroBean != null) {
                bean.setPetroName(petroBean.getName());
                bean.setPetroId(petroBean.getId());
                bean.setUnitId(petroBean.getUnitId());
                bean.setUnitName(petroBean.getUnitName());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(bean);
        request.setAttribute(Constants.PETRO_IMPORT_PETRO, arrDetail);

        return true;
    }
}
