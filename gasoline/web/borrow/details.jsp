<%@ page import="com.stepup.gasoline.qt.bean.BorrowDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="borrowDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="borrow.detail.payDate"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="payDate" name="<%=Constants.BORROW_PAY_DATE%>">
            <tr>
                <td>
                    <input type="checkbox" name="borrowPayDateChk" tabindex="-1" value="<%=((BorrowDetailBean) pageContext.getAttribute("payDate")).getId()%>">
                    <input type="hidden" name="borrowDetailId" value='<bean:write name="payDate" property="id"/>'/>
                </td>
                <td><input type="text" name="payDate" size="20" tabindex="-1" value="${payDate.payDate}" readonly="readonly"></td>
                <td><input type="text" size="20" name="amount" value="${payDate.amount}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>