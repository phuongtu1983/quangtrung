<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<div class="header"><bean:message key="dynamicField.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_ORGANIZATION)) {%> 
            <button class="i_create_write icon small green" onclick="return getDynamicField(0, 'loadDynamicFieldList');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='dynamicFieldsForm' id='dynamicFieldsForm'>
    <div id='dynamicFieldList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<input id="dynamicFieldTableName" value='<bean:write name="<%=Constants.DYNAMIC_FIELD_TABLE%>" property="tableName"/>' type="hidden">
<div id="shiftNFunctionHideDiv" style="display:none">getDynamicField(0,'loadDynamicFieldList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadDynamicFieldList()</div>