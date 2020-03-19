<%@ page import="com.stepup.gasoline.qt.bean.SaleSolarReturnDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleSolarReturnDetailTbl" class="its" style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td><bean:message key="solar.title"/></td>
            <td width="80px"><bean:message key="unit.title"/></td>
            <td width="150px"><bean:message key="store.title"/></td>
            <td width="60px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="80px"><bean:message key="saleSolar.detail.list.commissionPrice"/></td>
            <td width="100px"><bean:message key="saleSolar.detail.list.gapAgencyAmount"/></td>
            <td width="100px"><bean:message key="saleSolar.detail.list.gapCustomerAmount"/></td>
            <td width="100px"><bean:message key="saleSolar.detail.list.price"/></td>
            <td width="100px"><bean:message key="amount.title"/></td>
            <td width="80px"><bean:message key="saleSolar.detail.list.commission"/></td>
            <td width="100px"><bean:message key="amount.title"/></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="solar" name="<%=Constants.SALE_SOLAR_RETURN_SOLAR%>">
            <tr>
                <td>
                    <input type="checkbox" name="saleSolarReturnSolarChk" tabindex="-1" value="<%=((SaleSolarReturnDetailBean) pageContext.getAttribute("solar")).getId()%>">
                    <input type="hidden" name="saleSolarReturnDetailId" value='<bean:write name="solar" property="id"/>'/>
                    <input type="hidden" name="saleSolarDetailId" value='<bean:write name="solar" property="saleSolarDetailId"/>'/>
                    <input type="hidden" name="solarId" value='<bean:write name="solar" property="solarId"/>'/>
                </td>
                <td><span><bean:write name="solar" property="solarName"/></span></td>
                <td><span><bean:write name="solar" property="unitName"/></span></td>
                <td><span><bean:write name="solar" property="storeName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${solar.quantity}" id="detquantity${solar.solarId}" onblur="return caculateSaleSolarListDetail('${solar.solarId}', 'saleSolarReturnForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="priceBeforeCommission" id="detpricebeforecommission${solar.solarId}" value="${solar.priceBeforeCommission}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="commissionPrice" id="detcommissionprice${solar.solarId}" value="${solar.commissionPrice}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="gapAgencyAmountDetail" id="detgapagencyamount${solar.solarId}" value="${solar.gapAgencyAmount}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="gapCustomerAmountDetail" id="detgapcustomeramount${solar.solarId}" value="${solar.gapCustomerAmount}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="price" id="detprice${solar.solarId}" value="${solar.price}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="firstAmount" id="detfirstamount${solar.solarId}" value="${solar.firstAmount}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="commissionDetail" id="detcommission${solar.solarId}" value="${solar.commission}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="amount" value="${solar.amount}" id="detamount${solar.solarId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>