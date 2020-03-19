<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="searchSolarSaleFormshowHelpHideDivContent">
    <form name="searchSolarSaleForm">
        <table cellspacing="0" cellpadding="0" style="border-width: 0px">
            <tr>
                <td style="padding-right: 20px" height="30"><bean:message key="code.title"/></td>
                <td><input type="text" size="30" id="searchSolarSaleCode"></td>
                <td style="padding-right: 20px;padding-left: 10px;"><bean:message key="solar.detail.name"/></td>
                <td><input type="text" size="30" id="searchSolarSaleSolar"></td>
            </tr>
            <tr>
                <td style="padding-right: 20px" height="30"><bean:message key="fromDate.title"/></td>
                <td><input type="text" size="30" id="searchSolarSaleFromDate"></td>
                <td style="padding-right: 20px;padding-left: 10px;"><bean:message key="toDate.title"/></td>
                <td><input type="text" size="30" id="searchSolarSaleToDate"></td>
            </tr>
            <tr>
                <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.name"/></td>
                <td><html:text property="name" size="30" name="<%=Constants.CUSTOMER%>" readonly="true"/></td>
                <td colspan="3">
                    <button class="i_magnifying_glass icon small blue" onclick="return searchSolarSale();"><bean:message key="message.search"/></button>
                    <button class="i_plus icon small green" onclick="return addInvoiceSolarDetail();"><bean:message key="message.add"/></button>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table id="searchSolarSaleDetailTbl" class="table-scroll small-first-col" style="width:1000px">
                        <thead>
                            <tr>
                                <td width="30px"><bean:message key="message.select"/></td>
                                <td width="200px"><bean:message key="code.title"/></td>
                                <td width="100px"><bean:message key="date.title"/></td>
                                <td width="500px"><bean:message key="solar.detail.name"/></td>
                                <td width="170px"><bean:message key="amount.title"/></td>
                            </tr>
                        </thead>
                        <tbody class="body-half-screen"></tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="6">
                    <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('searchSolarSaleFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
        <html:hidden property="id" name="<%=Constants.CUSTOMER%>" />
    </form>
</div>
<div id="searchSolarSaleResultHideDiv" style="display:none"></div>