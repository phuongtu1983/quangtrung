<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="fixedAssetFormshowHelpHideDivContent">
    <form name="fixedAssetForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fixedasset.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.FIXED_ASSET%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="fixedassetgroup.title"/></td>
                            <td>
                                <html:select property="groupId" name="<%=Constants.FIXED_ASSET%>" style="width:250px">
                                    <html:options collection="<%=Constants.FIXED_ASSET_GROUP_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fixedasset.detail.date"/></td>
                            <td><html:text property="startDate" styleId="fixedAssetStartDate" size="40" name="<%=Constants.FIXED_ASSET%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="quantity.title"/></td>
                            <td><html:text property="quantity" size="40" name="<%=Constants.FIXED_ASSET%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="fixedasset.detail.rate"/></td>
                            <td><html:text property="rate" size="40" name="<%=Constants.FIXED_ASSET%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="fixedasset.detail.month"/></td>
                            <td><html:text property="monthCount" size="40" name="<%=Constants.FIXED_ASSET%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="unit.title"/></td>
                            <td>
                                <html:select property="unitId" name="<%=Constants.FIXED_ASSET%>" style="width:250px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="40" name="<%=Constants.FIXED_ASSET%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td colspan="3">
                                <html:select property="status" name="<%=Constants.FIXED_ASSET%>" style="width:255px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.FIXED_ASSET%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveFixedAsset();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.FIXED_ASSET%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_FIXED_ASSET)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveFixedAsset();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_FIXED_ASSET)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delFixedAsset();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('fixedAssetFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.FIXED_ASSET%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="fixedAssetFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('fixedAssetFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveFixedAsset()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('fixedAssetFormshowHelpHideDiv')</div>
</div>