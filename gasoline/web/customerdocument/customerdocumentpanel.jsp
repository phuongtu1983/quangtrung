<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="customerDocument.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>

        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CUSTOMER_DOCUMENT)) {%> 
        <td><button class="i_create_write icon small green" onclick="return getCustomerDocument(0, 'loadCustomerDocumentList');"><bean:message key="message.add"/></button></td>
            <%}%>
    </tr>
</table>
<form name='customerDocumentsForm' id='customerDocumentsForm'>
    <div id='customerDocumentList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getCustomerDocument(0,'loadCustomerDocumentList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadCustomerDocumentList()</div>