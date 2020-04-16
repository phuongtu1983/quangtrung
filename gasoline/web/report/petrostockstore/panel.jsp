<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='reportPetroStockStoreSearchForm' id='reportPetroStockStoreSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td colspan="2">
                    <select id="reportPetroStockStoreSearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'reportPetroStockStoreSearchForm')">
                        <option value="1">Ngày</option>
                        <option value="2">Tháng</option>
                        <option value="3">Năm</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="padding-right: 20px">Từ</td>
                <td colspan="2">
                    <input type="text" name="fromDate" id="fromDate" size="10"> Đến <input type="text" name="toDate" id="toDate" size="10">
                </td>
            </tr>
            <tr>
                <td><bean:message key="store.title"/></td>
                <td>
                    <select style="width: 260px;" name="storeId" id="storeIdCombobox">
                        <logic:iterate id="store_iter" name="<%=Constants.STORE_LIST%>">
                            <option  value="${store_iter.id}">${store_iter.name}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printPetroStockStoreReport(document.forms['reportPetroStockStoreSearchForm'].fromDate.value, document.forms['reportPetroStockStoreSearchForm'].toDate.value);"><bean:message key="message.permission.permit.download"/></button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>