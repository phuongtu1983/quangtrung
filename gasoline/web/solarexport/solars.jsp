<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="solarExportSolarTbl">
    <logic:iterate id="solar" name="<%=Constants.SOLAR_EXPORT_SOLAR%>">
        <tr>
            <td>
                <input type="checkbox" name="solarExportSolarChk" tabindex="-1" value="<bean:write name="solar" property="id"/>">
                <input type="hidden" name="solarExportDetailId" value='0'/>
                <input type="hidden" name="solarId" value='<bean:write name="solar" property="solarId"/>'/>
                <input type="hidden" name="solarSaleDetailId" value='<bean:write name="solar" property="solarSaleDetailId"/>'/>
            </td>
            <td><span><bean:write name="solar" property="solarName"/></span></td>
            <td>
                <html:select property="unitId" name="solar" style="width:100px">
                    <html:options collection="<%=Constants.UNIT_LIST%>" property="id" labelProperty="name"/>
                </html:select>
            </td>
            <td><input type="text" size="20" name="quantity" id="detquantity${solar.solarId}" value="0" onblur="return caculateFormListDetail('${solar.solarId}', 'solarExportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${solar.solarId}" value="${solar.price}" onblur="return caculateFormListDetail('${solar.solarId}', 'solarExportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${solar.solarId}" value="0" readonly="readonly" tabindex="-1"/></td>
        </tr>
    </logic:iterate>
</table>