<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="loVo.detail.add.title"/></div>
<form name="loVoForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.LO_VO%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.LO_VO%>" styleId="loVoCreatedDate"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="quantity.title"/></td>
            <td colspan="3"><html:text property="quantity" size="30" name="<%=Constants.LO_VO%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
            <td colspan="3"><html:text property="note" size="100" name="<%=Constants.LO_VO%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="employee.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <button class="i_cross icon small red" onclick="return delTableRow('loVoForm', 'loVoEmployeeChk', 'loVoEmployeeDetailTbl');"><bean:message key="message.del"/></button>
                                <button class="i_plus icon small green" onclick="return addLoVoEmployee();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="employeeIdCombobox" id="employeeIdCombobox">
                                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr><td colspan="4"><div><%@include  file="/lovo/employeedetails.jsp" %></div></td></tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.LO_VO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_LO_VO)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveLoVo();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.LO_VO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_LO_VO)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveLoVo();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.LO_VO%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_LO_VO)) {%> 
                    <button class="i_trashcan icon small red" onclick="return delLoVo();"><bean:message key="message.del"/></button>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadLoVoPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.LO_VO%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="employeeSelectedHidden" value="0"/>
</form>
<div name="loVoFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadLoVoPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">saveLoVo()</div>
<div id="loVoGoodHideDiv" style="display:none"></div>
<div id="loVoEmployeeHideDiv" style="display:none"></div>