<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<div class="header"><bean:message key="openingStock.title"/></div>
<table class="its">
    <tr>
        <td height="30" style="padding-right: 20px; width: 200px"><bean:message key="date.title"/></td>
        <td colspan="2"><input type="text" size="20" id="openingStockDate"></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="accessory.title"/></td>
        <td style="padding-right: 20px; width: 200px"><button class="i_printer icon small" onclick="return printOpeningStockExport('accessory');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('accessory');">Import</button></td>
    </tr>
    <tr class="odd">
        <td height="30" style="padding-right: 20px"><bean:message key="customer.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('customer');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('customer');">Import</button></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="good.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('good');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('good');">Import</button></td>
    </tr>
    <tr class="odd">
        <td height="30" style="padding-right: 20px"><bean:message key="lpg.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('lpg');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('lpg');">Import</button></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="money.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('money');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('money');">Import</button></td>
    </tr>
    <tr class="odd">
        <td height="30" style="padding-right: 20px"><bean:message key="petro.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('petro');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('petro');">Import</button></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="promotionMaterial.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('promotionMaterial');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('promotionMaterial');">Import</button></td>
    </tr>
    <tr class="odd">
        <td height="30" style="padding-right: 20px"><bean:message key="shellGas.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('shellGas');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('shellGas');">Import</button></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="shell.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('shell');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('shell');">Import</button></td>
    </tr>
    <tr class="odd">
        <td height="30" style="padding-right: 20px"><bean:message key="shield.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('shield');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('shield');">Import</button></td>
    </tr>
    <tr class="even">
        <td height="30" style="padding-right: 20px"><bean:message key="vendor.title"/></td>
        <td><button class="i_printer icon small" onclick="return printOpeningStockExport('vendor');">Export</button></td>
        <td><button class="i_buildings icon small green" onclick="return importOpeningStock('vendor');">Import</button></td>
    </tr>
</table>