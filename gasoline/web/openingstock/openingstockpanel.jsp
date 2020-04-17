<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<div class="header"><bean:message key="openingStock.title"/></div>
<table class="its">
    <tr>
        <td height="30" style="padding-right: 20px; width: 200px"><bean:message key="date.title"/></td>
        <td colspan="2"><input type="text" size="20" id="openingStockDate"></td>
    </tr>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_ACCESSORY)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="accessory.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('accessory');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_ACCESSORY)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('accessory');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_CUSTOMER)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('customer');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_CUSTOMER)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('customer');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_GOOD)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="good.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('good');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_GOOD)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('good');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_LPG)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="lpg.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('lpg');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_LPG)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('lpg');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_CASH)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="money.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('money');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_CASH)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('money');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_PETRO)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="petro.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('petro');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_PETRO)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('petro');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_PROMOTION_MATERIAL)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="promotionMaterial.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('promotionMaterial');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_PROMOTION_MATERIAL)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('promotionMaterial');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_GAS_SHELL)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="shellGas.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('shellGas');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_GAS_SHELL)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('shellGas');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_SHELL)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="shell.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('shell');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_SHELL)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('shell');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_SHIELD)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="shield.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('shield');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_SHIELD)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('shield');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_VENDOR)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('vendor');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_VENDOR)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('vendor');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_OIL)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="oil.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('oil');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_OIL)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('oil');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
    <%if (PermissionUtil.hasOneOfPermission(request, PermissionUtil.OPERATION_LIST + "", PermissionUtil.PER_OPENING_STOCK_SOLAR)) {%> 
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="solar.title"/></td>
        <td style="padding-right: 20px; width: 200px">
            <button class="i_printer icon small" onclick="return printOpeningStockExport('solar');">Export</button>
        </td>
        <td>
            <%if (PermissionUtil.hasPermission(request, PermissionUtil.OPERATION_ADD, PermissionUtil.PER_OPENING_STOCK_SOLAR)) {%> 
            <button class="i_buildings icon small green" onclick="return importOpeningStock('solar');">Import</button>
            <%}%>
        </td>
    </tr>
    <%}%>
</table>