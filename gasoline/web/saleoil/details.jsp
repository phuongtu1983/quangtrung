<%@ page import="com.stepup.gasoline.qt.bean.SaleOilDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleOilDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td><bean:message key="oil.title"/></td>
            <td width="80px"><bean:message key="unit.title"/></td>
            <td width="80px"><bean:message key="store.title"/></td>
            <td width="60px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="80px"><bean:message key="saleOil.detail.list.commissionPrice"/></td>
            <td width="100px"><bean:message key="saleOil.detail.list.gapAgencyAmount"/></td>
            <td width="100px"><bean:message key="saleOil.detail.list.gapCustomerAmount"/></td>
            <td width="100px"><bean:message key="saleOil.detail.list.price"/></td>
            <td width="100px"><bean:message key="amount.title"/></td>
            <td width="80px"><bean:message key="saleOil.detail.list.commission"/></td>
            <td width="100px"><bean:message key="amount.title"/></td>
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
                <td><span><bean:write name="oil" property="storeName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${oil.quantity}" id="detquantity${oil.oilId}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="priceBeforeCommission" id="detpricebeforecommission${oil.oilId}" value="${oil.priceBeforeCommission}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="commissionPrice" id="detcommissionprice${oil.oilId}" value="${oil.commissionPrice}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="gapAgencyAmountDetail" id="detgapagencyamount${oil.oilId}" value="${oil.gapAgencyAmount}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="gapCustomerAmountDetail" id="detgapcustomeramount${oil.oilId}" value="${oil.gapCustomerAmount}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" id="detprice${oil.oilId}" value="${oil.price}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="firstAmount" id="detfirstamount${oil.oilId}" value="${oil.firstAmount}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="commissionDetail" id="detcommission${oil.oilId}" value="${oil.commission}" onblur="return caculateSaleOilListDetail('${oil.oilId}');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${oil.amount}" id="detamount${oil.oilId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>