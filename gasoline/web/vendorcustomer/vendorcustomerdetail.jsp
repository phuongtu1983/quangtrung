<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="vendorCustomerFormshowHelpHideDivContent">
    <form name="vendorCustomerForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td colspan="3">
                                <html:select property="vendorId" name="<%=Constants.VENDOR_CUSTOMER%>" style="width:350px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
                            <td colspan="3">
                                <select style="width: 350px;" name="customerIdCombobox" id="customerIdCombobox">
                                    <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                                        <option  value="${customer_iter.id}">${customer_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>

                    </table>
                </td></tr>
            <tr>
                <td align="center" height="30" colspan="4">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.VENDOR_CUSTOMER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVendorCustomer();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.VENDOR_CUSTOMER%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_VENDOR)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveVendorCustomer();"><bean:message key="message.save"/></button>
                            <button class="i_trashcan icon small red" onclick="return delVendorCustomer();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('vendorCustomerFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.VENDOR_CUSTOMER%>" />
        <html:hidden property="customerId" name="<%=Constants.VENDOR_CUSTOMER%>" />
        <input type="hidden" id="callbackFunc"/>
        <input type="hidden" name="customerSelectedHidden" value="0"/>
    </form>
    <div name="vendorCustomerFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('vendorCustomerFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveVendorCustomer()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('vendorCustomerFormshowHelpHideDiv')</div>
</div>