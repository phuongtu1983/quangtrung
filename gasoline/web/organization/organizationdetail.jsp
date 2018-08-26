<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="organizationFormshowHelpHideDivContent">
    <form name="organizationForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.ORGANIZATION%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.ORGANIZATION%>" style="width: 190px;">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.name"/></td>
                            <td colspan="3"><html:text property="name" size="90" name="<%=Constants.ORGANIZATION%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.address"/></td>
                            <td colspan="3"><html:text property="address" size="90" name="<%=Constants.ORGANIZATION%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px" colspan="4">
                                <div id="organizationDynamicField"><%@include  file="fieldvalues.jsp"%></div>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.ORGANIZATION%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveOrganization();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.ORGANIZATION%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ORGANIZATION)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveOrganization();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('organizationFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.ORGANIZATION%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="organizationFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('organizationFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveOrganization()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('organizationFormshowHelpHideDiv')</div>
</div>