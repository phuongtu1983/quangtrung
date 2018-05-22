<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="parameterFormshowHelpHideDivContent">
    <form name="parameterForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr>
                <td height="30" style="padding-right: 20px"><bean:message key="parameter.name.title"/></td>
                <td><html:text property="name" size="40" name="<%=Constants.PARAMETER%>" readonly="true"/></td>
            </tr>
            <tr>
                <td height="30" style="padding-right: 20px"><bean:message key="parameter.value.title"/></td>
                <td><html:text property="value" size="40" name="<%=Constants.PARAMETER%>"/></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_PARAMTER)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveParameter();"><bean:message key="message.save"/></button>
                        <%}%>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('parameterFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
        <html:hidden property="id" name="<%=Constants.PARAMETER%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="parameterFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('parameterFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveParameter()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('parameterFormshowHelpHideDiv')</div>
</div>