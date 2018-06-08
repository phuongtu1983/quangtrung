<%@ page import="com.stepup.gasoline.qt.bean.GasRetailReturnShellDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasRetailReturnShellDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="returnShell" name="<%=Constants.GAS_RETAIL_RETURN_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasRetailReturnShellChk" tabindex="-1" value="<%=((GasRetailReturnShellDetailBean) pageContext.getAttribute("returnShell")).getId()%>">
                    <input type="hidden" name="gasRetailReturnShellDetailId" value='<bean:write name="returnShell" property="id"/>'/>
                    <input type="hidden" name="returnShellId" value='<bean:write name="returnShell" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="returnShell" property="shellName"/></span></td>
                <td><span><bean:write name="returnShell" property="unitName"/></span></td>
                <td><input type="text" size="20" name="returnShellQuantity" value="${returnShell.quantity}" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>