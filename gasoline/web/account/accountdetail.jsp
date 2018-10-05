<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="accountFormshowHelpHideDivContent">
    <form name="accountForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.detail.number"/></td>
                            <td><html:text property="number" size="40" name="<%=Constants.ACCOUNT%>"/></td>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.detail.holder"/></td>
                            <td><html:text property="holder" size="40" name="<%=Constants.ACCOUNT%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.detail.bank"/></td>
                            <td><html:text property="bank" size="40" name="<%=Constants.ACCOUNT%>"/></td>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.detail.branch"/></td>
                            <td><html:text property="branch" size="40" name="<%=Constants.ACCOUNT%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.ACCOUNT%>" style="width:260px">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td height="30" style="padding-right: 20px"><bean:message key="account.detail.cashType"/></td>
                            <td>
                                <html:select property="isCash" name="<%=Constants.ACCOUNT%>" style="width:260px">
                                    <html:options collection="<%=Constants.CASH_TYPE_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="106" name="<%=Constants.ACCOUNT%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.ACCOUNT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCOUNT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveAccount();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.ACCOUNT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ACCOUNT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveAccount();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('accountFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.ACCOUNT%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="accountFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('accountFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveAccount()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('accountFormshowHelpHideDiv')</div>
</div>