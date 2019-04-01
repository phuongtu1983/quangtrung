<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="dayoff.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>
        <td><button class="i_magnifying_glass icon small blue" onclick="return loadDayoffList();"><bean:message key="message.search"/></button></td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_DAY_OFF)) {%> 
        <td><button class="i_create_write icon small green" onclick="return getDayoff(0, 'loadDayoffList');"><bean:message key="message.add"/></button></td>
            <%}%>
    </tr>
</table>
<form name='dayoffsForm' id='dayoffsForm'>
    <div id='dayoffList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getDayoff(0,'loadDayoffList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadDayoffList()</div>