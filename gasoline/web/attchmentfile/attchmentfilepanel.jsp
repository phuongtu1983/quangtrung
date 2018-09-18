<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table>
    <tr>
        <td width="900">
            <button class="i_create_write icon small green" onclick="return getAttchmentFile();"><bean:message key="message.add"/></button>
            <button class="i_trashcan icon small red" onclick="return delAttchmentFile();"><bean:message key="message.del"/></button>
        </td>
    </tr>
    <tr>
        <td>
            <div id='attachmentFileList' style="width:100%; height:768px;"></div>
            <div id="recinfoArea"></div>
        </td>
    </tr>
</table>