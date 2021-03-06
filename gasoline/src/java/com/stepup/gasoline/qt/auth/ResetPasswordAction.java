/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.auth;

/**
 *
 * @author phuongtu
 */
import com.stepup.core.sercurity.Encoder;
import com.stepup.gasoline.qt.bean.UserBean;
import com.stepup.gasoline.qt.dao.UserDAO;
import com.stepup.gasoline.qt.util.MailHandle;
import com.stepup.gasoline.qt.util.QTUtil;
import java.lang.reflect.Array;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class ResetPasswordAction extends Action {
    /* forward name="success" path="" */

    private final static String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ResetPasswordForm formBean = (ResetPasswordForm) form;
        UserBean member = null;
        UserDAO memberDAO = new UserDAO();
        try {
            member = (UserBean) memberDAO.isExistMember(formBean.getUsername(), formBean.getEmail());
        } catch (Exception ex) {
            throw ex;
        }

        if (member != null) {
            String newPass = makePassword();
            try {
                memberDAO.changePassword(member.getId(), Encoder.getMD5_Base64(newPass));
                try {
                    sendMail(member.getFullname(), formBean.getUsername(), formBean.getEmail(), newPass);
                } catch (Exception ex) {
                }
            } catch (Exception ex) {
                throw ex;
            }
        } else {
            ActionMessages errors = new ActionMessages();
            errors.add("userLogin", new ActionMessage("error.resetpassword.fail"));
            saveErrors(request, errors);
            return mapping.getInputForward();
        }
        return mapping.findForward(SUCCESS);
    }

    private String makePassword() {
        String pass = "";
        String[] chars = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
            "a", "A", "b", "B", "c", "C", "d", "D", "e", "E",
            "f", "F", "g", "G", "h", "H", "i", "I", "j", "J",
            "k", "K", "l", "L", "m", "M", "n", "N", "o", "O",
            "p", "P", "q", "Q", "r", "R", "s", "S", "t", "T",
            "u", "U", "v", "V", "w", "W", "x", "X", "y", "Y",
            "z", "Z"};

        int count = Array.getLength(chars) - 1;
        int length = 10;
        Random ran = new Random();

        //srand((double)microtime()*1000000);
        for (int i = 0; i < length; i++) {
            pass += chars[ran.nextInt(count)];
        }
        return (pass);
    }

    private void sendMail(String name, String userName, String mail_to, String newPassword) throws Exception {
        String content = "";
        content += "<html><head><meta http-equiv='Content-Language' content='en-us'><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'></head><body>";
        content += "<table align='center' width='70%'><tr><td class='cart_b' width='761' height='31' align='center'>"
                + "<font color='#CCCCCC' face='Wingdings' style='font-size: 13pt'>? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?</font></td></tr>"
                + "<tr><td class='cart_b' style='border-left-width: 1px; border-right-width: 1px; border-top: 1px solid #C0C0C0; border-bottom-width: 1px ;margin-left:6; margin-top:0; margin-bottom:0; font-size:9pt'>&nbsp;</td></tr>"
                + "<tr><td align='center'>"
                + "<span style='font-size: 17pt;color:#0000FF'><b>"
                + QTUtil.getBundleString("message.resetpassword.email.title")
                + "</b></span></td></tr><tr><td>";
        content += "<span style='font-size: 12pt'><b>Name : </b>" + name + "</span><br>&nbsp;"
                + "<span style='font-size: 12pt'><b>Username : </b>" + userName + "</span><br>&nbsp;"
                + "<span style='font-size: 12pt'><b>NewPassword : </b>" + newPassword + "</span><br>&nbsp;"
                + "</td></tr><tr><td><div style='border-left-width: 1px; border-right-width: 1px; border-top: 1px solid #C0C0C0; border-bottom-width: 1px' align='center'><font face=\"Trebuchet MS\" size=\"1\"><BR>If your browser does not support UNICODE, please open attachment or contact Webmaster for more infomation, thank you! <BR>"
                + QTUtil.getBundleString("message.notify.senderMail") + "</font></div></td></tr></table>";

        content += "</body></html>";
        String mail_subject = "Quang Trung Copr, Reset Password for " + name;
        MailHandle gmailRunnable = new MailHandle(mail_to, mail_subject, content);
        Thread t = new Thread(gmailRunnable);
        t.start();
    }
}
