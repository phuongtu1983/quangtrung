<%@ page import="com.stepup.gasoline.qt.bean.SaleSolarPromotionMaterialDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="saleSolarPromotionMaterialDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td><bean:message key="promotionMaterial.detail.name"/></td>
            <td width="80px"><bean:message key="unit.title"/></td>
            <td width="150px"><bean:message key="store.title"/></td>
            <td width="60px"><bean:message key="quantity.title"/></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="promotionMaterial" name="<%=Constants.SALE_SOLAR_PROMOTION_MATERIAL%>">
            <tr>
                <td>
                    <input type="checkbox" name="saleSolarPromotionMaterialChk" tabindex="-1" value="<%=((SaleSolarPromotionMaterialDetailBean) pageContext.getAttribute("promotionMaterial")).getId()%>">
                    <input type="hidden" name="saleSolarPromotionMaterialDetailId" value='<bean:write name="promotionMaterial" property="id"/>'/>
                    <input type="hidden" name="promotionMaterialId" value='<bean:write name="promotionMaterial" property="promotionMaterialId"/>'/>
                </td>
                <td><span><bean:write name="promotionMaterial" property="promotionMaterialName"/></span></td>
                <td><span><bean:write name="promotionMaterial" property="promotionMaterialUnitName"/></span></td>
                <td><span><bean:write name="promotionMaterial" property="promotionMaterialStoreName"/></span></td>
                <td><input type="text" size="20" name="promotionMaterialQuantity" value="${promotionMaterial.quantity}" onblur="tryNumberFormatCurrentcy(this);" onkeypress="return readonlyFloat(event);"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>