/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.attachmentfile;

import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.FileAttachmentBean;
import com.stepup.gasoline.qt.core.SpineAction;
import com.stepup.gasoline.qt.dao.FileAttachmentDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author thcao
 */
public class GetAttachmentFileListAction extends SpineAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        StringBuilder buff = new StringBuilder();
        buff.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        buff.append("<rows>");
        try {
            int fileType = NumberUtil.parseInt(request.getParameter("fileType"), 0);
            int parentId = NumberUtil.parseInt(request.getParameter("parentId"), 0);
            if (UploadFileUtil.isValidFType(fileType)) {
                try {
                    FileAttachmentDAO fileAttachmentDAO = new FileAttachmentDAO();
                    ArrayList list = fileAttachmentDAO.getAttachmentFiles(fileType, parentId);

                    if (list != null) {
                        int length = list.size();
                        for (int i = 0; i < length; i++) {
                            FileAttachmentBean bean = (FileAttachmentBean) list.get(i);
                            buff.append("<row id=\"").append(bean.getId()).append("\">");
                            buff.append("<cell>0</cell>");
                            buff.append("<cell>").append(StringUtil.encodeString(bean.getName())).append("^").append(request.getContextPath()).append(bean.getHref()).append("</cell>");
                            buff.append("<cell>").append(StringUtil.encodeString(bean.getEmployeeName())).append("</cell>");
                            buff.append("<cell>").append(bean.getCreatedDate()).append("</cell>");
                            buff.append("</row>");
                        }
                    }
                } catch (Exception ex) {
                }
            }
        } catch (Exception ex) {
        }
        buff.append("</rows>");

        OutputUtil.sendXmlStringToOutput(response, buff.toString());

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
