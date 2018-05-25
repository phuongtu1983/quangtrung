<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="permission.detail.add.title"/></div>
<form name="permissionForm">
    <table width="100%">
        <tr style="padding-top: 20px">
            <td width="150px"><bean:message key="message.permission.name"/></td>
            <td><html:text styleClass="lbl10" size="40" property="name" name="<%=Constants.PERMISSION%>"/></td>
        </tr>  
        <tr>
            <td><bean:message key="message.description"/></td>
            <td><html:text styleClass="lbl10" size="100" property="note" name="<%=Constants.PERMISSION%>"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <div><%@include  file="/permission/permits.jsp" %></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <fieldset>
                    <legend><bean:message key="organization.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('permissionForm','permissionOrgChk','permissionOrgTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addPermissionOrg();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 290px;" name="organizationCombobox" id="organizationCombobox">
                                    <%@include  file="/combo/organization.jsp"%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2"><div><%@include  file="/permission/organizations.jsp" %></div></td>
        </tr>
        
        
        
        <tr>
            <td colspan="2">
                <fieldset>
                    <legend><bean:message key="employee.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('permissionForm','permissionEmpChk','permissionEmpTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addPermissionEmp();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 290px;" name="userCombobox" id="userCombobox">
                                    <%@include  file="/combo/user.jsp"%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="2"><div><%@include  file="/permission/employees.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="2">
                <p style="margin-top: 0; margin-bottom: 0">
                    <logic:equal name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return savePermission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:equal>
                    <logic:notEqual name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_create_write icon small green" onclick="return savePermission();"><bean:message key="message.save"/></button>
                        <%}%>
                    </logic:notEqual>
                    <logic:greaterThan name="<%=Constants.PERMISSION%>" property="perId" value="0">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_PERMISSION)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delPermission();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:greaterThan>
                    <button class="i_access_denied icon small yellow" onclick="return loadPermissionPanel();"><bean:message key="message.close"/></button></p>
            </td>
        </tr>
    </table>
    <html:hidden property="perId" name="<%=Constants.PERMISSION%>"/>
    <input type="hidden" name="userSelectedHidden" value="0"/>
    <input type="hidden" name="userSelectedTextHidden" value="0"/>
    <input type="hidden" name="organizationSelectedHidden" value="0"/>
    <input type="hidden" name="organizationSelectedTextHidden" value="0"/>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadPermissionPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">savePermission()</div>