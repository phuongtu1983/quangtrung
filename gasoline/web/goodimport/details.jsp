<%@ page import="com.stepup.gasoline.qt.bean.GoodImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="goodImportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="good.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="150px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="good" name="<%=Constants.GOOD_IMPORT_GOOD%>">
            <tr>
                <td>
                    <input type="checkbox" name="goodImportGoodChk" tabindex="-1" value="<%=((GoodImportDetailBean) pageContext.getAttribute("good")).getId()%>">
                    <input type="hidden" name="goodImportDetailId" value='<bean:write name="good" property="id"/>'/>
                    <input type="hidden" name="goodId" value='<bean:write name="good" property="goodId"/>'/>
                </td>
                <td><span><bean:write name="good" property="goodName"/></span></td>
                <td><span><bean:write name="good" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${good.quantity}" id="detquantity${good.goodId}" onblur="return caculateFormListDetail('${good.goodId}','goodImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${good.price}" id="detprice${good.goodId}" onblur="return caculateFormListDetail('${good.goodId}','goodImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${good.amount}" id="detamount${good.goodId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>