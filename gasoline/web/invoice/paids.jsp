<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="invoicePaidAmountTbl">
    <logic:iterate id="paid" name="<%=Constants.INVOICE_PAID_DETAIL%>">
        <tr>
            <td>
                <input type="checkbox" name="invoicePaidDetailChk" tabindex="-1" value="0">
                <input type="hidden" name="invoicePaidDetailId" value='0'/>
            </td>
            <td><input type="text" size="20" name="paidDate" value="${paid.paidDate}" readonly="true"/></span></td>
            <td><input type="text" size="20" name="paidAmount" value="0" onblur="invoicePaidAmountChanged(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>