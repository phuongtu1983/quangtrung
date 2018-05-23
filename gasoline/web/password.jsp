<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<div id="passwordFormshowHelpHideDivContent">
    <html:form action="changePassword.do">
        <table border="0" width="100%" cellspacing="0" cellpadding="0" >
            <tr><td>
                    <table cellspacing="0" cellpadding="0" style="border-width: 0px">
                        <tr>
                            <td height="30"><bean:message key="message.passwordform.curpassword"/></td>
                            <td style="padding-left: 20px"><html:password property="password" size="20"/></td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="message.passwordform.newpassword"/></td>
                            <td style="padding-left: 20px"><html:password property="newpassword" size="20"/></td>
                        </tr>
                        <tr>
                            <td height="30"><bean:message key="message.passwordform.retypepassword"/></td>
                            <td style="padding-left: 20px"><html:password property="retypepassword" size="20" /></td>
                        </tr>
                    </table>
                </td></tr>
            <tr>
                <td style="text-align: center">
                    <p style="margin-top: 0; margin-bottom: 0">
                        <button class="i_create_write icon small green" onclick="return changePassword();"><bean:message key="message.save"/></button>
                        <button class="i_access_denied icon small yellow" onclick="return prepareHidePopup('passwordFormshowHelpHideDiv');"><bean:message key="message.close"/></button>
                    </p>
                </td>
            </tr>
        </table>
        <html:hidden property="md5pw" value="" />
    </html:form>
    <div name="passwordFormshowHelpHideDiv" id="showHelpHideDiv" style="display:none">
        Ctrl+C : Đóng
        Ctrl+S : Lưu
    </div>
    <div id="shiftCFunctionHideDiv" style="display:none">prepareHidePopup('passwordFormshowHelpHideDiv')</div>
    <div id="shiftSFunctionHideDiv" style="display:none">changePassword()</div>
    <div id="shiftEscFunctionHideDiv" style="display:none">prepareHidePopup('passwordFormshowHelpHideDiv')</div>
</div>