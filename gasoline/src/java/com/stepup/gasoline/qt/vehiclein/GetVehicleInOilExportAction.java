/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.vehiclein;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.OilExportBean;
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
public class GetVehicleInOilExportAction extends SpineAction {

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
        int oilExportId = NumberUtil.parseInt(request.getParameter("oilExportId"), 0);
        ArrayList arrDetail = new ArrayList();
        try {
            GoodDAO goodDAO = new GoodDAO();
            OilExportBean oilExportBean = goodDAO.getOilExport(oilExportId);
            if (oilExportBean == null) {
                oilExportBean = new OilExportBean();
            }
            arrDetail.add(oilExportBean);
        } catch (Exception ex) {
        }

        request.setAttribute(Constants.VEHICLE_IN_OIL_EXPORT, arrDetail);

        return true;
    }
}
