<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="routeFormshowHelpHideDivContent">
    <form name="routeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="route.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.ROUTE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="route.detail.distance"/></td>
                            <td><html:text property="distance" size="40" name="<%=Constants.ROUTE%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="90" name="<%=Constants.ROUTE%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.ROUTE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ROUTE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveRoute();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.ROUTE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ROUTE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveRoute();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.ROUTE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_ROUTE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delRoute();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('routeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.ROUTE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="routeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('routeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveRoute()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('routeFormshowHelpHideDiv')</div>
</div>