/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.attachmentfile;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.bean.FileAttachmentBean;
import com.stepup.gasoline.qt.dao.FileAttachmentDAO;

/**
 *
 * @author thcao
 */
public class UploadFileUtil {

    public static final int ATTACH_FILE_START = 0;
    public static final int ATTACH_FILE_CONTRACT = 1;
    public static final int ATTACH_FILE_END = 30;

    public static boolean isValidFType(int ftype) {
        return (ftype > ATTACH_FILE_START
                && ftype < ATTACH_FILE_END);
    }

    public static String getUploadFolder(int ftype) {
        String strFolder = "private";
        switch (ftype) {
            case ATTACH_FILE_CONTRACT:
                strFolder = "contract";
                break;
            default:
                strFolder = "notype";
                break;
        }
        return strFolder;
    }

    public static void deleteAttachmentFiles(String ids) {
        try {
            if (!StringUtil.isBlankOrNull(ids)) {
                String[] fileIds = ids.split(",");
                FileAttachmentDAO fileDAO = new FileAttachmentDAO();
                for (int i = 0; i < fileIds.length; i++) {
                    int id = NumberUtil.parseInt(fileIds[i], 0);
                    FileAttachmentBean bean = fileDAO.getAttachmentFile(id);
                    if (bean != null) {
                        FileUtil.delete(bean.getSource());
                        fileDAO.deleteAttachmentFile(id);
                    }
                }
            }
        } catch (Exception ex) {
        }
    }
}
