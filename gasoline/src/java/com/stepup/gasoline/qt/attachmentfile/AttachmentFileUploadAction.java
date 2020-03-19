/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.attachmentfile;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.FileAttachmentBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FileAttachmentDAO;
import com.stepup.gasoline.qt.openingstock.OpeningStockAction;
import com.stepup.gasoline.qt.openingstock.accessory.ImportAccessoryOpeningStock;
import com.stepup.gasoline.qt.openingstock.customer.ImportCustomerOpeningStock;
import com.stepup.gasoline.qt.openingstock.good.ImportGoodOpeningStock;
import com.stepup.gasoline.qt.openingstock.lpg.ImportLpgOpeningStock;
import com.stepup.gasoline.qt.openingstock.money.ImportMoneyOpeningStock;
import com.stepup.gasoline.qt.openingstock.oil.ImportOilOpeningStock;
import com.stepup.gasoline.qt.openingstock.petro.ImportPetroOpeningStock;
import com.stepup.gasoline.qt.openingstock.promotionmaterial.ImportPromotionMaterialOpeningStock;
import com.stepup.gasoline.qt.openingstock.shell.ImportShellOpeningStock;
import com.stepup.gasoline.qt.openingstock.shellgas.ImportShellGasOpeningStock;
import com.stepup.gasoline.qt.openingstock.shield.ImportShieldOpeningStock;
import com.stepup.gasoline.qt.openingstock.solar.ImportSolarOpeningStock;
import com.stepup.gasoline.qt.openingstock.vendor.ImportVendorOpeningStock;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class AttachmentFileUploadAction extends SpineAction {

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
        try {
            String image = request.getParameter("image");
            String attachFile = request.getParameter("attachFile");
            if (!StringUtil.isBlankOrNull(attachFile)) {
                int fileType = NumberUtil.parseInt(request.getParameter("fileType"), 0);
                String parentId = request.getParameter("parentId");
                if (!StringUtil.isBlankOrNull(image)) {
                    int ind = image.lastIndexOf("\\");
                    if (ind > -1) {
                        String name = image.substring(ind + 1);
                        String fileName = request.getSession().getServletContext().getRealPath(Constants.UPLOAD_TEMP_PATH + "/" + name);
                        String hrefDir = Constants.UPLOADED_PATH + "/" + UploadFileUtil.getUploadFolder(fileType);
                        String destFileDir = request.getSession().getServletContext().getRealPath(hrefDir);
                        FileUtil.copyFile(fileName, destFileDir, name);
                        FileUtil.delete(fileName);
                        FileAttachmentDAO fileDAO = new FileAttachmentDAO();
                        FileAttachmentBean bean = new FileAttachmentBean(0, name, destFileDir + "/" + name, hrefDir + "/" + name, null, QTUtil.getMemberID(request.getSession()), fileType, NumberUtil.parseInt(parentId, 0));
                        fileDAO.insertAttachmentFile(bean);
                    }
                }
            } else {
                String openingStockKind = request.getParameter("openingStockKind");
                if (!StringUtil.isBlankOrNull(openingStockKind)) {
                    int ind = image.lastIndexOf("\\");
                    if (ind > -1) {
                        String name = image.substring(ind + 1);
                        String fileName = request.getSession().getServletContext().getRealPath(Constants.UPLOAD_TEMP_PATH + "/" + name);
                        OpeningStockAction upload = null;
                        if (openingStockKind.equals("accessory")) {
                            upload = new ImportAccessoryOpeningStock();
                        } else if (openingStockKind.equals("customer")) {
                            upload = new ImportCustomerOpeningStock();
                        } else if (openingStockKind.equals("good")) {
                            upload = new ImportGoodOpeningStock();
                        } else if (openingStockKind.equals("lpg")) {
                            upload = new ImportLpgOpeningStock();
                        } else if (openingStockKind.equals("money")) {
                            upload = new ImportMoneyOpeningStock();
                        } else if (openingStockKind.equals("petro")) {
                            upload = new ImportPetroOpeningStock();
                        } else if (openingStockKind.equals("promotionMaterial")) {
                            upload = new ImportPromotionMaterialOpeningStock();
                        } else if (openingStockKind.equals("shellGas")) {
                            upload = new ImportShellGasOpeningStock();
                        } else if (openingStockKind.equals("shell")) {
                            upload = new ImportShellOpeningStock();
                        } else if (openingStockKind.equals("shield")) {
                            upload = new ImportShieldOpeningStock();
                        } else if (openingStockKind.equals("vendor")) {
                            upload = new ImportVendorOpeningStock();
                        } else if (openingStockKind.equals("oil")) {
                            upload = new ImportOilOpeningStock();
                        } else if (openingStockKind.equals("solar")) {
                            upload = new ImportSolarOpeningStock();
                        }
                        if (upload != null) {
                            upload.runImport(request, fileName);
                        }
                    }
                }
            }

        } catch (Exception ex) {
        }
        return true;
    }
}
