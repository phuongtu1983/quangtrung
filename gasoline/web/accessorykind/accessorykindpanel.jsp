<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="accessoryKind.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<form name='accessoryKindSearchForm' id='accessoryKindSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td><bean:message key="employee.detail.status"/></td>
                <td>
                    <select style="width: 290px;" name="statusCombobox" id="statusCombobox">
                        <%@include  file="/combo/status.jsp"%>
                    </select>
                </td>
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadAccessoryKindList();"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ACCESSORY_KIND)) {%> 
            <button class="i_create_write icon small green" onclick="return getAccessoryKind(0,'loadAccessoryKindList');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='accessoryKindsForm' id='accessoryKindsForm'>
    <div id='accessoryKindList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getAccessoryKind(0,'loadAccessoryKindList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadAccessoryKindList()</div>