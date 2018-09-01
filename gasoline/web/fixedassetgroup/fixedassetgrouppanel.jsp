<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="fixedassetgroup.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>

        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET_GROUP)) {%> 
        <td><button class="i_create_write icon small green" onclick="return getFixedAssetGroup(0, 'loadFixedAssetGroupList');"><bean:message key="message.add"/></button></td>
            <%}%>
    </tr>
</table>
<form name='fixedAssetGroupsForm' id='fixedAssetGroupsForm'>
    <div id='fixedAssetGroupList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getFixedAssetGroup(0,'loadFixedAssetGroupList')</div>