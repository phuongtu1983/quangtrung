<%@page import="com.stepup.core.util.NumberUtil"%>
<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.stepup.gasoline.qt.util.Constants"%>
<%@ page import="com.stepup.gasoline.qt.bean.PermissionBean"%>
<%@ page import="com.stepup.gasoline.qt.permission.PermissionViewBean"%>
<%@ page import="com.stepup.gasoline.qt.util.PermissionUtil"%>
<%@ page import="com.stepup.gasoline.qt.permission.PermissionFormBean"%>
<%@ page import="java.util.ArrayList"%>
<table style="width:100%" id="permissionTable" class="its">
    <thead>
        <tr>
            <th width="20px"><bean:message key="message.rowNum"/></th>
            <th><bean:message key="message.permission.func"/></th>
            <th width="100px"><bean:message key="message.permission.permit.list"/></th>
            <th width="50px"><bean:message key="message.permission.permit.add"/></th>
            <!--<th width="100px"><bean:message key="message.permission.permit.view"/></th>-->
            <th width="50px"><bean:message key="message.permission.permit.delete"/></th>
            <th width="50px"><bean:message key="message.permission.permit.edit"/></th>
            <th width="120px"><bean:message key="message.permission.permit.editPast"/></th>
            <th width="50px"><bean:message key="message.permission.permit.print"/></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <logic:present name="<%=Constants.PERMISSION_FUNC_LIST%>">
            <%
                ArrayList permissionList = (ArrayList) request.getAttribute(Constants.PERMISSION_FUNC_LIST);
                PermissionFormBean formBean = (PermissionFormBean) request.getAttribute(Constants.PERMISSION);
                PermissionViewBean bean = null;
                for (int i = 0; i < permissionList.size(); i++) {
                    bean = (PermissionViewBean) permissionList.get(i);
                    if (i % 2 == 1) {
            %>
            <tr class="odd">
                <%} else {%>
            <tr class="even">
                <%}%>
                <%if (bean.getLevel() == 0) {%>
                <td><div><strong><%=bean.getCounter()%></strong></div></td>
                <td><strong><%=bean.getName()%></strong></td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_LIST + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcList<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcList')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_ADD + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcAdd<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcAdd')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_DELETE + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcDelete<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcDelete')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcEdit<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcEdit')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT_PAST + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcEditPast<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcEditPast')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_PRINT + ",")) {%>
                    <div align="center"><input type="checkbox" id="funcPrint<%=bean.getSharedId()%>" onchange="return permissionLevel1Change(this, 'funcPrint')" value="<%=bean.getValue()%>"/></div>
                        <%}%>
                </td>
                <%}%>
                <%if (bean.getLevel() == 1) {%>
                <td><div><strong><%=bean.getCounter()%></strong></div></td>
                <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;<%=bean.getName()%></strong></td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_LIST + ",")) {%>
                    <div align="center"><html:multibox property="funcList" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_ADD + ",")) {%>
                    <div align="center"><html:multibox property="funcAdd" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_DELETE + ",")) {%>
                    <div align="center"><html:multibox property="funcDelete" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT + ",")) {%>
                    <div align="center"><html:multibox property="funcEdit" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT_PAST + ",")) {%>
                    <div align="center"><html:multibox property="funcEditPast" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_PRINT + ",")) {%>
                    <div align="center"><html:multibox property="funcPrint" name="<%=Constants.PERMISSION%>"><%=bean.getValue()%></html:multibox></div>
                    <%}%>
                </td>
                <%}%>
                <%if (bean.getLevel() == 2) {%>
                <td><div><%=bean.getCounter()%></div></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bean.getName()%></td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_LIST + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncList() != null) {
                                int n = formBean.getFuncList().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncList()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcList<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcList"/>
                        <%} else {%>
                        <input type="checkbox" id="funcList<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcList"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_ADD + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncAdd() != null) {
                                int n = formBean.getFuncAdd().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncAdd()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcAdd<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcAdd"/>
                        <%} else {%>
                        <input type="checkbox" id="funcAdd<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcAdd"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_DELETE + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncDelete() != null) {
                                int n = formBean.getFuncDelete().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncDelete()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcDelete<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcDelete"/>
                        <%} else {%>
                        <input type="checkbox" id="funcDelete<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcDelete"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncEdit() != null) {
                                int n = formBean.getFuncEdit().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncEdit()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcEdit<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcEdit"/>
                        <%} else {%>
                        <input type="checkbox" id="funcEdit<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcEdit"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_EDIT_PAST + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncEditPast()!= null) {
                                int n = formBean.getFuncEditPast().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncEditPast()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcEditPast<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcEditPast"/>
                        <%} else {%>
                        <input type="checkbox" id="funcEditPast<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcEditPast"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <td>
                    <%if (bean.getOperations().contains("," + PermissionUtil.OPERATION_PRINT + ",")) {%>
                    <div align="center">
                        <%
                            boolean isChecked = false;
                            if (formBean.getFuncPrint() != null) {
                                int n = formBean.getFuncPrint().length;
                                for (int j = 0; j < n; j++) {
                                    int value = NumberUtil.parseInt(formBean.getFuncPrint()[j], 0);
                                    if (bean.getValue() == value) {
                                        isChecked = true;
                                        break;
                                    }
                                }
                            }
                            if (isChecked) {
                        %>
                        <input type="checkbox" checked id="funcPrint<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcPrint"/>
                        <%} else {%>
                        <input type="checkbox" id="funcPrint<%=bean.getSharedId()%>" value="<%=bean.getValue()%>" name="funcPrint"/>
                        <%}%>
                    </div>
                    <%}%>
                </td>
                <%}%>
            </tr>
            <%}%>
        </logic:present>
    </tbody>
</table>