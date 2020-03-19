<%@ page import="com.stepup.gasoline.qt.bean.SolarExportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="solarExportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="solar.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="150px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="solar" name="<%=Constants.SOLAR_EXPORT_SOLAR%>">
            <tr>
                <td>
                    <input type="checkbox" name="solarExportSolarChk" tabindex="-1" value="<%=((SolarExportDetailBean) pageContext.getAttribute("solar")).getId()%>">
                    <input type="hidden" name="solarExportDetailId" value='<bean:write name="solar" property="id"/>'/>
                    <input type="hidden" name="solarId" value='<bean:write name="solar" property="solarId"/>'/>
                    <input type="hidden" name="solarSaleDetailId" value='<bean:write name="solar" property="solarSaleDetailId"/>'/>
                </td>
                <td><span><bean:write name="solar" property="solarName"/></span></td>
                <td><span><bean:write name="solar" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${solar.quantity}" id="detquantity${solar.solarId}" onblur="return caculateFormListDetail('${solar.solarId}', 'solarExportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${solar.price}" id="detprice${solar.solarId}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="amount" value="${solar.amount}" id="detamount${solar.solarId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>