/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock.petro;

import com.stepup.gasoline.qt.dao.ReportDAO;
import com.stepup.gasoline.qt.openingstock.OpeningStockAction;
import com.stepup.gasoline.qt.openingstock.PublicBean;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.jxls.reader.ReaderBuilder;
import net.sf.jxls.reader.ReaderConfig;
import net.sf.jxls.reader.XLSDataReadException;
import net.sf.jxls.reader.XLSReadStatus;
import net.sf.jxls.reader.XLSReader;

/**
 *
 * @author phuongtu
 */
public class ImportPetroOpeningStock implements OpeningStockAction {

    @Override
    public void runImport(HttpServletRequest request, String fileName) {
        String xmlConfig = request.getSession().getServletContext().getRealPath("/data_imported/petro_template.xml");
        String dataXLS = fileName;
        InputStream inputXML = null;
        InputStream inputXLS = null;
        try {
            File fileConfig = new File(xmlConfig);
            inputXML = new FileInputStream(fileConfig);
            XLSReader mainReader = ReaderBuilder.buildFromXML(inputXML);
            File fileData = new File(dataXLS);
            inputXLS = new FileInputStream(fileData);

            List lst = new ArrayList();
            PublicBean publicBean = new PublicBean();
            Map beans = new HashMap();
            beans.put("out", publicBean);
            beans.put("datas", lst);
            ReaderConfig.getInstance().setSkipErrors(true);
            XLSReadStatus readStatus = mainReader.read(inputXLS, beans);
            if (readStatus.isStatusOK()) {
                if (publicBean != null && "petro".equals(publicBean.getName())) {
                    if (lst != null) {
                        PetroOpeningStockUploadBean data = null;
                        ReportDAO reportDAO = new ReportDAO();
                        for (int i = 0; i < lst.size(); i++) {
                            data = (PetroOpeningStockUploadBean) lst.get(i);
                            if (data.getOrganizationId() == 0
                                    || data.getStoreId() == 0
                                    || data.getPetroId() == 0) {
                                continue;
                            }
                            try {
                                reportDAO.importPetroOpeningStock(publicBean.getDate(), data);
                            } catch (Exception ex) {
                            }
                        }
                    }
                }
            }
        } catch (XLSDataReadException e) {
            e.toString();
        } catch (Exception ex) {
            ex.toString();
        } finally {
            if (inputXLS != null) {
                try {
                    inputXLS.close();
                } catch (Exception ex) {
                }
            }
            if (inputXML != null) {
                try {
                    inputXML.close();
                } catch (Exception ex) {
                }
            }
        }
    }
}
