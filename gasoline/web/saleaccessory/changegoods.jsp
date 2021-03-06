<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="saleAccessoryChangeGoodTbl">
    <logic:iterate id="good" name="<%=Constants.SALE_ACCESSORY_CHANGE_GOOD%>">
        <tr>
            <td>
                <input type="checkbox" name="saleAccessoryChangeGoodChk" tabindex="-1" value="<bean:write name="good" property="id"/>">
                <input type="hidden" name="saleAccessoryChangeGoodDetailId" value='0'/>
                <input type="hidden" name="changeGoodId" value='<bean:write name="good" property="id"/>'/>
            </td>
            <td><span><bean:write name="good" property="name"/></span></td>
            <td><span><bean:write name="good" property="unitName"/></span></td>
            <td><input type="text" size="20" name="changeGoodQuantity" value="0" id="detchangegoodquantity${good.id}" onblur="return caculateSaleAccessoryChangeListDetail('${good.id}');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="changeGoodPrice" value="0" id="detchangegoodprice${good.id}" onblur="return caculateSaleAccessoryChangeListDetail('${good.id}');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="changeGoodAmount" value="0" id="detchangegoodamount${good.id}" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>