<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="invoiceSolarPaidAmountTbl">
    <logic:iterate id="paid" name="<%=Constants.INVOICE_SOLAR_PAID_DETAIL%>">
        <tr>
            <td>
                <input type="checkbox" name="invoiceSolarPaidDetailChk" tabindex="-1" value="0">
                <input type="hidden" name="invoiceSolarPaidDetailId" value='0'/>
            </td>
            <td><input type="text" size="20" name="paidDate" value="${paid.paidDate}" readonly="true"/></span></td>
            <td><input type="text" size="20" name="paidAmount" value="0" onblur="invoiceSolarPaidAmountChanged(this);" onkeypress="return readonlyFloat(event);"/></td>
        </tr>
    </logic:iterate>
</table>