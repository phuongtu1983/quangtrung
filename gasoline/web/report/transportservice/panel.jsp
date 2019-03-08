<%@page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<form name='reportTransportServiceSearchForm' id='reportTransportServiceSearchForm'>
    <fieldset>
        <legend class="lbl10b"><bean:message key="search.title"/></legend>
        <table>
            <tr>
                <td style="padding-right: 20px">Thời gian</td>
                <td colspan="2">
                    <select id="reportTransportServiceSearchFormTime" style="width:200px" onchange="return reportTimeChange(this, 'reportTransportServiceSearchForm')">
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
                <td><bean:message key="transportService.detail.transporter"/></td>
                <td>
                    <select style="width: 260px;" name="transporterId" id="transporterIdComboboxPopup">
                        <logic:iterate id="transporter_iter" name="<%=Constants.TRANSPORTER_LIST%>">
                            <option  value="${transporter_iter.id}">${transporter_iter.name}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td><bean:message key="transportService.detail.vendor"/></td>
                <td>
                    <select style="width: 260px;" name="vendorId" id="vendorIdComboboxPopup">
                        <logic:iterate id="vendor_iter" name="<%=Constants.VENDOR_LIST%>">
                            <option  value="${vendor_iter.id}">${vendor_iter.name}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td><bean:message key="transportService.detail.customer"/></td>
                <td>
                    <select style="width: 260px;" name="customerId" id="customerIdComboboxPopup">
                        <logic:iterate id="customer_iter" name="<%=Constants.CUSTOMER_LIST%>">
                            <option  value="${customer_iter.id}">${customer_iter.name}</option>
                        </logic:iterate>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button class="i_printer icon small" onclick="return printTransportServiceReport(document.forms['reportTransportServiceSearchForm'].fromDate.value, document.forms['reportTransportServiceSearchForm'].toDate.value);">In</button>
                    <button class="i_access_denied icon small yellow" onclick="return hidePopupForm();"><bean:message key="message.close"/></button>
                </td>
            </tr>
        </table>
    </fieldset>
    <input type="hidden" name="vendorSelectedHidden" value="0"/>
    <input type="hidden" name="customerSelectedHidden" value="0"/>
    <input type="hidden" name="transporterSelectedHidden" value="0"/>
</form>