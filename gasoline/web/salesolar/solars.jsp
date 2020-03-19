<%@ page import="com.stepup.gasoline.qt.bean.SaleSolarDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="saleSolarSolarTbl">
    <logic:iterate id="solar" name="<%=Constants.SALE_SOLAR_SOLAR%>">
        <tr>
            <td>
                <input type="checkbox" name="saleSolarSolarChk" tabindex="-1" value="<bean:write name="solar" property="id"/>">
                <input type="hidden" name="saleSolarDetailId" value='0'/>
                <input type="hidden" name="solarId" value='<bean:write name="solar" property="solarId"/>'/>
            </td>
            <td><span><bean:write name="solar" property="solarName"/></span></td>
            <td>
                <html:select property="unitId" name="solar" style="width:100px">
                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td>
                <html:select property="storeId" name="solar" style="width:100px">
                    <html:options collection="<%=Constants.STORE_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td><input type="text" size="20" name="quantity" id="detquantity${solar.no}_${solar.solarId}" value="0" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="priceBeforeCommission" id="detpricebeforecommission${solar.no}_${solar.solarId}" value="${solar.priceBeforeCommission}" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="commissionPrice" id="detcommissionprice${solar.no}_${solar.solarId}" value="${solar.commissionPrice}" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="gapAgencyAmountDetail" id="detgapagencyamount${solar.no}_${solar.solarId}" value="0" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="gapCustomerAmountDetail" id="detgapcustomeramount${solar.no}_${solar.solarId}" value="0" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${solar.no}_${solar.solarId}" value="${solar.price}" readonly="readonly" tabindex="-1"/></td>
            <td><input type="text" size="20" name="firstAmount" id="detfirstamount${solar.no}_${solar.solarId}" value="0" readonly="readonly" tabindex="-1"/></td>
            <td><input type="text" size="20" name="commissionDetail" id="detcommission${solar.no}_${solar.solarId}" value="0" onblur="return caculateSaleSolarListDetail('${solar.no}_${solar.solarId}', 'saleSolarForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${solar.no}_${solar.solarId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>