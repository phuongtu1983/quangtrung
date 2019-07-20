<%@ page import="com.stepup.gasoline.qt.bean.InvoicePaidDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="invoicePaidDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="200px"><bean:message key="date.title"/></td>
            <td width="200px"><bean:message key="invoice.detail.paidAmount"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="paid" name="<%=Constants.INVOICE_PAID_DETAIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="invoicePaidDetailChk" tabindex="-1" value="<%=((InvoicePaidDetailBean) pageContext.getAttribute("paid")).getId()%>">
                    <input type="hidden" name="invoicePaidDetailId" value='<bean:write name="paid" property="id"/>'/>
                </td>
                <td><input type="text" size="20" name="paidDate" value="${paid.paidDate}" readonly="true"/></span></td>
                <td><input type="text" size="20" name="paidAmount" value="${paid.amount}" onblur="invoicePaidAmountChanged(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>