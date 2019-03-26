<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="gasWholeSaleFeeFormshowHelpHideDivContent">
    <form name="gasWholeSaleFeeForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="gasWholeSaleFee.detail.name"/></td>
                            <td><html:text property="name" size="40" name="<%=Constants.GAS_WHOLESALE_FEE%>"/></td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="gasWholeSale.fee.detail.kind.title"/></td>
                            <td>
                                <html:select property="kind" name="<%=Constants.GAS_WHOLESALE_FEE%>">
                                    <html:options collection="<%=Constants.GAS_WHOLESALE_FEE_KIND_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="employee.detail.status"/></td>
                            <td>
                                <html:select property="status" name="<%=Constants.GAS_WHOLESALE_FEE%>">
                                    <html:options collection="<%=Constants.STATUS_LIST%>" property="value" labelProperty="label"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.GAS_WHOLESALE_FEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_GAS_WHOLESALE_FEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGasWholeSaleFee();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.GAS_WHOLESALE_FEE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_GAS_WHOLESALE_FEE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveGasWholeSaleFee();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('gasWholeSaleFeeFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.GAS_WHOLESALE_FEE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="gasWholeSaleFeeFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('gasWholeSaleFeeFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveGasWholeSaleFee()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('gasWholeSaleFeeFormshowHelpHideDiv')</div>
</div>