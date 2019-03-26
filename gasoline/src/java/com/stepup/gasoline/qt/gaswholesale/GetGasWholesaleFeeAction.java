/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesale;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.GasWholeSaleFeeBean;
import com.stepup.gasoline.qt.bean.GasWholesaleFeeDetailBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
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
public class GetGasWholesaleFeeAction extends SpineAction {

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
        int feeId = NumberUtil.parseInt(request.getParameter("feeId"), 0);
        ArrayList arrDetail = new ArrayList();
        GasWholesaleFeeDetailBean feeDetailBean = new GasWholesaleFeeDetailBean();
        try {
            GasDAO gasDAO = new GasDAO();
            GasWholeSaleFeeBean bean = gasDAO.getGasWholeSaleFee(feeId);
            if (bean != null) {
                feeDetailBean.setFeeId(bean.getId());
                feeDetailBean.setFeeName(bean.getName());
                feeDetailBean.setKind(bean.getKind());
            }
        } catch (Exception ex) {
        }
        arrDetail.add(feeDetailBean);
        request.setAttribute(Constants.GAS_WHOLESALE_FEE, arrDetail);

        return true;
    }
}
