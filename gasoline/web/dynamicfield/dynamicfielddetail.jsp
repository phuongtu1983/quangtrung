<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="dynamicFieldFormshowHelpHideDivContent">
    <form name="dynamicFieldForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="dynamicField.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.DYNAMIC_FIELD%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="dynamicField.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.DYNAMIC_FIELD%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.DYNAMIC_FIELD%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.DYNAMIC_FIELD%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DYNAMIC_FIELD)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDynamicField();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.DYNAMIC_FIELD%>" property="id" value="0">
                            <logic:equal name="<%=Constants.DYNAMIC_FIELD%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DYNAMIC_FIELD)) {%> 
                                <button class="i_create_write icon small green" onclick="return saveDynamicField();"><bean:message key="message.save"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.DYNAMIC_FIELD%>" property="id" value="0">
                            <logic:equal name="<%=Constants.DYNAMIC_FIELD%>" property="canEdit" value="1">
                                <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_DYNAMIC_FIELD)) {%> 
                                <button class="i_trashcan icon small red" onclick="return delDynamicField();"><bean:message key="message.del"/></button>
                                <%}%>
                            </logic:equal>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('dynamicFieldFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.DYNAMIC_FIELD%>" />
        <html:hidden property="tableName" name="<%=Constants.DYNAMIC_FIELD%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="dynamicFieldFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('dynamicFieldFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveDynamicField()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('dynamicFieldFormshowHelpHideDiv')</div>
</div>