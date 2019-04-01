<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="employeeOtherBonusFormshowHelpHideDivContent">
    <form name="employeeOtherBonusForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" size="30" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" styleId="employeeOtherBonusDate" tabindex="-1"/></td>
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
                            <td height="30" style="padding-right: 20px"><bean:message key="otherBonus.title"/></td>
                            <td>
                                <html:select property="otherBonusId" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" style="width:195px">
                                    <html:options collection="<%=Constants.OTHER_BONUS_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="78" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_EMPLOYEE_OTHER_BONUS)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOtherBonus();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_EMPLOYEE_OTHER_BONUS)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveEmployeeOtherBonus();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_EMPLOYEE_OTHER_BONUS)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delEmployeeOtherBonus();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('employeeOtherBonusFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="employeeId" name="<%=Constants.EMPLOYEE_OTHER_BONUS%>" />
        <input type="hidden" name="employeeSelectedHidden" value="0"/>
    </form>
    <div name="employeeOtherBonusFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('employeeOtherBonusFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveEmployeeOtherBonus()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('employeeOtherBonusFormshowHelpHideDiv')</div>
</div>