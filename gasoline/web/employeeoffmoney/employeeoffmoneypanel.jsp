<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="employeeOffMoney.list.title"/></div>
<form name='employeeOffMoneySearchForm' id='employeeOffMoneySearchForm'>
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
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadEmployeeOffMoneyList(document.forms['employeeOffMoneySearchForm'].fromDate.value,document.forms['employeeOffMoneySearchForm'].toDate.value);"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_MONEY)) {%> 
            <button class="i_create_write icon small green" onclick="return getEmployeeOffMoney(0,'loadEmployeeOffMoneyPanel');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='employeeOffMoneysForm' id='employeeOffMoneysForm'>
    <div id='employeeOffMoneyList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadEmployeeOffMoneyList(document.forms['employeeOffMoneySearchForm'].fromDate.value,document.forms['employeeOffMoneySearchForm'].toDate.value)</div>
<div id="shiftNFunctionHideDiv" style="display:none">getEmployeeOffMoney(0)</div>