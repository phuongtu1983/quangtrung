<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.stepup.core.util.NumberUtil"%>
<%@ page import="com.stepup.gasoline.qt.bean.EmployeeBean"%>
<%@ page import="com.stepup.gasoline.qt.bean.FixedAssetDepreciationDetailBean"%>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<table id="fixedAssetDepreciationDetailTbl" class="its"  style="width:100%">
    <thead>
        <tr>
            <td width="400px"><bean:message key="fixedasset.title"/></td>
            <td width="100px"><bean:message key="unit.title"/></td>
            <td width="100px"><bean:message key="quantity.title"/></td>
            <td width="100px"><bean:message key="price.title"/></td>
            <td width="100px"><bean:message key="fixedAssetDepreciation.title"/></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <logic:present name="<%=Constants.FIXED_ASSET_DEPRECIATION_GOOD%>">
            <%
                ArrayList goodList = (ArrayList) request.getAttribute(Constants.FIXED_ASSET_DEPRECIATION_GOOD);
                FixedAssetDepreciationDetailBean bean = null;
                for (int i = 0; i < goodList.size(); i++) {
                    bean = (FixedAssetDepreciationDetailBean) goodList.get(i);
                    if (i % 2 == 1) {
            %>
            <tr class="odd">
                <%} else {%>
            <tr class="even">
                <%}%>
                <td>
                    <%=bean.getFixedAssetName()%>
                    <input type="hidden" name="fixedAssetDepreciationDetailId" value="<%=bean.getId()%>"/>
                    <input type="hidden" name="fixedAssetId" value="<%=bean.getFixedAssetId()%>"/>
                </td>
                <td><%=bean.getUnitName()%></td>
                <td><%=NumberUtil.formatMoneyDefault(bean.getQuantity(), "VND")%></td>
                <td><%=NumberUtil.formatMoneyDefault(bean.getPrice(), "VND")%></td>
                <td>
                    <%if (bean.getIsCalculate() == EmployeeBean.STATUS_ACTIVE) {%>
                    <input type="checkbox" checked value="<%=bean.getFixedAssetId()%>" name="isCheck"/>
                    <%} else {%>
                    <input type="checkbox" value="<%=bean.getFixedAssetId()%>" name="isCheck"/>
                    <%}%>
                </td>  
            </tr>
            <%}%>
        </logic:present>
    </tbody>
</table>