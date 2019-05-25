/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.saleoilreturnstore;

import com.stepup.gasoline.qt.bean.SaleOilReturnStoreBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AddSaleOilReturnStoreAction extends SpineAction {

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
        SaleOilReturnStoreFormBean formBean = (SaleOilReturnStoreFormBean) form;
        GoodDAO goodDAO = new GoodDAO();
        SaleOilReturnStoreBean bean = null;
        boolean bNew = false;
        int saleOilReturnStoreId = formBean.getId();
        if (saleOilReturnStoreId == 0) {
            bNew = true;
        } else {
            bNew = false;
        }
        bean = new SaleOilReturnStoreBean();
        bean.setId(formBean.getId());
        bean.setStoreId(formBean.getStoreId());
        bean.setOrganizationId(QTUtil.getOrganizationId(request.getSession()));
        try {
            if (bNew) {
                goodDAO.insertSaleOilReturnStore(bean);
            } else {
                goodDAO.updateSaleOilReturnStore(bean);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return true;
    }
}
