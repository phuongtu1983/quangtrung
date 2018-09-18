/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.contract;

import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.attachmentfile.UploadFileUtil;
import com.stepup.gasoline.qt.bean.FileAttachmentBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.ContractDAO;
import com.stepup.gasoline.qt.dao.FileAttachmentDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class DeleteContractAction extends SpineAction {

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
        String id = request.getParameter("contractId");
        try {
            FileAttachmentDAO fileDAO = new FileAttachmentDAO();
            ArrayList files = fileDAO.getAttachmentFiles(UploadFileUtil.ATTACH_FILE_CONTRACT, NumberUtil.parseInt(id, 0));
            String ids = "0";
            for (int i = 0; i < files.size(); i++) {
                FileAttachmentBean bean = (FileAttachmentBean) files.get(i);
                ids += "," + bean.getId();
            }
            if (!ids.equals("0")) {
                UploadFileUtil.deleteAttachmentFiles(ids.substring(2));
            }
            ContractDAO contractDAO = new ContractDAO();
            contractDAO.deleteContract(id);
        } catch (Exception ex) {
        }
        return true;
    }
}
