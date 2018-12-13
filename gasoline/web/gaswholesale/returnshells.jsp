<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasWholesaleReturnShellTbl">
    <logic:iterate id="returnShell" name="<%=Constants.GAS_WHOLESALE_RETURN_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="gasWholesaleReturnShellChk" tabindex="-1" value="<bean:write name="returnShell" property="shellId"/>">
                <input type="hidden" name="gasWholesaleReturnShellDetailId" value='0'/>
                <input type="hidden" name="returnShellId" value='<bean:write name="returnShell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="returnShell" property="shellName"/></span></td>
            <td><span><bean:write name="returnShell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="returnShellQuantity" value="0" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>