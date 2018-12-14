<%@ page import="com.stepup.gasoline.qt.bean.SalePetroDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="salePetroDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="petro.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.SALE_PETRO_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="salePetroGoodChk" tabindex="-1" value="<%=((SalePetroDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="salePetroDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="goodId" value='<bean:write name="good" property="petroId"/>'/>
                </td>
                <td><span><bean:write name="good" property="petroName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.petroId}" onblur="return caculateFormListDetail('${good.petroId}','salePetroForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${good.price}" id="detprice${good.petroId}" onblur="return caculateFormListDetail('${good.petroId}','salePetroForm');" onkeypress="return readonlyFloat(event);" tabindex="-1"/></td>
                <td><input type="text" size="20" name="amount" value="${good.amount}" id="detamount${good.petroId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>