<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeOffIncreaseFormshowHelpHideDivContent">
    <form name="employeeOffIncreaseForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" size="30" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" styleId="employeeOffIncreaseDate" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
                            <td colspan="3">
                                <select style="width: 195px;" name="employeeIdCombobox" id="employeeIdCombobox">
                                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="dayoff.title"/></td>
                            <td>
                                <html:select property="dayoffId" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" style="width:195px">
                                    <html:options collection="<%=Constants.DAY_OFF_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="employeeOffIncrease.detail.quantity"/></td>
                            <td><html:text property="quantity" size="30" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="78" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOffIncrease();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOffIncrease();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_OFF_INCREASE)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delEmployeeOffIncrease();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeOffIncreaseFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="employeeId" name="<%=Constants.EMPLOYEE_OFF_INCREASE%>" />
        <input type="hidden" name="employeeSelectedHidden" value="0"/>
    </form>
    <div name="employeeOffIncreaseFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeOffIncreaseFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeOffIncrease()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeOffIncreaseFormshowHelpHideDiv')</div>
</div>