<%@ page import="com.stepup.gasoline.qt.bean.SaleAccessoryDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleAccessoryDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="accessory.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.SALE_ACCESSORY_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="saleAccessoryGoodChk" tabindex="-1" value="<%=((SaleAccessoryDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="saleAccessoryDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="goodId" value='<bean:write name="good" property="accessoryId"/>'/>
                </td>
                <td><span><bean:write name="good" property="accessoryName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.accessoryId}" onblur="return caculateSaleAccessoryListDetail('${good.accessoryId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${good.price}" id="detprice${good.accessoryId}" onblur="return caculateSaleAccessoryListDetail('${good.accessoryId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${good.amount}" id="detamount${good.accessoryId}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>