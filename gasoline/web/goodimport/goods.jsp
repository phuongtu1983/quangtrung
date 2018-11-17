<%@ page import="com.stepup.gasoline.qt.bean.GoodImportDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="goodImportGoodTbl">
    <logic:iterate id="good" name="<%=Constants.GOOD_IMPORT_GOOD%>">
        <tr>
            <td>
                <input type="checkbox" name="goodImportGoodChk" tabindex="-1" value="<bean:write name="good" property="goodId"/>">
                <input type="hidden" name="goodImportDetailId" value='0'/>
                <input type="hidden" name="goodId" value='<bean:write name="good" property="goodId"/>'/>
            </td>
            <td><span><bean:write name="good" property="goodName"/></span></td>
            <td><span><bean:write name="good" property="unitName"/></span></td>
            <td><input type="text" size="20" name="quantity" id="detquantity${good.goodId}" value="0" onblur="return caculateFormListDetail('${good.goodId}','goodImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="price" id="detprice${good.goodId}" value="0" onblur="return caculateFormListDetail('${good.goodId}','goodImportForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="20" name="amount" id="detamount${good.goodId}" value="0" readonly="readonly"/></td>
        </tr>
    </logic:iterate>
</table>