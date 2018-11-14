/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.openingstock;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.StringUtil;
import com.stepup.gasoline.qt.core.BaseAction;
import com.stepup.gasoline.qt.core.ExcelExport;
import com.stepup.gasoline.qt.dao.ReportDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author phuongtu
 */
public class ExportOpeningStockAction extends BaseAction {

    @Override
    public boolean doAction(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {

        try {
            String reportName = request.getParameter("reportName");
            String templateFileName = "";
            if (!StringUtil.isBlankOrNull(reportName)) {
                Map beans = new HashMap();
                ExcelExport exporter = new ExcelExport();
                String date = request.getParameter("date");
                beans.put("qtrp_date", date);
                ArrayList list = null;
                if (reportName.equals("accessory")) {
                    templateFileName = "ton_dau_ky_phu_kien";
                    list = printAccessoryOpeningStockReport(date);
                } else if (reportName.equals("customer")) {
                    templateFileName = "ton_dau_ky_khach_hang";
                    list = printCustomerOpeningStockReport(date);
                } else if (reportName.equals("good")) {
                    templateFileName = "ton_dau_ky_hang_hoa";
                    list = printGoodOpeningStockReport(date);
                } else if (reportName.equals("lpg")) {
                    templateFileName = "ton_dau_ky_lpg";
                    list = printLpgOpeningStockReport(date);
                } else if (reportName.equals("money")) {
                    templateFileName = "ton_dau_ky_quy_tien";
                    list = printMoneyOpeningStockReport(date);
                } else if (reportName.equals("petro")) {
                    templateFileName = "ton_dau_ky_xang_dau";
                    list = printPetroOpeningStockReport(date);
                } else if (reportName.equals("promotionMaterial")) {
                    templateFileName = "ton_dau_ky_hang_khuyen_mai";
                    list = printPromotionMaterialOpeningStockReport(date);
                } else if (reportName.equals("shellGas")) {
                    templateFileName = "ton_dau_ky_binh_gas";
                    list = printShellGasOpeningStockReport(date);
                } else if (reportName.equals("shell")) {
                    templateFileName = "ton_dau_ky_vo_binh";
                    list = printShellOpeningStockReport(date);
                } else if (reportName.equals("shield")) {
                    templateFileName = "ton_dau_ky_shield";
                    list = printShieldOpeningStockReport(date);
                } else if (reportName.equals("vendor")) {
                    templateFileName = "ton_dau_ky_nha_cung_cap";
                    list = printVendorOpeningStockReport(date);
                }

                String sourceFile = request.getSession().getServletContext().getRealPath("/templates/" + templateFileName + ".xls");
                if (list == null) {
                    list = new ArrayList();
                }
                beans.put("dulieu", list);
                exporter.setBeans(beans);
                exporter.export(request, response, sourceFile, templateFileName + ".xls");
            }
        } catch (Exception ex) {
            LogUtil.error("FAILED:PrintReportAction:print-" + ex.getMessage());
        }

        return true;
    }

    @Override
    protected boolean isReturnStream() {
        return true;
    }

    private ArrayList printAccessoryOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportAccessoryOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printCustomerOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportCustomerOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printGoodOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportGoodOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printLpgOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportLpgOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printMoneyOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportMoneyOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printPetroOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportPetroOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printPromotionMaterialOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportPromotionMaterialOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printShellGasOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportShellGasOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printShellOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportShellOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printShieldOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportShieldOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

    private ArrayList printVendorOpeningStockReport(String date) {
        ArrayList list = null;
        try {
            ReportDAO reportDAO = new ReportDAO();
            list = reportDAO.exportVendorOpeningStock(date);
        } catch (Exception ex) {
        }
        return list;
    }

}
