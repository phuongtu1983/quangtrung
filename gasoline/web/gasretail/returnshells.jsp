<%@ page import="com.stepup.gasoline.qt.bean.GasRetailReturnShellDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasRetailReturnShellTbl">
    <logic:iterate id="returnShell" name="<%=Constants.GAS_RETAIL_RETURN_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="gasRetailReturnShellChk" tabindex="-1" value="<bean:write name="returnShell" property="shellId"/>">
                <input type="hidden" name="gasRetailReturnShellDetailId" value='0'/>
                <input type="hidden" name="returnShellId" value='<bean:write name="returnShell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="returnShell" property="shellName"/></span></td>
            <td><span><bean:write name="returnShell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="returnShellQuantity" value="0" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>