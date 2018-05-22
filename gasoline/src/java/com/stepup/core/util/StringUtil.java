/*
 * StringUtil.java
 *
 * Created on March 26, 2007, 2:55 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.core.util;

import java.util.StringTokenizer;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author Administrator
 */
public class StringUtil {

    public static boolean isBlankOrNull(String str) {
        if (str == null || str.trim().length() == 0) {
            return true;
        }
        return false;
    }

    public static String concatPrefix(boolean bFirst, String str, String prefixStr) {
        return (bFirst) ? str : prefixStr + str;
    }

    public static String[] toTokensArray(String value, String token_sign) {
        if (value == null) {
            value = "";
        }
        StringTokenizer st = new StringTokenizer(value, token_sign);

        int token_num = st.countTokens();
        String shared_path_full[] = new String[token_num];
        int k = 0;

        while (st.hasMoreTokens()) {
            shared_path_full[k] = st.nextToken().trim();
            k++;
        }
        return shared_path_full;
    }

    public static String replace(String str, String pattern, String replace) {
        if (replace == null) {
            replace = "";
        }
        int s = 0, e = 0;
        StringBuilder result = new StringBuilder((int) str.length() * 2);
        while ((e = str.indexOf(pattern, s)) >= 0) {
            result.append(str.substring(s, e));
            result.append(replace);
            s = e + pattern.length();
        }
        result.append(str.substring(s));
        return result.toString();
    }

    /**
     * Create a word-wrapped version of a String. Wrap at 80 characters and 
     * use newlines as the delimiter. If a word is over 80 characters long 
     * use a - sign to split it.
     */
    static public String wordWrap(String str) {
        return wordWrap(str, 80, "\n", "-", true);
    }

    /**
     * Create a word-wrapped version of a String. Wrap at a specified width and 
     * use newlines as the delimiter. If a word is over the width in lenght 
     * use a - sign to split it.
     */
    static public String wordWrap(String str, int width) {
        return wordWrap(str, width, "\n", "-", true);
    }

    /**
     * Word-wrap a string.
     *
     * @param str   String to word-wrap
     * @param width int to wrap at
     * @param delim String to use to separate lines
     * @param split String to use to split a word greater than width long
     * @param delimInside wheter or not delim should be included in chunk before length reaches width.
     *
     * @return String that has been word wrapped
     */
    static public String wordWrap(String str, int width, String delim,
            String split, boolean delimInside) {
        int sz = str.length();
        /// shift width up one. mainly as it makes the logic easier
        width++;
        // our best guess as to an initial size
        StringBuilder buffer = new StringBuilder(sz / width * delim.length() + sz);
        // every line might include a delim on the end
        if (delimInside) {
            width = width - delim.length();
        } else {
            width--;
        }
        int idx = -1;
        String substr = null;
        // beware: i is rolled-back inside the loop
        for (int i = 0; i < sz; i += width) {
            // on the last line
            if (i > sz - width) {
                buffer.append(str.substring(i));
                break;
            }
            // the current line
            substr = str.substring(i, i + width);
            // is the delim already on the line
            idx = substr.indexOf(delim);
            if (idx != -1) {
                buffer.append(substr.substring(0, idx));
                buffer.append(delim);
                i -= width - idx - delim.length();
                // Erase a space after a delim. Is this too obscure?
                if (substr.length() > idx + 1) {
                    if (substr.charAt(idx + 1) != '\n') {
                        if (Character.isWhitespace(substr.charAt(idx + 1))) {
                            i++;
                        }
                    }
                }
                continue;
            }
            idx = -1;
            // figure out where the last space is
            char[] chrs = substr.toCharArray();
            for (int j = width; j > 0; j--) {
                if (Character.isWhitespace(chrs[j - 1])) {
                    idx = j;
                    break;
                }
            }

            // idx is the last whitespace on the line.
            if (idx == -1) {
                for (int j = width; j > 0; j--) {
                    if (chrs[j - 1] == '-') {
                        idx = j;
                        break;
                    }
                }
                if (idx == -1) {
                    buffer.append(substr);
                    buffer.append(delim);
                } else {
                    if (idx != width) {
                        idx++;
                    }
                    buffer.append(substr.substring(0, idx));
                    buffer.append(delim);
                    i -= width - idx;
                }
            } else {
                // insert spaces
                buffer.append(substr.substring(0, idx));
                buffer.append(StringUtils.repeat(" ", width - idx));
                buffer.append(delim);
                i -= width - idx;
            }
        }
        return buffer.toString();
    }

    public static String encodeHTML(String s) {
        StringBuilder str = new StringBuilder();

        int len = (s != null) ? s.length() : 0;
        for (int i = 0; i < len; i++) {
            char ch = s.charAt(i);
            switch (ch) {
                case '<': {
                    str.append("&lt;");
                    break;
                }
                case '>': {
                    str.append("&gt;");
                    break;
                }
                case '&': {
                    str.append("&amp;");
                    break;
                }
                case '"': {
                    str.append("&quot;");
                    break;
                }
                case '”': {
                    str.append("&quot;");
                    break;
                }
                case '\'': {
                    str.append("&apos;");
                    break;
                }
                case '\r':
                case '\n': {
                    if (true) {//canonical = true
                        str.append("&#");
                        str.append(Integer.toString(ch));
                        str.append(';');
                        break;
                    }
                    // else, default append char
                }
                default: {
                    str.append(ch);
                }
            }
        }

        return str.toString();
    }

//    public static String encodeString(String s) {
//        StringBuilder str = new StringBuilder();
//
//        int len = (s != null) ? s.length() : 0;
//        for (int i = 0; i < len; i++) {
//            char ch = s.charAt(i);
//            switch (ch) {
//                case '"': {
//                    str.append("\"");
//                    break;
//                }
//                default: {
//                    str.append(ch);
//                }
//            }
//        }
//
//        return str.toString();
//    }
    
    public static String encodeString(String s) {
        try {
            s = StringUtil.replaceAllWords(s, "<", "&lt;");
            s = StringUtil.replaceAllWords(s, ">", "&gt;");
            s = StringUtil.replaceAllWords(s, "&", "&amp;");
            s = StringUtil.replaceAllWords(s, "\"", "&quot;");
            s = StringUtil.replaceAllWords(s, "\'", "&apos;");
            s = StringUtil.replaceAllWords(s, "\n", "&#10;");
//            s = s.replaceAll("null", "...");
        } catch (Exception e) {
            s = "";
        }
        return s;
    }

    public static String decodeString(String s) {
        try {
            s = StringUtil.replaceAllWords(s, "&lt;", "<");
            s = StringUtil.replaceAllWords(s, "&gt;", ">");
            s = StringUtil.replaceAllWords(s, "&amp;", "&");
            s = StringUtil.replaceAllWords(s, "&quot;", '"');
            s = StringUtil.replaceAllWords(s, "&apos;", "\'");
            s = StringUtil.replaceAllWords(s, "&#10;", "\n");
            s = s.replaceAll("null", "...");
        } catch (Exception e) {
            s = "";
        }
        return s;
    }

    public static String replaceAllWords(String original, String find, String replacement) {
        String result = "";
        String delimiters = "+-*/(),. ";
        StringTokenizer st = new StringTokenizer(original, delimiters, true);
        while (st.hasMoreTokens()) {
            String w = st.nextToken();
            if (w.contains(find)) {
                if (w.split(find).length == 0) {
                    result = result + replacement;
                } else if (w.split(find).length == 1) {
                    result = result + w.split(find)[0] + replacement;
                } else {
                    result = result + w.split(find)[0] + replacement + w.split(find)[1];
                }
            } else {
                result = result + w;
            }
        }
        return result;
    }

    public static String replaceAllWords(String original, String find, char replacement) {
        String result = "";
        String delimiters = "+-*/(),. ";
        StringTokenizer st = new StringTokenizer(original, delimiters, true);
        while (st.hasMoreTokens()) {
            String w = st.nextToken();
            if (w.contains(find)) {
                if (w.split(find).length == 0) {
                    result = result + replacement;
                } else if (w.split(find).length == 1) {
                    result = result + w.split(find)[0] + replacement;
                } else {
                    result = result + w.split(find)[0] + replacement + w.split(find)[1];
                }
            } else {
                result = result + w;
            }
        }
        return result;
    }

    public static String makeShortName(String str, int nWorld) {
        if (isBlankOrNull(str)) {
            return "";
        }

        StringTokenizer token = new StringTokenizer(str, " ");
        int i = 0;
        StringBuilder strBuff = new StringBuilder();
        while (token.hasMoreTokens()) {
            strBuff.append(token.nextToken());
            i++;
            if (i == nWorld) {
                break;
            } else {
                strBuff.append(" ");

            }
        }
        if (strBuff.length() < str.length()) {
            strBuff.append("...");
        }
        return strBuff.toString();
    }

    public static String getString(String str) {
        if (isBlankOrNull(str)) {
            return "";
        }
        return str;
    }

    public static String decodeHTML(String s) {
        s = s.replaceAll("&#43;", "+");
        return s;
    }

    public static String generatePrefix(String content, int length) {
        String temp = content;
        int l = temp.length();
        temp = "";
        for (int i = 0; i < length - l; i++) {
            temp = "0";
        }
        temp += content;
        return temp;
    }
}
