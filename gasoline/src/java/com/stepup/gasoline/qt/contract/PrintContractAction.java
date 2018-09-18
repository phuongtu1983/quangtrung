/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.contract;

import com.stepup.core.util.FileUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.core.util.OutputUtil;
import com.stepup.gasoline.qt.bean.ContractBean;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.dao.ContractDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.QTUtil;
import fr.opensagres.xdocreport.document.IXDocReport;
import fr.opensagres.xdocreport.document.registry.XDocReportRegistry;
import fr.opensagres.xdocreport.template.IContext;
import fr.opensagres.xdocreport.template.TemplateEngineKind;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Administrator
 */
public class PrintContractAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("contractId");
        try {
            ContractDAO contractDAO = new ContractDAO();
            ContractBean bean = contractDAO.getContract(NumberUtil.parseInt(id, 0));
            if (bean != null) {
                ArrayList arrayFile = new ArrayList();
                String templateFileName = "contract_template1";
                String userName = QTUtil.getMemberName(request.getSession());
                String wordDir = request.getSession().getServletContext().getRealPath(Constants.DOWNLOADED_TEMP_PATH);
                print(request, arrayFile, bean, userName, templateFileName, wordDir);
                String outputFileName = templateFileName + "-" + userName + ".zip";
                FileUtil.zipFile(arrayFile, outputFileName, true);
                OutputUtil.sendZipFileToOutput(response, outputFileName);
                deleteFiles(arrayFile);
            }
        } catch (Exception ex) {

        }
        return true;
    }

    private void print(HttpServletRequest request, ArrayList arrayFile, ContractBean contractBean, String userName, String templateFileName, String wordDir) throws IOException {
        OutputStream out = null;
        try {
            String fileName = wordDir + "/" + templateFileName + "-" + userName + ".docx";
            arrayFile.add(fileName);
            String wordTemplate = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".docx");
            // 1) Load Docx file by filling Freemarker template engine and cache it to the registry
            InputStream in = new FileInputStream(wordTemplate);
            IXDocReport report = XDocReportRegistry.getRegistry().loadReport(in, TemplateEngineKind.Freemarker);
            // 2) Create context Java model
            IContext context = report.createContext();
            // Register developers list
            List<ContractPrintedBean> docs = new ArrayList<ContractPrintedBean>();
            docs.add(new ContractPrintedBean(contractBean.getCode(), ));
            context.put("quangtrung", docs);
            // 3) Generate report by merging Java model with the Docx
            out = new FileOutputStream(new File(fileName));
            report.process(context, out);
        } catch (Exception ex) {
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    private void deleteFiles(ArrayList arrayFile) {
        for (int i = 0; i < arrayFile.size(); i++) {
            String name = arrayFile.get(i) + "";
            try {
                FileUtil.delete(name);
            } catch (Exception ex) {

            }
        }
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }
}
