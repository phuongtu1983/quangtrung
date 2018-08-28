<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<div class="header"><bean:message key="salary.list.title"/></div>
<form name='salarySearchForm' id='salarySearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td><bean:message key="month.title"/></td>
                <td><input type="text" name="fromDate" id="fromDate" size="15"></td>
                <td><button class="i_magnifying_glass icon small blue" onclick="return loadSalaryList(document.forms['salarySearchForm'].fromDate.value);"><bean:message key="message.search"/></button></td>
                    <logic:present name="<%=Constants.NOT_SALARY%>">
                    <td><button class="i_create_write icon small green" onclick="return createSalary();"><bean:message key="message.create"/></button></td>
                    </logic:present>
            </tr>
        </table>
    </fieldset>
</form>
<form name='salarysForm' id='salarysForm'>
    <div id='salaryList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>
<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadSalaryList(document.forms['salarySearchForm'].fromDate.value)</div>
<div id="shiftNFunctionHideDiv" style="display:none">getSalary(0)</div>