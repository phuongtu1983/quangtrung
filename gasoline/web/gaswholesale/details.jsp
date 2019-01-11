<%@ page import="com.stepup.gasoline.qt.bean.GasWholesaleDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table id="gasWholesaleDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="30px"><bean:message key="message.del"/></td>
            <td width="170px"><bean:message key="shell.detail.name"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="200px"><bean:message key="amount.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:iterate id="shell" name="<%=Constants.GAS_WHOLESALE_SHELL%>">
            <tr>
                <td>
                    <input type="checkbox" name="gasWholesaleShellChk" tabindex="-1" value="<%=((GasWholesaleDetailBean) pageContext.getAttribute("shell")).getId()%>">
                    <input type="hidden" name="gasWholesaleDetailId" value='<bean:write name="shell" property="id"/>'/>
                    <input type="hidden" name="shellId" value='<bean:write name="shell" property="shellId"/>'/>
                </td>
                <td><span><bean:write name="shell" property="shellName"/></span></td>
                <td><span><bean:write name="shell" property="unitName"/></span></td>
                <td><input type="text" size="20" name="quantity" value="${shell.quantity}" id="detquantity${shell.shellId}" onblur="return caculateFormListDetail('${shell.shellId}','gasWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="price" value="${shell.price}" id="detprice${shell.shellId}" onblur="return caculateFormListDetail('${shell.shellId}','gasWholesaleForm');" onkeypress="return readonlyFloat(event);"/></td>
                <td><input type="text" size="20" name="amount" value="${shell.amount}" id="detamount${shell.shellId}" readonly="readonly" tabindex="-1"/></td>
            </tr>
        </logic:iterate>
    </tbody>
</table>