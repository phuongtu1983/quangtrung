<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="organization.detail.add.title"/></div>
<form name="organizationForm">
    <table width="100%" cellspacing="0" cellpadding="0" >
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.code"/></td>
                        <td><html:text property="code" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                        <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employee.detail.status"/></td>
                        <td>
                            <html:select property="status" name="<%=Constants.ORGANIZATION%>" style="width: 190px;">
                                <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.tax"/></td>
                        <td colspan="3"><html:text property="tax" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.name"/></td>
                        <td colspan="3"><html:text property="name" size="80" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.phone"/></td>
                        <td><html:text property="phone" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                        <td style="padding-right: 20px;padding-left: 10px"><bean:message key="organization.detail.fax"/></td>
                        <td><html:text property="fax" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.presenter"/></td>
                        <td><html:text property="presenter" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                        <td style="padding-right: 20px;padding-left: 10px"><bean:message key="organization.detail.presenterPosition"/></td>
                        <td><html:text property="presenterPosition" size="30" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.bankAccount"/></td>
                        <td colspan="3"><html:text property="bankAccount" size="80" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px"><bean:message key="organization.detail.address"/></td>
                        <td colspan="3"><html:text property="address" size="80" name="<%=Constants.ORGANIZATION%>"/></td>
                    </tr>
                    <tr>
                        <td height="30" style="padding-right: 20px" colspan="4">
                            <div id="organizationDynamicField"><%@include  file="fieldvalues.jsp"%></div>
                        </td>
                    </tr>
                    <logic:notEqual name="<%=Constants.ORGANIZATION%>" property="id" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_ORGANIZATION)) {%> 
                        <tr>
                            <td colspan="4">
                                <fieldset>
                                    <legend><bean:message key="shell.title"/></legend>
                                    <table>
                                        <tr>
                                            <td>
                                                <button class="i_cross icon small red" onclick="return delTableRow('organizationForm', 'organizationShellChk', 'organizationShellDetailTbl');"><bean:message key="message.del"/></button>
                                                <button class="i_plus icon small green" onclick="return addOrganizationShell();"><bean:message key="message.add"/></button>
                                            </td>
                                            <td>
                                                <select style="width: 260px;" name="shellIdCombobox" id="shellIdCombobox">
                                                    <logic:iterate id="shell_iter" name="<%=Constants.SHELL_LIST%>">
                                                        <option  value="${shell_iter.id}">${shell_iter.name}</option>
                                                    </logic:iterate>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr><td colspan="4"><div><%@include  file="/organization/shelldetails.jsp" %></div></td></tr>
                                    <%}%>
                                </logic:notEqual>
                </table>
            </td>
        </tr>
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
                    <button class="i_access_denied icon small yellow" onclick="return loadOrganizationPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table> 
    <html:hidden property="id" name="<%=Constants.ORGANIZATION%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
</form>
<div name="organizationFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadOrganizationPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveOrganization()</div>
<div id="shiftEscFunctionHideDiv" style="display:none">loadOrganizationPanel()</div>
<div id="organizationShellHideDiv" style="display:none"></div>