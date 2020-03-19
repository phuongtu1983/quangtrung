<%@ page import="com.stepup.gasoline.qt.bean.SolarImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="solarImportDetailTbl" class="its"  style="width:100%">
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
        <logic:iterate id="solar" name="<%=Constants.SOLAR_IMPORT_SOLAR%>">
            <tr>
                <td>
                    <input type="checkbox" name="solarImportSolarChk" tabindex="-1" value="<%=((SolarImportDetailBean) pageContext.getAttribute("solar")).getId()%>">
                    <input type="hidden" name="solarImportDetailId" value='<bean:write name="solar" property="id"/>'/>
                    <input type="hidden" name="solarId" value='<bean:write name="solar" property="solarId"/>'/>
                </td>
                <td><span><bean:write name="solar" property="solarName"/></span></td>
                <td><span><bean:write name="solar" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${solar.quantity}" id="detquantity${solar.no}_${solar.solarId}" onblur="return caculateFormListDetail('${solar.no}_${solar.solarId}', 'solarImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${solar.price}" id="detprice${solar.no}_${solar.solarId}" onblur="return caculateFormListDetail('${solar.no}_${solar.solarId}', 'solarImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${solar.amount}" id="detamount${solar.no}_${solar.solarId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>