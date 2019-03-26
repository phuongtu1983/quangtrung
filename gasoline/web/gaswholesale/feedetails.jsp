<%@ page import="com.stepup.gasoline.qt.bean.GasWholesaleFeeDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasWholesaleFeeDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="gasWholeSaleFee.detail.name"/></td>
            <td width="100px"><bean:message key="amount.title"/></td>
            <td width="300px"><bean:message key="note.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="fee" name="<%=Constants.GAS_WHOLESALE_FEE%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasWholesaleFeeChk" tabindex="-1" value="<%=((GasWholesaleFeeDetailBean) pageContext.getAttribute("fee")).getId()%>">
                    <input type="hidden" name="gasWholesaleFeeDetailId" value='<bean:write name="fee" property="id"/>'/>
                    <input type="hidden" name="feeId" value='<bean:write name="fee" property="feeId"/>'/>
                    <input type="hidden" name="feeKind" value='<bean:write name="fee" property="kind"/>'/>
                </td>
                <td><span><bean:write name="fee" property="feeName"/></span></td>
                <td><input type="text" size="20" name="feeAmount" value="${fee.amount}" onblur="caculateListTotal('gasWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="50" name="feeNote" value="${fee.note}"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>