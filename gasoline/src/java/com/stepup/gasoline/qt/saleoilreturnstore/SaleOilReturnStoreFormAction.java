/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoilreturnstore;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.SaleOilReturnStoreBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.OrganizationDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class SaleOilReturnStoreFormAction extends SpineAction {

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
        SaleOilReturnStoreBean bean = null;
        GoodDAO goodDAO = new GoodDAO();
        try {
            bean = goodDAO.getSaleOilReturnStoreByOrganizationId(QTUtil.getOrganizationId(request.getSession()));
        } catch (Exception ex) {
        }
        SaleOilReturnStoreFormBean formBean = null;
        if (bean == null) {
            formBean = new SaleOilReturnStoreFormBean();
        } else {
            formBean = new SaleOilReturnStoreFormBean(bean);
        }
        request.setAttribute(Constants.SALE_OIL_RETURN_STORE, formBean);

        ArrayList arrStore = null;
        try {
            OrganizationDAO organizationDAO = new OrganizationDAO();
            arrStore = organizationDAO.getStores(QTUtil.getOrganizationManageds(request.getSession()), VendorBean.IS_OIL);
        } catch (Exception ex) {
        }
        if (arrStore == null) {
            arrStore = new ArrayList();
        }
        request.setAttribute(Constants.STORE_LIST, arrStore);

        return true;
    }
}
