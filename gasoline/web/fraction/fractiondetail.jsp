<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="fraction.header.add.title"/></div>
<form name="fractionForm">
    <table style="width: 100%">
        <tr>
            <td width="80" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="20" name="<%=Constants.FRACTION%>" readonly="true"/></td>
            <td width="100"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="10" name="<%=Constants.FRACTION%>" styleId="fractionCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.FRACTION%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('fractionForm', 'fractionShellChk', 'fractionDetailTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addFractionShell();"><bean:message key="message.add"/></button>
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
            <td colspan="4"><div><%@include  file="/fraction/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.FRACTION%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_FRACTION)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveFraction();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.FRACTION%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_FRACTION)) {%> 
                    <logic:equal name="<%=Constants.FRACTION%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return saveFraction();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.FRACTION%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_FRACTION)) {%> 
                    <logic:equal name="<%=Constants.FRACTION%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delFraction();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadFractionPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.FRACTION%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="fractionFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadFractionPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveFraction()</div>
<div id="fractionShellHideDiv" style="display:none"></div>