<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="vehicleFormshowHelpHideDivContent">
    <form name="vehicleForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vehicle.detail.plate"/></td>
                            <td><html:text property="plate" size="40" name="<%=Constants.VEHICLE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="90" name="<%=Constants.VEHICLE%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.VEHICLE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVehicle();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.VEHICLE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VEHICLE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVehicle();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.VEHICLE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_VEHICLE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delVehicle();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('vehicleFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.VEHICLE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="vehicleFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('vehicleFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveVehicle()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('vehicleFormshowHelpHideDiv')</div>
</div>