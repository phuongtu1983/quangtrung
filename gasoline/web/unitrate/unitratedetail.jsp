<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="unitRateFormshowHelpHideDivContent">
    <form name="unitRateForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="unitRate.detail.baseUnit"/></td>
                            <td>
                                <html:select property="baseUnitId" name="<%=Constants.UNIT_RATE%>" style="width:250px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="unitRate.detail.parentUnit"/></td>
                            <td>
                                <html:select property="parentUnitId" name="<%=Constants.UNIT_RATE%>" style="width:250px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="unitRate.detail.rate"/></td>
                            <td><html:text property="rate" size="40" name="<%=Constants.UNIT_RATE%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.UNIT_RATE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_UNIT_RATE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveUnitRate();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.UNIT_RATE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_UNIT_RATE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveUnitRate();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.UNIT_RATE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_UNIT_RATE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delUnitRate();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('unitRateFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.UNIT_RATE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="unitRateFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('unitRateFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveUnitRate()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('unitRateFormshowHelpHideDiv')</div>
</div>