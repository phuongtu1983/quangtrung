<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<div class="header"><bean:message key="fixedasset.list.title"/></div>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<table>
    <tr>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FIXED_ASSET)) {%> 
            <button class="i_create_write icon small green" onclick="return getFixedAsset(0,'loadFixedAssetList');"><bean:message key="message.add"/></button>
            <%}%>
        </td>
    </tr>
</table>
<form name='fixedAssetsForm' id='fixedAssetsForm'>
    <div id='fixedAssetList' style="width:100%; height:768px;"></div>
    <div id="recinfoArea"></div>
</form>

<div id="showHelpHideDiv" style="display:none">
    Ctrl+F : Tìm kiếm
    Ctrl+N : Thêm
</div>
<div id="shiftNFunctionHideDiv" style="display:none">getFixedAsset(0,'loadFixedAssetList')</div>
<div id="shiftFFunctionHideDiv" style="display:none">loadFixedAssetList()</div>