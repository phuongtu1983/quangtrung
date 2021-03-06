<%@ page import="com.stepup.gasoline.qt.bean.SaleAccessoryChangeDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleAccessoryChangeGoodDetailTbl" class="its"  style="width:100%">
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
        <logic:iterate id="good" name="<%=Constants.SALE_ACCESSORY_CHANGE_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="saleAccessoryChangeGoodChk" tabindex="-1" value="<%=((SaleAccessoryChangeDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="saleAccessoryChangeGoodDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="changeGoodId" value='<bean:write name="good" property="accessoryId"/>'/>
                </td>
                <td><span><bean:write name="good" property="accessoryName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="changeGoodQuantity" value="${good.quantity}" id="detchangegoodquantity${good.accessoryId}" onblur="return caculateSaleAccessoryChangeListDetail('${good.accessoryId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="changeGoodPrice" value="${good.price}" id="detchangegoodprice${good.accessoryId}" onblur="return caculateSaleAccessoryChangeListDetail('${good.accessoryId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="changeGoodAmount" value="${good.amount}" id="detchangegoodamount${good.accessoryId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>