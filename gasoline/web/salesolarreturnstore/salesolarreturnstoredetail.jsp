<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div id="saleSolarReturnStoreFormshowHelpHideDivContent">
    <form name="saleSolarReturnStoreForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="store.title"/></td>
                            <td>
                                <html:select property="storeId" name="<%=Constants.SALE_SOLAR_RETURN_STORE%>">
                                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.SALE_SOLAR_RETURN_STORE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_SALE_SOLAR_RETURN_STORE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveSaleSolarReturnStore();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:notEqual name="<%=Constants.SALE_SOLAR_RETURN_STORE%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_SALE_SOLAR_RETURN_STORE)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveSaleSolarReturnStore();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:notEqual>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('saleSolarReturnStoreFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.SALE_SOLAR_RETURN_STORE%>" />
        <input type="hidden" id="callbackFunc"/>
    </form>
    <div name="saleSolarReturnStoreFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('saleSolarReturnStoreFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveSaleSolarReturnStore()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('saleSolarReturnStoreFormshowHelpHideDiv')</div>
</div>