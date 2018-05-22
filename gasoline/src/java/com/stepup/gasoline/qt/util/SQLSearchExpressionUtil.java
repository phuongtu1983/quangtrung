/*
 * TMUtil.java
 *
 * Created on March 26, 2007, 11:08 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline.qt.util;

import com.stepup.core.util.StringUtil;
import java.util.ArrayList;
import java.util.Stack;

/**
 *
 * @author phuongtu
 */
public class SQLSearchExpressionUtil {

    private static char ochar = '{';
    private static char cchar = '}';
    private static char pchar = '+';
    private static char mchar = '/';

    public static String excuteExpression(String valueSearch, String columName) {
        valueSearch = StringUtil.encodeHTML(valueSearch);
        Stack<String> stack = new Stack<String>();
        ArrayList str = new ArrayList();
        String temp = "";
        for (int i = 0; i < valueSearch.length(); i++) {
            if (valueSearch.charAt(i) == ochar) {
                stack.push(ochar + "");
            } else if (valueSearch.charAt(i) == pchar || valueSearch.charAt(i) == mchar) {
                if (temp.length() > 0) {
                    str.add(temp);
                }
                temp = "";
                if (!stack.empty()) {
                    String tt = stack.pop();
                    if (tt.equals(mchar + "") && valueSearch.charAt(i) == pchar) {
                        str.add(tt);
                    } else {
                        stack.push(tt);
                    }
                }
                stack.push(valueSearch.charAt(i) + "");
            } else if (valueSearch.charAt(i) == cchar) {
                if (temp.length() > 0) {
                    str.add(temp);
                }
                temp = "";
                int a = 1;
                while (a == 1) {
                    if (stack.empty()) {
                        a = 0;
                    } else {
                        String tt = stack.pop();
                        if (tt.equals(ochar + "")) {
                            a = 0;
                        } else {
                            str.add(tt);
                        }
                    }
                }
            } else {
                temp += valueSearch.charAt(i);
            }
        }
        if (temp.length() > 0) {
            str.add(temp);
        }
        while (!stack.empty()) {
            String tt = stack.pop();
            str.add(tt);
        }
        if (str.size() > 1) {
            for (int i = 0; i < str.size(); i++) {
                if (str.get(i).equals(pchar + "") || str.get(i).equals(mchar + "")) {
                    String f = "";
                    String l = "";
                    if (!stack.empty()) {
                        f = stack.pop();
                    }
                    if (!stack.empty()) {
                        l = stack.pop();
                    }
                    f = f.trim();
                    l = l.trim();
                    String c = "";
                    if (str.get(i).equals(pchar + "")) {
                        c += " ( ";
                        if (l.indexOf("like '%") == -1) {
                            c += columName + " like '%" + l + "%' ";
                        } else {
                            c += l;
                        }
                        c += " and ";
                        if (f.indexOf("like '%") == -1) {
                            c += columName + " like '%" + f + "%'";
                        } else {
                            c += f;
                        }
                        c += " ) ";
                    } else if (str.get(i).equals(mchar + "")) {
                        c += " ( ";
                        if (l.indexOf("like '%") == -1) {
                            c += columName + " like '%" + l + "%' ";
                        } else {
                            c += l;
                        }
                        c += " or ";
                        if (f.indexOf("like '%") == -1) {
                            c += columName + " like '%" + f + "%'";
                        } else {
                            c += f;
                        }
                        c += " ) ";
                    }
                    stack.push(c);
                } else {
                    stack.push(str.get(i) + "");
                }
            }
        } else {
            if (str.size() == 1) {
                stack.push(columName + " like '%" + str.get(0) + "%' ");
            }
        }
        if (stack.empty()) {
            return "";
        } else {
            return stack.pop();
        }
    }
}
