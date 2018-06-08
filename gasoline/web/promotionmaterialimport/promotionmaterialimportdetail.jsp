<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="promotionMaterialImport.detail.add.title"/></div>
<form name="promotionMaterialImportForm">
    <table style="width: 100%">
        <tr>
            <td width="160" height="30"><bean:message key="code.title"/></td>
            <td width="160"><html:text property="code" size="30" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" readonly="true"/></td>
            <td width="170"  style="padding-right: 20px;padding-left: 10px"><bean:message key="date.title"/></td>
            <td><html:text property="createdDate" size="30" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" styleId="promotionMaterialImportCreatedDate" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
            <td>
                <html:select property="vendorId" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.VENDOR_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="total.title"/></td>
            <td><html:text property="total" size="30" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="paid.title"/></td>
            <td><html:text property="paid" size="30" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" onblur="return formPaidChanged('promotionMaterialImportForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td style="padding-right: 20px;padding-left: 10px"><bean:message key="debt.title"/></td>
            <td><html:text property="debt" size="30" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" readonly="true"/></td>
        </tr>
        <tr>
            <td height="30" style="padding-right: 20px"><bean:message key="account.title"/></td>
            <td colspan="3">
                <html:select property="accountId" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" style="width:195px">
                    <html:options collection="<%=Constants.ACCOUNT_LIST%>" property="id" labelProperty="number"/>
                </html:select>
            </td>
        </tr>
        <tr>
            <td height="30"><bean:message key="note.title"/></td>
            <td colspan="3"><html:textarea rows="3" cols="93" property="note" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <fieldset>
                    <legend><bean:message key="detail.title"/></legend>
                    <table>
                        <tr>
                            <td>
                                <logic:equal name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="id" value="0">
                                    <button class="i_cross icon small red" onclick="return delTableRow('promotionMaterialImportForm', 'promotionMaterialImportPromotionMaterialChk', 'promotionMaterialImportDetailTbl');"><bean:message key="message.del"/></button>
                                </logic:equal>
                                <button class="i_plus icon small green" onclick="return addPromotionMaterialImportPromotionMaterial();"><bean:message key="message.add"/></button>
                            </td>
                            <td>
                                <select style="width: 260px;" name="promotionMaterialIdCombobox" id="promotionMaterialIdCombobox">
                                    <logic:iterate id="promotionMaterial_iter" name="<%=Constants.PROMOTION_MATERIAL_LIST%>">
                                        <option  value="${promotionMaterial_iter.id}">${promotionMaterial_iter.name}</option>
                                    </logic:iterate>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div><%@include  file="/promotionmaterialimport/details.jsp" %></div></td>
        </tr>
        <tr>
            <td colspan="4" align="center" height="50">
                <logic:equal name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {%> 
                    <button class="i_create_write icon small green" onclick="return savePromotionMaterialImport();"><bean:message key="message.save"/></button>
                    <%}%>
                </logic:equal>
                <logic:notEqual name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_EDIT, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {%> 
                    <logic:equal name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="canEdit" value="1">
                        <button class="i_create_write icon small green" onclick="return savePromotionMaterialImport();"><bean:message key="message.save"/></button>
                    </logic:equal>
                    <%}%>
                </logic:notEqual>
                <logic:greaterThan name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="id" value="0">
                    <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_DELETE, PermissionUtil.PER_PROMOTION_MATERIAL_IMPORT)) {%> 
                    <logic:equal name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" property="canEdit" value="1">
                        <button class="i_trashcan icon small red" onclick="return delPromotionMaterialImport();"><bean:message key="message.del"/></button>
                    </logic:equal>
                    <%}%>
                </logic:greaterThan>
                <button class="i_access_denied icon small yellow" onclick="return loadPromotionMaterialImportPanel();"><bean:message key="message.close"/></button>
            </td>
        </tr>
    </table>
    <html:hidden property="id" name="<%=Constants.PROMOTION_MATERIAL_IMPORT%>" />
    <input type="hidden" id="callbackFunc"/>
    <input type="hidden" name="foodSelectedHidden" value="0"/>
</form>
<div name="promotionMaterialImportFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
    Ctrl+C : Đóng
    Ctrl+S : Lưu
</div>
<div id="shiftCFunctionHideDiv" style="display:none">loadPromotionMaterialImportPanel()</div>
<div id="shiftSFunctionHideDiv" style="display:none">savePromotionMaterialImport()</div>
<div id="promotionMaterialImportPromotionMaterialHideDiv" style="display:none"></div>