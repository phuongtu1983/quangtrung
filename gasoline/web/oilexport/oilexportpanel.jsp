`<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="oilExport.list.title"/></div>
<form name='oilExportSearchForm' id='oilExportSearchForm'>
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
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadOilExportList(document.forms['oilExportSearchForm'].fromDate.value,document.forms['oilExportSearchForm'].toDate.value);"><bean:message key="message.search"/></button></td>
            </tr>
        </table>
    </fieldset>
</form>
<form name='oilExportsForm' id='oilExportsForm'>
    <div id='oilExportList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadOilExportList(document.forms['oilExportSearchForm'].fromDate.value,document.forms['oilExportSearchForm'].toDate.value)</div>
<div id="shiftNFunctionHideDiv" style="display:none">getOilExport(0)</div>