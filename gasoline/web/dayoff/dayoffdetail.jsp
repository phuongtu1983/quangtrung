<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="dayoffFormshowHelpHideDivContent">
    <form name="dayoffForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="dayoff.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.DAY_OFF%>"/></td>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.DAY_OFF%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="106" name="<%=Constants.DAY_OFF%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.DAY_OFF%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DAY_OFF)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDayoff();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.DAY_OFF%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_DAY_OFF)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveDayoff();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.DAY_OFF%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_DAY_OFF)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delDayoff();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('dayoffFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.DAY_OFF%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="dayoffFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('dayoffFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveDayoff()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('dayoffFormshowHelpHideDiv')</div>
</div>