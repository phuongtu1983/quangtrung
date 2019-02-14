<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="vendorCustomer.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>

        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {%> 
        <td><button class="i_create_write icon small green" onclick="return getVendorCustomer(0, 'loadVendorCustomerList');"><bean:message key="message.add"/></button></td>
            <%}%>
    </tr>
</table>
<form name='vendorCustomersForm' id='vendorCustomersForm'>
    <div id='vendorCustomerList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getVendorCustomer(0,'loadVendorCustomerList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadVendorCustomerList()</div>