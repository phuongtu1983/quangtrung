<%@ page import="com.stepup.gasoline.qt.bean.ExportWholesaleReturnShellDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="exportWholesaleReturnShellDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shell" name="<%=Constants.EXPORT_WHOLESALE_RETURN%>">
            <tr>
                <td>
                    <input type="checkbox" name="exportWholesaleReturnShellChk" tabindex="-1" value="<%=((ExportWholesaleReturnShellDetailBean) pageContext.getAttribute("shell")).getId()%>">
                    <input type="hidden" name="exportWholesaleReturnShellDetailId" value='<bean:write name="shell" property="id"/>'/>
                    <input type="hidden" name="returnShellId" value='<bean:write name="shell" property="id"/>'/>
                </td>
                <td><span><bean:write name="shell" property="shellName"/></span></td>
                <td><span><bean:write name="shell" property="unitName"/></span></td>
                <td><input type="text" size="20" name="returnShellQuantity" value="${shell.quantity}" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>