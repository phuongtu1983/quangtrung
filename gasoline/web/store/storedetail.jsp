<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="storeFormshowHelpHideDivContent">
    <form name="storeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="store.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.STORE%>"/></td>
                            <td height="30" style="padding-right: 20px"><bean:message key="store.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.STORE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.STORE%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.STORE%>" style="width:260px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.isPetro"/></td>
                            <td><html:checkbox property="isPetro" name="<%=Constants.STORE%>"></html:checkbox></td>
                            <td style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.isGood"/></td>
                            <td><html:checkbox property="isGood" name="<%=Constants.STORE%>"></html:checkbox></td>
                            </tr>
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="customer.detail.isOil"/></td>
                                <td><html:checkbox property="isOil" name="<%=Constants.STORE%>"></html:checkbox></td>
                                <td style="padding-left: 10px; padding-right: 20px"><bean:message key="customer.detail.isSolar"/></td>
                                <td><html:checkbox property="isSolar" name="<%=Constants.STORE%>"></html:checkbox></td>
                            </tr>
                        </table>
                    </td></tr>
                <tr>
                    <td align="center" height="30" colspan="4">
                        <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.STORE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_STORE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveStore();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.STORE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_STORE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveStore();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('storeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.STORE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="storeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('storeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveStore()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('storeFormshowHelpHideDiv')</div>
</div>