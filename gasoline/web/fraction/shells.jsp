<%@ page import="com.stepup.gasoline.qt.bean.FractionDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="fractionShellTbl">
    <logic:iterate id="shell" name="<%=Constants.FRACTION_SHELL%>">
        <tr>
            <td>
                <input type="checkbox" name="fractionShellChk" tabindex="-1" value="<bean:write name="shell" property="shellId"/>">
                <input type="hidden" name="fractionDetailId" value='0'/>
                <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="shell" property="shellName"/></span></td>
            <td><input type="text" size="20" name="quantity" value="0"onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>