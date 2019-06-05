<%@ page import="com.stepup.gasoline.qt.bean.DiscountCommissionDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="discountCommissionDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="100px"><bean:message key="customerDiscount.commission.from"/></td>
            <td width="110px"><bean:message key="customerDiscount.commission.to"/></td>
            <td width="110px"><bean:message key="customerDiscount.commission"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="commission" name="<%=Constants.DISCOUNT_COMMISSION%>">
            <tr>
                <td>
                    <input type="checkbox" name="discountCommissionChk" tabindex="-1" value="<%=((DiscountCommissionDetailBean) pageContext.getAttribute("commission")).getId()%>">
                    <input type="hidden" name="discountCommissionDetailId" value='<bean:write name="commission" property="id"/>'/>
                </td>
                <td><input type="text" size="20" name="discountCommissionFrom" value="${commission.from}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="discountCommissionTo" value="${commission.to}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="discountCommissionCommission" value="${commission.commission}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>