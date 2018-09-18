/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.core.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phuongtu
 */
public class OutputUtil {

    public static void sendStringToOutput(HttpServletResponse resp, String content) {
        try {
            System.out.println("Send response: " + content);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            resp.getOutputStream().write(content.getBytes("UTF-8"));
        } catch (IOException ex) {
            Logger.getLogger(OutputUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void sendXmlStringToOutput(HttpServletResponse resp, String content) {
        try {
            System.out.println("Send response: " + content);
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/xml; charset=UTF-8");
            resp.getOutputStream().write(content.getBytes("UTF-8"));
        } catch (IOException ex) {
            Logger.getLogger(OutputUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void sendZipFileToOutput(HttpServletResponse resp, String fileName) throws Exception {
        FileInputStream fis = new FileInputStream(fileName);
        BufferedInputStream stream = new BufferedInputStream(fis);
        OutputStream output = null;
        try {
            resp.setContentType("application/zip");
            resp.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");
            resp.setHeader("Cache-Control", "max-age=1000");
            output = resp.getOutputStream();
            byte[] buffer = new byte[4028];
            int n = 0;
            while (-1 != (n = stream.read(buffer))) {
                output.write(buffer, 0, n);
            }
        } finally {
            if (stream != null) {
                stream.close();
                File file = new File(fileName);
                file.delete();
            }
            if (output != null) {
                output.close();
            }
        }
    }
}
