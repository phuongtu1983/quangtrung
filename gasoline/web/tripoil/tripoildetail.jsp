<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="tripOilFormshowHelpHideDivContent">
    <form name="tripOilForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.TRIP_OIL%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="tripOilDate" size="30" name="<%=Constants.TRIP_OIL%>" tabindex="-1"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="employee.title"/></td>
                            <td>
                                <select style="width: 200px;" name="employeeIdCombobox" id="employeeIdCombobox">
                                    <logic:iterate id="employee_iter" name="<%=Constants.EMPLOYEE_LIST%>">
                                        <option  value="${employee_iter.id}">${employee_iter.fullname}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="tripOil.detail.vehicle"/></td>
                            <td>
                                <html:select property="vehicleId" name="<%=Constants.TRIP_OIL%>" style="width:195px" tabindex="-1">
                                    <html:options collection="<%=Constants.VEHICLE_LIST%>" property="id" labelProperty="plate"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="quantity.title"/></td>
                            <td><html:text property="quantity" size="30" name="<%=Constants.TRIP_OIL%>" onblur="return formCaculateAmount('tripOilForm');" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="price.title"/></td>
                            <td><html:text property="price" size="30" name="<%=Constants.TRIP_OIL%>" onblur="return formCaculateAmount('tripOilForm');" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="amount.title"/></td>
                            <td><html:text property="amount" size="30" name="<%=Constants.TRIP_OIL%>" readonly="true" tabindex="-1"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="note.title"/></td>
                            <td><html:text property="note" size="30" name="<%=Constants.TRIP_OIL%>"/></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.TRIP_OIL%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_TRIP_OIL)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveTripOil();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.TRIP_OIL%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_TRIP_OIL)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveTripOil();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <logic:greaterThan name="<%=Constants.TRIP_OIL%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_TRIP_OIL)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delTripOil();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('tripOilFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.TRIP_OIL%>" />
        <input type="hidden" id="callbackFunc"/>
        <html:hidden property="employeeId" name="<%=Constants.TRIP_OIL%>" />
        <input type="hidden" name="employeeSelectedHidden" value="0"/>
    </form>
    <div name="tripOilFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('tripOilFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveTripOil()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('tripOilFormshowHelpHideDiv')</div>
</div>