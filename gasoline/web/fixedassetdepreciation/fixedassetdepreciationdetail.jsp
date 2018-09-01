<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="fixedAssetDepreciation.detail.add.title"/></div>
<form name="fixedAssetDepreciationForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.FIXED_ASSET_DEPRECIATION%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.FIXED_ASSET_DEPRECIATION%>" styleId="fixedAssetDepreciationCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.FIXED_ASSET_DEPRECIATION%>"/></td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/fixedassetdepreciation/details.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:notEqual name="<%=Constants.FIXED_ASSET_DEPRECIATION%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_FIXED_ASSET_DEPRECIATION)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveFixedAssetDepreciation();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadFixedAssetDepreciationPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.FIXED_ASSET_DEPRECIATION%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="fixedAssetDepreciationFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadFixedAssetDepreciationPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveFixedAssetDepreciation()</div>
<div id="fixedAssetDepreciationGoodHideDiv" style="display:none"></div>
<div id="fixedAssetDepreciationChangeGoodHideDiv" style="display:none"></div>