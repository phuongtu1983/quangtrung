<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="permission.header.title"/></div>
<form name='permissionSearchForm' id='permissionSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td><bean:message key="employee.title"/></td>
                <td>
                    <select style="width: 230px;" name="userCombobox" id="userCombobox">
                        <%@include  file="/combo/user.jsp"%>
                    </select>
                </td>
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadPermissionList();"><bean:message key="message.search"/></button></td>
            </tr>
            <tr>
                <td><bean:message key="message.permission.name"/></td>
                <td><input name="permissionName" size="34" value="" type="text"></td>
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadPermissionList(document.forms['permissionSearchForm'].permissionName.value);"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PERMISSION)) {%> 
            <button class="i_create_write icon small green" onclick="return getPermission(0);"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='permissionsForm' id='permissionsForm'>
    <div id='permissionList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
    <input type="hidden" name="userSelectedHidden" value="0"/>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getPermission()</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadPermissionList()</div>