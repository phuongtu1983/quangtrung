`<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="vehicleIn.list.title"/></div>
<form name='vehicleInSearchForm' id='vehicleInSearchForm'>
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
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadVehicleInList(document.forms['vehicleInSearchForm'].fromDate.value,document.forms['vehicleInSearchForm'].toDate.value);"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VEHICLE_IN)) {%> 
            <button class="i_create_write icon small green" onclick="return getVehicleIn(0);"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='vehicleInsForm' id='vehicleInsForm'>
    <div id='vehicleInList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadVehicleInList(document.forms['vehicleInSearchForm'].fromDate.value,document.forms['vehicleInSearchForm'].toDate.value)</div>
<div id="shiftNFunctionHideDiv" style="display:none">getVehicleIn(0)</div>