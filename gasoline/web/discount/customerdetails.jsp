<%@ page import="com.stepup.gasoline.qt.bean.DiscountCustomerDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="discountCustomerDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="300px"><bean:message key="customer.detail.name"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="customer" name="<%=Constants.DISCOUNT_COMMISSION_CUSTOMER%>">
            <tr>
                <td>
                    <input type="checkbox" name="discountCustomerChk" tabindex="-1" value="<%=((DiscountCustomerDetailBean) pageContext.getAttribute("customer")).getId()%>">
                    <input type="hidden" name="discountCustomerDetailId" value='<bean:write name="customer" property="id"/>'/>
                    <input type="hidden" name="customerId" value='<bean:write name="customer" property="customerId"/>'/>
                </td>
                <td><span><bean:write name="customer" property="customerName"/></span></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>