<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="userFormshowHelpHideDivContent">
    <form name="userForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="user.detail.name"/></td>
                            <td><html:text property="username" size="25" name="<%=Constants.USER%>" tabindex="1"/></td>
                            <td height="30" style="padding-right: 20px;padding-left: 10px"><bean:message key="employee.title"/></td>
                            <td>
                                <select style="width: 170px;" name="empId">
                                    <%@include  file="/combo/user.jsp"%>
                                </select>
                            </td>
                        </tr>
                        <logic:equal name="<%=Constants.USER%>" property="id" value="0">
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="user.detail.password"/></td>
                                <td><html:password property="password" size="25" name="<%=Constants.USER%>"/></td>
                                <td height="30" style="padding-right: 20px;padding-left: 10px"><bean:message key="user.detail.confirmPassword"/></td>
                                <td><input name="confirmPassword" size="25" type="password" onblur="return checkConfirmPassword()"></td>
                            </tr>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.USER%>" property="id" value="0">
                            <tr>
                                <td height="30" style="padding-right: 20px"><bean:message key="user.detail.password"/></td>
                                <td><html:password property="password" size="25" name="<%=Constants.USER%>"/></td>
                                <td height="30" style="padding-right: 20px;padding-left: 10px"><bean:message key="user.detail.confirmPassword"/></td>
                                <td><input name="confirmPassword" size="25" type="password" onblur="return checkConfirmPassword()"></td>
                            </tr>
                        </logic:notEqual>
                        <tr>
                            <td height="30"><bean:message key="employee.detail.status"/></td>
                            <td colspan="3">
                                <html:select style="width: 170px;" property="status" name="<%=Constants.USER%>">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.USER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_USER)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveUser();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.USER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_USER)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveUser();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.USER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_USER)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delUser();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('userFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.USER%>" />
        <html:hidden property="fullname" name="<%=Constants.USER%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="userFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('userFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveUser()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('userFormshowHelpHideDiv')</div>
</div>