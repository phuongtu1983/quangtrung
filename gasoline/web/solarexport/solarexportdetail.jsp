<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="solarExport.detail.add.title"/></div>
<form name="solarExportForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SOLAR_EXPORT%>" readonly="true" tabindex="-1"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SOLAR_EXPORT%>" styleId="solarExportCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td><html:text property="customerName" size="30" name="<%=Constants.SOLAR_EXPORT%>" readonly="true" tabindex="-1"/></td>
            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.SOLAR_EXPORT%>" readonly="true" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.SOLAR_EXPORT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr><td><button class="i_cross icon small red" onclick="return delSolarExportDetail();" tabindex="-1"><bean:message key="message.del"/></button></td></tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/solarexport/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SOLAR_EXPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SOLAR_EXPORT)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveSolarExport();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SOLAR_EXPORT%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SOLAR_EXPORT%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SOLAR_EXPORT)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveSolarExport();"><bean:message key="message.save"/></button>
                        <%}%>
                        <button class="i_printer icon small" onclick="return printSolarExport(<bean:write name="<%=Constants.SOLAR_EXPORT%>" property="id"/>);"><bean:message key="message.permission.permit.download"/></button>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SOLAR_EXPORT)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delSolarExport();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadSolarExportPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SOLAR_EXPORT%>" />
    <html:hidden property="customerId" name="<%=Constants.SOLAR_EXPORT%>" />
    <html:hidden property="solarSaleId" name="<%=Constants.SOLAR_EXPORT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="solarSelectedHidden" value="0"/>
</form>
<div name="solarExportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadSolarExportPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveSolarExport()</div>
<div id="solarExportSolarHideDiv" style="display:none"></div>