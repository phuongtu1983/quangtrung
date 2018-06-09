<%@ page import="com.stepup.gasoline.qt.bean.SalePetroDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="salePetroGoodTbl">
    <logic:iterate id="good" name="<%=Constants.SALE_PETRO_GOOD%>">
        <tr>
            <td>
                <input type="checkbox" name="salePetroGoodChk" tabindex="-1" value="<bean:write name="good" property="id"/>">
                <input type="hidden" name="salePetroDetailId" value='0'/>
                <input type="hidden" name="goodId" value='<bean:write name="good" property="id"/>'/>
            </td>
            <td><span><bean:write name="good" property="name"/></span></td>
            <td><span><bean:write name="good" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${good.id}" value="0" onblur="return caculateFormListDetail('${good.id}','salePetroForm');" onkeyup="try2FloatFormatOnKeyUp(this, event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${good.id}" value="${good.price}" onblur="return caculateFormListDetail('${good.id}','salePetroForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${good.id}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>