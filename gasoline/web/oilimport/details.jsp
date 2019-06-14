<%@ page import="com.stepup.gasoline.qt.bean.OilImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table id="oilImportDetailTbl" class="its"  style="width:100%">
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
        <logic:iterate id="oil" name="<%=Constants.OIL_IMPORT_OIL%>">
            <tr>
                <td>
                    <input type="checkbox" name="oilImportOilChk" tabindex="-1" value="<%=((OilImportDetailBean) pageContext.getAttribute("oil")).getId()%>">
                    <input type="hidden" name="oilImportDetailId" value='<bean:write name="oil" property="id"/>'/>
                    <input type="hidden" name="oilId" value='<bean:write name="oil" property="oilId"/>'/>
                </td>
                <td><span><bean:write name="oil" property="oilName"/></span></td>
                <td><span><bean:write name="oil" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${oil.quantity}" id="detquantity${oil.no}_${oil.oilId}" onblur="return caculateFormListDetail('${oil.no}_${oil.oilId}', 'oilImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${oil.price}" id="detprice${oil.no}_${oil.oilId}" onblur="return caculateFormListDetail('${oil.no}_${oil.oilId}', 'oilImportForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${oil.amount}" id="detamount${oil.no}_${oil.oilId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>