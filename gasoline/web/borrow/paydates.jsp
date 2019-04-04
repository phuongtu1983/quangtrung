<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="borrowPayDateTbl">
    <logic:iterate id="payDate" name="<%=Constants.BORROW_PAY_DATE%>">
        <tr>
            <td>
                <input type="checkbox" name="borrowPayDateChk" tabindex="-1" value="<bean:write name="payDate" property="payDateId"/>">
                <input type="hidden" name="borrowDetailId" value='0'/>
            </td>
            <td><span><bean:write name="payDate" property="payDate"/></span></td>
            <td><input type="text" size="20" name="amount" value="0" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>