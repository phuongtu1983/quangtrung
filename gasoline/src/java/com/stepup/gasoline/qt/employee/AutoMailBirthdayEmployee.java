/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.employee;

import com.stepup.core.util.LogUtil;
import com.stepup.core.util.NumberUtil;
import com.stepup.gasoline.qt.bean.EmployeeBean;
import com.stepup.gasoline.qt.bean.ParameterBean;
import com.stepup.gasoline.qt.dao.EmployeeDAO;
import com.stepup.gasoline.qt.dao.ParameterDAO;
import com.stepup.gasoline.qt.util.Constants;
import com.stepup.gasoline.qt.util.MailHandle;
import com.stepup.gasoline.qt.util.QTUtil;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class AutoMailBirthdayEmployee implements Runnable {

    @Override
    public void run() {
        try {
            ParameterDAO parameterDAO = new ParameterDAO();
            ParameterBean param = parameterDAO.getParametersByCode(Constants.PARAM_MAIL_BEFORE_DAY);
            int day = 0;
            if (param != null) {
                day = NumberUtil.parseInt(param.getValue(), 0);
            }
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList arrEmp = employeeDAO.getBirthdayEmployeeBeforeDay(day);
            EmployeeBean bean;
            for (int i = 0; i < arrEmp.size(); i++) {
                bean = (EmployeeBean) arrEmp.get(i);
                emailForEmployeeBirthday(bean.getFullname(), bean.getEmail());
            }
        } catch (Exception ex) {

        }
    }
//
//    private void emailForEmployeeBirthday(String fullname, String email) {
//        try {
//            String content = "<html __fvdsurfcanyoninserted=\"1\" class=\" clickberry-extension clickberry-extension-standalone clickberry-extension clickberry-extension-standalone clickberry-extension clickberry-extension-standalone\"><head>\n"
//                    + "        <meta charset=\"UTF-8\">\n"
//                    + "        <title>Happy Birthday</title>\n"
//                    + "        <style>\n"
//                    + "            /* If you can't see it just hit space in here*/\n"
//                    + "            body {\n"
//                    + "                font-family:'Wendy One', sans-serif;\n"
//                    + "            }\n"
//                    + "			\n"
//                    + "			body {\n"
//                    + "  background-image: -webkit-gradient(radial, 50% 50%, 0, 50% 50%, 100, color-stop(0%, #374566), color-stop(100%, #010203));\n"
//                    + "  background-image: -webkit-radial-gradient(#374566, #010203);\n"
//                    + "  background-image: -moz-radial-gradient(#374566, #010203);\n"
//                    + "  background-image: -o-radial-gradient(#374566, #010203);\n"
//                    + "  background-image: radial-gradient(#374566, #010203);\n"
//                    + "}\n"
//                    + "            span {\n"
//                    + "                text-transform: uppercase;\n"
//                    + "            }\n"
//                    + "            .container {\n"
//                    + "                width: 800px;\n"
//                    + "                height: 420px;\n"
//                    + "                padding: 10px;\n"
//                    + "                margin: 0 auto;\n"
//                    + "                position: relative;\n"
//                    + "            }\n"
//                    + "            .balloon {\n"
//                    + "                width: 738px;\n"
//                    + "                margin: 0 auto;\n"
//                    + "                padding-top: 30px;\n"
//                    + "                position: relative;\n"
//                    + "            }\n"
//                    + "            .balloon > div {\n"
//                    + "                width: 104px;\n"
//                    + "                height: 140px;\n"
//                    + "                background: rgba(182, 15, 97, 0.9);\n"
//                    + "                border-radius: 0;\n"
//                    + "                border-radius: 80% 80% 80% 80%;\n"
//                    + "                margin: 0 auto;\n"
//                    + "                position: absolute;\n"
//                    + "                padding: 10px;\n"
//                    + "                box-shadow: inset 17px 7px 10px rgba(182, 15, 97, 0.9);\n"
//                    + "                -webkit-transform-origin: bottom center;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(1) {\n"
//                    + "                background: rgba(182, 15, 97, 0.9);\n"
//                    + "                left: 0;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(135, 11, 72, 0.9);\n"
//                    + "                -webkit-animation: balloon1 6s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon1 6s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon1 6s ease-in-out infinite;\n"
//                    + "                animation: balloon1 6s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(1):before {\n"
//                    + "                color: rgba(182, 15, 97, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(2) {\n"
//                    + "                background: rgba(242, 112, 45, 0.9);\n"
//                    + "                left: 120px;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(222, 85, 14, 0.9);\n"
//                    + "                -webkit-animation: balloon2 6s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon2 6s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon2 6s ease-in-out infinite;\n"
//                    + "                animation: balloon2 6s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(2):before {\n"
//                    + "                color: rgba(242, 112, 45, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(3) {\n"
//                    + "                background: rgba(45, 181, 167, 0.9);\n"
//                    + "                left: 240px;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(35, 140, 129, 0.9);\n"
//                    + "                -webkit-animation: balloon4 6s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon4 6s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon4 6s ease-in-out infinite;\n"
//                    + "                animation: balloon4 6s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(3):before {\n"
//                    + "                color: rgba(45, 181, 167, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(4) {\n"
//                    + "                background: rgba(190, 61, 244, 0.9);\n"
//                    + "                left: 360px;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(173, 14, 240, 0.9);\n"
//                    + "                -webkit-animation: balloon1 5s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon1 5s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon1 5s ease-in-out infinite;\n"
//                    + "                animation: balloon1 5s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(4):before {\n"
//                    + "                color: rgba(190, 61, 244, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(5) {\n"
//                    + "                background: rgba(180, 224, 67, 0.9);\n"
//                    + "                left: 480px;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(158, 206, 34, 0.9);\n"
//                    + "                -webkit-animation: balloon3 5s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon3 5s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon3 5s ease-in-out infinite;\n"
//                    + "                animation: balloon3 5s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(5):before {\n"
//                    + "                color: rgba(180, 224, 67, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(6) {\n"
//                    + "                background: rgba(242, 194, 58, 0.9);\n"
//                    + "                left: 600px;\n"
//                    + "                box-shadow: inset 10px 10px 10px rgba(234, 177, 15, 0.9);\n"
//                    + "                -webkit-animation: balloon2 3s ease-in-out infinite;\n"
//                    + "                -moz-animation: balloon2 3s ease-in-out infinite;\n"
//                    + "                -o-animation: balloon2 3s ease-in-out infinite;\n"
//                    + "                animation: balloon2 3s ease-in-out infinite;\n"
//                    + "            }\n"
//                    + "            .balloon > div:nth-child(6):before {\n"
//                    + "                color: rgba(242, 194, 58, 0.9);\n"
//                    + "            }\n"
//                    + "            .balloon > div:before {\n"
//                    + "                color: rgba(182, 15, 97, 0.9);\n"
//                    + "                position: absolute;\n"
//                    + "                bottom: -11px;\n"
//                    + "                left: 52px;\n"
//                    + "                content:\"▲\";\n"
//                    + "                font-size: 1em;\n"
//                    + "            }\n"
//                    + "            span {\n"
//                    + "                font-size: 4.8em;\n"
//                    + "                color: white;\n"
//                    + "                position: relative;\n"
//                    + "                top: 30px;\n"
//                    + "                left: 50%;\n"
//                    + "                margin-left: -27px;\n"
//                    + "            }\n"
//                    + "            /*BALLOON 1 4*/\n"
//                    + "            @-webkit-keyframes balloon1 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -webkit-transform: translateY(0) rotate(-6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -webkit-transform: translateY(-20px) rotate(8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-moz-keyframes balloon1 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -moz-transform: translateY(0) rotate(-6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -moz-transform: translateY(-20px) rotate(8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-o-keyframes balloon1 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -o-transform: translateY(0) rotate(-6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -o-transform: translateY(-20px) rotate(8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @keyframes balloon1 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    transform: translateY(0) rotate(-6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    transform: translateY(-20px) rotate(8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            /* BAllOON 2 5*/\n"
//                    + "            @-webkit-keyframes balloon2 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -webkit-transform: translateY(0) rotate(6eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -webkit-transform: translateY(-30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-moz-keyframes balloon2 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -moz-transform: translateY(0) rotate(6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -moz-transform: translateY(-30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-o-keyframes balloon2 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -o-transform: translateY(0) rotate(6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -o-transform: translateY(-30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @keyframes balloon2 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    transform: translateY(0) rotate(6deg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    transform: translateY(-30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            /* BAllOON 0*/\n"
//                    + "            @-webkit-keyframes balloon3 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -webkit-transform: translate(0, -10px) rotate(6eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -webkit-transform: translate(-20px, 30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-moz-keyframes balloon3 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -moz-transform: translate(0, -10px) rotate(6eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -moz-transform: translate(-20px, 30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-o-keyframes balloon3 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -o-transform: translate(0, -10px) rotate(6eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -o-transform: translate(-20px, 30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @keyframes balloon3 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    transform: translate(0, -10px) rotate(6eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    transform: translate(-20px, 30px) rotate(-8deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            /* BAllOON 3*/\n"
//                    + "            @-webkit-keyframes balloon4 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -webkit-transform: translate(10px, -10px) rotate(-8eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -webkit-transform: translate(-15px, 20px) rotate(10deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-moz-keyframes balloon4 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -moz-transform: translate(10px, -10px) rotate(-8eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -moz-transform: translate(-15px, 10px) rotate(10deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @-o-keyframes balloon4 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    -o-transform: translate(10px, -10px) rotate(-8eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    -o-transform: translate(-15px, 10px) rotate(10deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            @keyframes balloon4 {\n"
//                    + "                0%, 100% {\n"
//                    + "                    transform: translate(10px, -10px) rotate(-8eg);\n"
//                    + "                }\n"
//                    + "                50% {\n"
//                    + "                    transform: translate(-15px, 10px) rotate(10deg);\n"
//                    + "                }\n"
//                    + "            }\n"
//                    + "            h1 {\n"
//                    + "                position: relative;\n"
//                    + "                top: 200px;\n"
//                    + "                text-align: center;\n"
//                    + "                color: white;\n"
//                    + "                font-size: 3.5em;\n"
//                    + "            }\n"
//                    + "        </style>\n"
//                    + "        <script>\n"
//                    + "            window.open = function() {};\n"
//                    + "            window.print = function() {};\n"
//                    + "            // Support hover state for mobile.\n"
//                    + "            if (false) {\n"
//                    + "                window.ontouchstart = function() {};\n"
//                    + "            }\n"
//                    + "        </script>\n"
//                    + "        <script type=\"text/javascript\" src=\"chrome-extension://bfbmjmiodbnnpllbbbfblcplfjjepjdn/js/injected.js\"></script>\n"
//                    + "        <meta content=\"clickberry-extension-here\">\n"
//                    + "        <meta content=\"clickberry-extension-here\">\n"
//                    + "        <style type=\"text/css\"></style>\n"
//                    + "        <style type=\"text/css\"></style>\n"
//                    + "    <style type=\"text/css\"></style><style type=\"text/css\"></style><script type=\"text/javascript\" src=\"chrome-extension://bfbmjmiodbnnpllbbbfblcplfjjepjdn/js/injected.js\"></script><meta content=\"clickberry-extension-here\"></head>\n"
//                    + "    \n"
//                    + "    <body>\n"
//                    + "        <link href=\"https://fonts.googleapis.com/css?family=Wendy+One\" rel=\"stylesheet\" type=\"text/css\">\n"
//                    + "        <div class=\"container\">\n"
//                    + "            <div class=\"balloon\">\n"
//                    + "                <div><span>☺</span>\n"
//                    + "                </div>\n"
//                    + "                <div><span>B</span>\n"
//                    + "                </div>\n"
//                    + "                <div><span>D</span>\n"
//                    + "                </div>\n"
//                    + "                <div><span>A</span>\n"
//                    + "                </div>\n"
//                    + "                <div><span>Y</span>\n"
//                    + "                </div>\n"
//                    + "                <div><span>!</span>\n"
//                    + "                </div>\n"
//                    + "            </div>\n"
//                    + "             <h1>Happy Birthday " + fullname.toUpperCase() + "</h1>\n"
//                    + "\n"
//                    + "        </div>\n"
//                    + "        <script>\n"
//                    + "            \n"
//                    + "        </script>\n"
//                    + "        <script>\n"
//                    + "            if (document.location.search.match(/type=embed/gi)) {\n"
//                    + "                window.parent.postMessage('resize', \"*\");\n"
//                    + "            }\n"
//                    + "        </script>\n"
//                    + "    \n"
//                    + "\n"
//                    + "</body></html>";
//
//            String mail_subject = QTUtil.getBundleString("message.notify.employee.birthday.title") + " " + fullname.toUpperCase();
//            MailHandle handler = new MailHandle(email, mail_subject, content);
//            Thread t = new Thread(handler);
//            t.start();
//        } catch (Exception ex) {
//            LogUtil.error("FAILED:Request:sendBirthdayEmail-" + ex.getMessage());
//        }
//    }

    private void emailForEmployeeBirthday(String fullname, String email) {
        try {
            String content = "<!DOCTYPE html>\n"
                    + "<html >\n"
                    + "<head>\n"
                    + "  <meta charset=\"UTF-8\">\n"
                    + "  <title>CSS Birthday Cake</title>\n"
                    + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                    + "  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css\">\n"
                    + "\n"
                    + "  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js\"></script>\n"
                    + "\n"
                    + "</head>\n"
                    + "\n"
                    + "<body style=\"color:#fff;\">\n"
                    + "    \n"
                    + "    <center>\n"
                    + "    \n"
                    + "  <div class=\"cake\">\n"
                    + "    <div class=\"plate\"></div>\n"
                    + "    <div class=\"layer layer-bottom\"></div>\n"
                    + "    <div class=\"layer layer-middle\"></div>\n"
                    + "    <div class=\"layer layer-top\"></div>\n"
                    + "    <div class=\"icing\"></div>\n"
                    + "    <div class=\"drip drip1\"></div>\n"
                    + "    <div class=\"drip drip2\"></div>\n"
                    + "    <div class=\"drip drip3\"></div>\n"
                    + "    <div class=\"candle\">\n"
                    + "        <div class=\"flame\"></div>\n"
                    + "    </div>\n"
                    + "</div>\n"
                    + "\n"
                    + " <link href=\"https://fonts.googleapis.com/css?family=Wendy+One\" rel=\"stylesheet\" type=\"text/css\">\n"
                    + "        <div class=\"container\">\n"
                    + "            <div class=\"balloon\">\n"
                    + "                <div><span>☺</span>\n"
                    + "                </div>\n"
                    + "                <div><span>B</span>\n"
                    + "                </div>\n"
                    + "                <div><span>D</span>\n"
                    + "                </div>\n"
                    + "                <div><span>A</span>\n"
                    + "                </div>\n"
                    + "                <div><span>Y</span>\n"
                    + "                </div>\n"
                    + "                <div><span>!</span>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "             <h1>Sweety</h1>\n"
                    + "\n"
                    + "        </div>\n"
                    + "        \n"
                    + "  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>\n"
                    + "\n"
                    + "  </center>\n"
                    + "</body>\n"
                    + "</html>";

            String mail_subject = QTUtil.getBundleString("message.notify.employee.birthday.title") + " " + fullname.toUpperCase();
            MailHandle handler = new MailHandle(email, mail_subject, content);
            Thread t = new Thread(handler);
            t.start();
        } catch (Exception ex) {
            LogUtil.error("FAILED:Request:sendBirthdayEmail-" + ex.getMessage());
        }
    }

}
