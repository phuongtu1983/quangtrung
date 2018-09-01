<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="fixedAssetGroupFormshowHelpHideDivContent">
    <form name="fixedAssetGroupForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fixedassetgroup.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.FIXED_ASSET_GROUP%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.FIXED_ASSET_GROUP%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.FIXED_ASSET_GROUP%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_GROUP)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveFixedAssetGroup();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.FIXED_ASSET_GROUP%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_FIXED_ASSET_GROUP)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveFixedAssetGroup();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_FIXED_ASSET_GROUP)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delFixedAssetGroup();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('fixedAssetGroupFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.FIXED_ASSET_GROUP%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="fixedAssetGroupFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('fixedAssetGroupFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveFixedAssetGroup()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('fixedAssetGroupFormshowHelpHideDiv')</div>
</div>