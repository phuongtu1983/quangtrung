<%@ page import="com.stepup.gasoline.qt.bean.SaleOilDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleOilDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="oil.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="oil" name="<%=Constants.SALE_OIL_OIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="saleOilOilChk" tabindex="-1" value="<%=((SaleOilDetailBean) pageContext.getAttribute("oil")).getId()%>">
                    <input type="hidden" name="saleOilDetailId" value='<bean:write name="oil" property="id"/>'/>
                    <input type="hidden" name="oilId" value='<bean:write name="oil" property="oilId"/>'/>
                </td>
                <td><span><bean:write name="oil" property="oilName"/></span></td>
                <td><span><bean:write name="oil" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${oil.quantity}" id="detquantity${oil.oilId}" onblur="return caculateFormListDetail('${oil.oilId}','saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${oil.price}" id="detprice${oil.oilId}" onblur="return caculateFormListDetail('${oil.oilId}','saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${oil.amount}" id="detamount${oil.oilId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>