<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="goodFormshowHelpHideDivContent">
    <form name="goodForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="good.detail.code"/></td>
                            <td><html:text property="code" size="40" name="<%=Constants.GOOD%>"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="good.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.GOOD%>"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="unit.title"/></td>
                            <td>
                                <html:select property="unitId" name="<%=Constants.GOOD%>" style="width:260px">
                                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="price.sale.title"/></td>
                            <td><html:text property="price" size="40" name="<%=Constants.GOOD%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.GOOD%>" style="width:260px">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="organization.title"/></td>
                            <td>
                                <html:select property="organizationId" name="<%=Constants.GOOD%>">
                                    <html:options collection="<%=Constants.ORGANIZATION_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.GOOD%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GOOD)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGood();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.GOOD%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GOOD)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGood();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('goodFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.GOOD%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="goodFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('goodFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveGood()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('goodFormshowHelpHideDiv')</div>
</div>