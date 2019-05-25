<%@ page import="com.stepup.gasoline.qt.bean.SaleOilDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="saleOilOilTbl">
    <logic:iterate id="oil" name="<%=Constants.SALE_OIL_OIL%>">
        <tr>
            <td>
                <input type="checkbox" name="saleOilOilChk" tabindex="-1" value="<bean:write name="oil" property="id"/>">
                <input type="hidden" name="saleOilDetailId" value='0'/>
                <input type="hidden" name="oilId" value='<bean:write name="oil" property="oilId"/>'/>
            </td>
            <td><span><bean:write name="oil" property="oilName"/></span></td>
            <td>
                <html:select property="unitId" name="oil" style="width:100px">
                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td>
                <html:select property="storeId" name="oil" style="width:100px">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td><input type="text" size="20" name="quantity" id="detquantity${oil.oilId}" value="0" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="priceBeforeCommission" id="detpricebeforecommission${oil.oilId}" value="${oil.priceBeforeCommission}" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="commissionPrice" id="detcommissionprice${oil.oilId}" value="${oil.commissionPrice}" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="gapAgencyAmountDetail" id="detgapagencyamount${oil.oilId}" value="0" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="gapCustomerAmountDetail" id="detgapcustomeramount${oil.oilId}" value="0" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${oil.oilId}" value="${oil.price}" readonly="readonly" tabindex="-1"/></td>
            <td><input type="text" size="20" name="firstAmount" id="detfirstamount${oil.oilId}" value="0" readonly="readonly" tabindex="-1"/></td>
            <td><input type="text" size="20" name="commissionDetail" id="detcommission${oil.oilId}" value="0" onblur="return caculateSaleOilListDetail('${oil.oilId}', 'saleOilForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${oil.oilId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>