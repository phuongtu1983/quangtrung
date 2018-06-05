<%@ page import="com.stepup.gasoline.qt.bean.GasImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasImportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.detail.name"/></td>
            <td width="170px"><bean:message key="unit.title"/></td>
            <td width="200px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shell" name="<%=Constants.GAS_IMPORT_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasImportShellChk" tabindex="-1" value="<%=((GasImportDetailBean) pageContext.getAttribute("shell")).getId()%>">
                    <input type="hidden" name="gasImportDetailId" value='<bean:write name="shell" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="shell" property="shellName"/></span></td>
                <td><span><bean:write name="shell" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${shell.quantity}" id="detquantity${shell.shellId}" onblur="return caculateFormListDetail('${shell.shellId}','gasImportForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${shell.price}" id="detprice${shell.shellId}" onblur="return caculateFormListDetail('${shell.shellId}','gasImportForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${shell.amount}" id="detamount${shell.shellId}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>