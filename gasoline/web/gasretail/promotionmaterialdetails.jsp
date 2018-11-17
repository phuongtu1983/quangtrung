<%@ page import="com.stepup.gasoline.qt.bean.GasRetailPromotionMaterialDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasRetailPromotionMaterialDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="promotionMaterial.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="promotionMaterial" name="<%=Constants.GAS_RETAIL_PROMOTION_MATERIAL%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasRetailPromotionMaterialChk" tabindex="-1" value="<%=((GasRetailPromotionMaterialDetailBean) pageContext.getAttribute("promotionMaterial")).getId()%>">
                    <input type="hidden" name="gasRetailPromotionMaterialDetailId" value='<bean:write name="promotionMaterial" property="id"/>'/>
                    <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
                </td>
                <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
                <td><span><bean:write name="promotionMaterial" property="unitName"/></span></td>
                <td><input type="text" size="20" name="promotionMaterialQuantity" value="${promotionMaterial.quantity}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>