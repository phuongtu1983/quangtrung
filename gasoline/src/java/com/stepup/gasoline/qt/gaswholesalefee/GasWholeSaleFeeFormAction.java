/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.gaswholesalefee;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.GasWholeSaleFeeBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GasDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

/**
 *
 * @author phuongtu
 */
public class GasWholeSaleFeeFormAction extends SpineAction {

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
        GasWholeSaleFeeBean bean = null;
        String gasWholesaleFeeId = request.getParameter("gasWholeSaleFeeId");
        if (!GenericValidator.isBlankOrNull(gasWholesaleFeeId)) {
            GasDAO gasWholesaleFeeDAO = new GasDAO();
            try {
                bean = gasWholesaleFeeDAO.getGasWholeSaleFee(NumberUtil.parseInt(gasWholesaleFeeId, 0));
            } catch (Exception ex) {
            }
        }
        GasWholeSaleFeeFormBean formBean = null;
        if (bean == null) {
            formBean = new GasWholeSaleFeeFormBean();
        } else {
            formBean = new GasWholeSaleFeeFormBean(bean);
        }
        request.setAttribute(Constants.GAS_WHOLESALE_FEE, formBean);
        
        ArrayList arrKind = new ArrayList();
        LabelValueBean value;
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("gasWholeSale.fee.detail.kind.increase.title"));
        value.setValue(GasWholeSaleFeeBean.KIND_INCREASE + "");
        arrKind.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("gasWholeSale.fee.detail.kind.decrease.title"));
        value.setValue(GasWholeSaleFeeBean.KIND_DECREASE + "");
        arrKind.add(value);
        request.setAttribute(Constants.GAS_WHOLESALE_FEE_KIND_LIST, arrKind);

        ArrayList arrStatus = new ArrayList();
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.active"));
        value.setValue(EmployeeBean.STATUS_ACTIVE + "");
        arrStatus.add(value);
        value = new LabelValueBean();
        value.setLabel(QTUtil.getBundleString("employee.detail.status.inactive"));
        value.setValue(EmployeeBean.STATUS_INACTIVE + "");
        arrStatus.add(value);
        request.setAttribute(Constants.STATUS_LIST, arrStatus);
        return true;
    }
}
