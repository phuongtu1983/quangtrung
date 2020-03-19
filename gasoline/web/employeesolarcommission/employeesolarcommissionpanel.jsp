<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="employeeSolarCommission.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_SOLAR_COMMISSION)) {%> 
            <button class="i_create_write icon small green" onclick="return getEmployeeSolarCommission(0,'loadEmployeeSolarCommissionList');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='employeeSolarCommissionsForm' id='employeeSolarCommissionsForm'>
    <div id='employeeSolarCommissionList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getEmployeeSolarCommission(0,'loadEmployeeSolarCommissionList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadEmployeeSolarCommissionList()</div>