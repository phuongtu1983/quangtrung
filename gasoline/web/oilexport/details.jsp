<%@ page import="com.stepup.gasoline.qt.bean.OilExportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="oilExportDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="270px"><bean:message key="oil.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="150px"><bean:message key="quantity.title"/></td>
            <td width="200px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="oil" name="<%=Constants.OIL_EXPORT_OIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="oilExportOilChk" tabindex="-1" value="<%=((OilExportDetailBean) pageContext.getAttribute("oil")).getId()%>">
                    <input type="hidden" name="oilExportDetailId" value='<bean:write name="oil" property="id"/>'/>
                    <input type="hidden" name="oilId" value='<bean:write name="oil" property="oilId"/>'/>
                    <input type="hidden" name="oilSaleDetailId" value='<bean:write name="oil" property="oilSaleDetailId"/>'/>
                </td>
                <td><span><bean:write name="oil" property="oilName"/></span></td>
                <td><span><bean:write name="oil" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${oil.quantity}" id="detquantity${oil.oilId}" onblur="return caculateFormListDetail('${oil.oilId}', 'oilExportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${oil.price}" id="detprice${oil.oilId}" readonly="readonly" tabindex="-1"/></td>
                <td><input type="text" size="20" name="amount" value="${oil.amount}" id="detamount${oil.oilId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>