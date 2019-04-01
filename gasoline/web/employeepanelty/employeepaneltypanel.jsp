<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="panelty.title"/></div>
<form name='employeePaneltySearchForm' id='employeePaneltySearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td><bean:message key="fromDate.title"/></td>
                <td colspan="2">
                    <input type="text" name="fromDate" id="fromDate" size="15">
                    <bean:message key="toDate.title"/>
                    <input type="text" name="toDate" id="toDate" size="15">
                </td>
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadEmployeePaneltyList(document.forms['employeePaneltySearchForm'].fromDate.value,document.forms['employeePaneltySearchForm'].toDate.value);"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_PANELTY)) {%> 
            <button class="i_create_write icon small green" onclick="return getEmployeePanelty(0,'loadEmployeePaneltyPanel');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='employeePaneltysForm' id='employeePaneltysForm'>
    <div id='employeePaneltyList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadEmployeePaneltyList(document.forms['employeePaneltySearchForm'].fromDate.value,document.forms['employeePaneltySearchForm'].toDate.value)</div>
<div id="shiftNFunctionHideDiv" style="display:none">getEmployeePanelty(0)</div>