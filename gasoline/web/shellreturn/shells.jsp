<%@ page import="com.stepup.gasoline.qt.bean.ShellReturnDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="shellReturnShellTbl">
    <logic:iterate id="shell" name="<%=Constants.SHELL_RETURN_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="shellReturnShellChk" tabindex="-1" value="<bean:write name="shell" property="shellId"/>">
                <input type="hidden" name="shellReturnDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="shell" property="shellName"/></span></td>
            <td><span><bean:write name="shell" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" value="0" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>