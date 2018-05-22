/*
 * LEIDCoreResourceBundle.java
 *
 * Created on March 21, 2007, 10:44 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.stepup.gasoline;

import java.util.Locale;
import com.stepup.core.i18n.CacheResourceBundle;

/**
 *
 * @author Administrator
 */
public class TTDCoreResourceBundle {

    private static CacheResourceBundle cacheResourceBundle = new CacheResourceBundle("TTDCore_java_i18n");

    /** Creates a new instance of TTDCoreResourceBundle */
    public TTDCoreResourceBundle() {
    }

    public static String getString(Locale locale, String key) {
        return cacheResourceBundle.getString(locale, key);
    }
}
