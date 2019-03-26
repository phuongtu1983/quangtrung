<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table class="its" id="gasWholesaleFeeTbl">
    <logic:iterate id="fee" name="<%=Constants.GAS_WHOLESALE_FEE%>">
        <tr>
            <td>
                <input type="checkbox" name="gasWholesaleFeeChk" tabindex="-1" value="<bean:write name="fee" property="feeId"/>">
                <input type="hidden" name="gasWholesaleFeeDetailId" value='0'/>
                <input type="hidden" name="feeId" value='<bean:write name="fee" property="feeId"/>'/>
                <input type="hidden" name="feeKind" value='<bean:write name="fee" property="kind"/>'/>
            </td>
            <td><span><bean:write name="fee" property="feeName"/></span></td>
            <td><input type="text" size="20" name="feeAmount" value="0" onblur="caculateListTotal('gasWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
            <td><input type="text" size="50" name="feeNote"/></td>
        </tr>
    </logic:iterate>
</table>