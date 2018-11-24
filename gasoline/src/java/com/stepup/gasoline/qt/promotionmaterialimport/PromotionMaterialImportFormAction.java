/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.promotionmaterialimport;

import com.stepup.core.util.DateUtil;
import com.stepup.gasoline.qt.bean.PromotionMaterialImportBean;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.VendorBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.AccountDAO;
import com.stepup.gasoline.qt.dao.GoodDAO;
import com.stepup.gasoline.qt.dao.VendorDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.PermissionUtil;
import com.stepup.gasoline.qt.util.QTUtil;
import com.stepup.gasoline.qt.vendor.VendorFormBean;
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
public class PromotionMaterialImportFormAction extends SpineAction {

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
        PromotionMaterialImportBean bean = null;
        String id = request.getParameter("promotionMaterialImportId");
        ArrayList arrDetail = null;
        GoodDAO goodDAO = new GoodDAO();
        if (!GenericValidator.isBlankOrNull(id)) {
            try {
                int promotionMaterialImportId = Integer.parseInt(id);
                bean = goodDAO.getPromotionMaterialImport(promotionMaterialImportId);
                arrDetail = goodDAO.getPromotionMaterialImportDetail(promotionMaterialImportId);
            } catch (Exception ex) {
            }
        }
        PromotionMaterialImportFormBean formBean = null;
        if (bean != null) {
            formBean = new PromotionMaterialImportFormBean(bean);
            if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT_PAST, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {
                formBean.setCanEdit(1);
            }
        } else {
            formBean = new PromotionMaterialImportFormBean();
            try {
                String prefix = "";
                if (formBean.getId() == 0) {
                    prefix = DateUtil.today("yyyyMMdd") + "-PI-";
                    String number = goodDAO.getNextPromotionMaterialImportNumber(prefix, 4);
                    prefix += number;
                }
                formBean.setCode(prefix);
            } catch (Exception ex) {
            }
        }

        request.setAttribute(Constants.PROMOTION_MATERIAL_IMPORT, formBean);
        if (arrDetail == null) {
            arrDetail = new ArrayList();
        }
        request.setAttribute(Constants.PROMOTION_MATERIAL_IMPORT_PROMOTION_MATERIAL, arrDetail);

        ArrayList arrPromotionMaterial = null;
        try {
            arrPromotionMaterial = goodDAO.getPromotionMaterials(EmployeeBean.STATUS_ACTIVE);
        } catch (Exception ex) {
        }
        if (arrPromotionMaterial == null) {
            arrPromotionMaterial = new ArrayList();
        }
        request.setAttribute(Constants.PROMOTION_MATERIAL_LIST, arrPromotionMaterial);

        String organizationIds = QTUtil.getOrganizationManageds(request.getSession());
        ArrayList arrAccount = null;
        try {
            AccountDAO accountDAO = new AccountDAO();
            arrAccount = accountDAO.getAccounts(organizationIds);
        } catch (Exception ex) {
        }
        if (arrAccount == null) {
            arrAccount = new ArrayList();
        }
        request.setAttribute(Constants.ACCOUNT_LIST, arrAccount);

        ArrayList arrVendor = null;
        try {
            VendorDAO vendorDAO = new VendorDAO();
            if (formBean.getVendorId() != 0) {
                VendorFormBean vendorFormBean = vendorDAO.getVendor(formBean.getVendorId());
                if (vendorFormBean == null) {
                    vendorFormBean = new VendorFormBean();
                }
                if (arrVendor == null) {
                    arrVendor = new ArrayList();
                }
                arrVendor.add(vendorFormBean);
            } else {
                arrVendor = vendorDAO.getVendors(organizationIds, VendorBean.IS_GOOD);
            }
        } catch (Exception ex) {
        }
        if (arrVendor == null) {
            arrVendor = new ArrayList();
        }
        request.setAttribute(Constants.VENDOR_LIST, arrVendor);

        return true;
    }
}
