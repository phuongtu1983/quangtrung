<%@ page import="com.stepup.gasoline.qt.bean.GasReturnDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasReturnDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="shell.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.GAS_RETURN_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasReturnGoodChk" tabindex="-1" value="<%=((GasReturnDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="gasReturnDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="goodId" value='<bean:write name="good" property="id"/>'/>
                </td>
                <td><span><bean:write name="good" property="shellName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.id}" onblur="return caculateFormListDetail('${good.id}','gasReturnForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${good.price}" id="detprice${good.id}" onblur="return caculateFormListDetail('${good.id}','gasReturnForm');" onkeyup="try2FloatFormatOnKeyUp(this,event);" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${good.amount}" id="detamount${good.id}" readonly="readonly"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>