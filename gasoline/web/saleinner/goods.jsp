<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="saleInnerGoodTbl">
    <logic:iterate id="good" name="<%=Constants.SALE_INNER_GOOD%>">
        <tr>
            <td>
                <input type="checkbox" name="saleInnerGoodChk" tabindex="-1" value="<bean:write name="good" property="shellId"/>">
                <input type="hidden" name="saleInnerDetailId" value='0'/>
                <input type="hidden" name="goodId" value='<bean:write name="good" property="shellId"/>'/>
            </td>
            <td><span><bean:write name="good" property="shellName"/></span></td>
            <td><span><bean:write name="good" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${good.shellId}" value="0" onblur="return caculateFormListDetail('${good.shellId}','saleInnerForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${good.shellId}" value="${good.price}" onblur="return caculateFormListDetail('${good.shellId}','saleInnerForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${good.shellId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>