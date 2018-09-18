<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<%@page import="com.stepup.gasoline.qt.attachmentfile.UploadFileUtil"%>
<div id="contractFormshowHelpHideDivContent">
    <div class="header"><bean:message key="contract.header.add.title"/></div>
    <form name="contractForm">
        <table width="100%" cellspacing="0" cellpadding="0" >
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="code.title"/></td>
                            <td><html:text property="code" size="30" name="<%=Constants.CONTRACT%>" readonly="true"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
                            <td><html:text property="createdDate" styleId="contractDate" size="30" name="<%=Constants.CONTRACT%>" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
                            <td colspan="3">
                                <html:select property="customerId" name="<%=Constants.CONTRACT%>" style="width:195px">
                                    <html:options collection="<%=Constants.CUSTOMER_LIST%>" property="id" labelProperty="name"/>
                                </html:select>
                            </td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="contract.detail.shell12"/></td>
                            <td><html:text property="shell12Price" size="30" name="<%=Constants.CONTRACT%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="contract.detail.shell45"/></td>
                            <td><html:text property="shell45Price" size="30" name="<%=Constants.CONTRACT%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="contract.detail.creditDate"/></td>
                            <td><html:text property="creditDate" size="30" name="<%=Constants.CONTRACT%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="contract.detail.creditAmount"/></td>
                            <td><html:text property="creditAmount" size="30" name="<%=Constants.CONTRACT%>" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                        </tr>
                        <tr>
                            <td height="30" style="padding-right: 20px"><bean:message key="note.title"/></td>
                            <td colspan="3"><html:text property="note" size="88" name="<%=Constants.CONTRACT%>" /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <logic:greaterThan name="<%=Constants.CONTRACT%>" property="id" value="0">
                                    <fieldset>
                                        <legend><bean:message key="attchmentfile.list.title"/></legend>
                                        <%@include file="/attchmentfile/attchmentfilepanel.jsp"%>
                                    </fieldset>
                                </logic:greaterThan>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <logic:equal name="<%=Constants.CONTRACT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_CONTRACT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveContract();"><bean:message key="message.save"/></button>
                            <%}%>
                        </logic:equal>
                        <logic:greaterThan name="<%=Constants.CONTRACT%>" property="id" value="0">
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_CONTRACT)) {%> 
                            <button class="i_create_write icon small green" onclick="return saveContract();"><bean:message key="message.save"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_PRINT, PermissionUtil.PER_CONTRACT)) {%> 
                            <button class="i_create_write icon small green" onclick="return printContract(1);"><bean:message key="contract.print.template1"/></button>
                            <button class="i_create_write icon small green" onclick="return printContract(2);"><bean:message key="contract.print.template2"/></button>
                            <%}%>
                            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_CONTRACT)) {%> 
                            <button class="i_trashcan icon small red" onclick="return delContract();"><bean:message key="message.del"/></button>
                            <%}%>
                        </logic:greaterThan>
                        <button class="i_access_denied icon small yellow" onclick="return loadContractPanel();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table> 
        <html:hidden property="id" name="<%=Constants.CONTRACT%>" />
        <input type="hidden" id="callbackFunc"/>
        <input type="hidden" id="attchmentFileType" value="<%=UploadFileUtil.ATTACH_FILE_CONTRACT%>"/>
        <input type="hidden" id="attchmentFileParentId" value="<bean:write name="<%=Constants.CONTRACT%>" property="id"/>"/>
    </form>
    <div name="contractFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('contractFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">saveContract()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('contractFormshowHelpHideDiv')</div>
</div>