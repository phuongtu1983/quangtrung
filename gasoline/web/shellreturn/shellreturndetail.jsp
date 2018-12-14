<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="shellReturn.detail.add.title"/></div>
<form name="shellReturnForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.SHELL_RETURN%>" readonly="true" tabindex="-1"/></td>
            <td width="170" style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.SHELL_RETURN%>" styleId="shellReturnCreatedDate" tabindex="-1"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
            <td>
                <select style="width: 195px;" name="customerIdCombobox" id="customerIdCombobox" tabindex="0">
                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                    </logic:iterate>
                </select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="vehicle.title"/></td>
            <td>
                <html:select property="vehicleId" name="<%=Constants.SHELL_RETURN%>" style="width:195px">
                    <html:options collection="<%=Constants.VEHICLE_LIST%>" property="id" labelProperty="plate"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.SHELL_RETURN%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('shellReturnForm', 'shellReturnShellChk', 'shellReturnDetailTbl');" tabindex="-1"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addShellReturnShell();" tabindex="-1"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="shellIdCombobox" id="shellIdCombobox">
                                    <logic:iterate id="shell_iter" name="<%=Constants.SHELL_LIST%>">
                                        <option  value="${shell_iter.id}">${shell_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/shellreturn/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.SHELL_RETURN%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SHELL_RETURN)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveShellReturn();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.SHELL_RETURN%>" property="id" value="0">
                    <logic:equal name="<%=Constants.SHELL_RETURN%>" property="canEdit" value="1">
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SHELL_RETURN)) {%> 
                        <button class="i_create_write icon small green" onclick="return saveShellReturn();"><bean:message key="message.save"/></button>
                        <%}%>
                        <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_SHELL_RETURN)) {%> 
                        <button class="i_trashcan icon small red" onclick="return delShellReturn();"><bean:message key="message.del"/></button>
                        <%}%>
                    </logic:equal>
                </logic:notEqual>
                <button class="i_access_denied icon small yellow" onclick="return loadShellReturnPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.SHELL_RETURN%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="shellSelectedHidden" value="0"/>
    <html:hidden property="customerId" name="<%=Constants.SHELL_RETURN%>" />
    <input type="hidden" name="customerSelectedHidden" value="0"/>
</form>
<div name="shellReturnFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadShellReturnPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveShellReturn()</div>
<div id="shellReturnShellHideDiv" style="display:none"></div>