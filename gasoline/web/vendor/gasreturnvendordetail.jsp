<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="gasReturnVendorFormshowHelpHideDivContent">
    <form name="gasReturnVendorForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
                            <td colspan="3">
                                <html:select property="vendorId" name="<%=Constants.GAS_RETURN_VENDOR%>" style="width:255px">
                                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="vendorName"/>
                                </html:select>
                            </td>
                        </tr>
            </tr>
        </table>
        </td></tr>
        <tr>
            <td align="center" height="30" colspan="4">
                <p style="margin-top: 0; margin-bottom: 0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_VENDOR)) {%> 
                    <button class="i_create_write icon small green" onclick="return saveGasReturnVendor();"><bean:message key="message.save"/></button>
                    <%}%>
                    <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('gasReturnVendorFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
            </td>
        </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.GAS_RETURN_VENDOR%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="gasReturnVendorFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
</div>