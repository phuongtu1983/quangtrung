<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="employee.header.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<form name='employeeSearchForm' id='employeeSearchForm'>
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
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadEmployeeList();"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>

        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE)) {%> 
        <td><button class="i_create_write icon small green" onclick="return getEmployee(0, 'loadEmployeeList');"><bean:message key="message.add"/></button></td>
            <%}%>
    </tr>
</table>
<form name='employeesForm' id='equipmentsForm'>
    <div id='employeeList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getEmployee(0,'loadEmployeeList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadEmployeeList()</div>