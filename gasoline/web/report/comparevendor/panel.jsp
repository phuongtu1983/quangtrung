<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='reportCompareVendorSearchForm' id='reportCompareVendorSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td colspan="2">
                    <select id="reportCompareVendorSearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'reportCompareVendorSearchForm')">
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
                <td><bean:message key="vendor.title"/></td>
                <td>
                    <select style="width: 260px;" name="customerId" id="customerIdCombobox">
                        <logic:iterate id="vendor_iter" name="<%=Constants.VENDOR_LIST%>">
                            <option  value="${vendor_iter.id}">${vendor_iter.name}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printComapreVendorReport(document.forms['reportCompareVendorSearchForm'].fromDate.value, document.forms['reportCompareVendorSearchForm'].toDate.value);">In</button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>