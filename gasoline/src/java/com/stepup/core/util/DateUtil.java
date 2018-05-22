package com.stepup.core.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;
import java.text.SimpleDateFormat;

public class DateUtil {

    public static String formatterDateAfficher(Date date) {
        if (date == null) {
            return "";
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int jour = c.get(Calendar.DATE);
        int mois = c.get(Calendar.MONTH) + 1;
        int annee_pro = c.get(Calendar.YEAR);
        NumberFormat format_number = new DecimalFormat("##00");
        return format_number.format(mois) + "/" + format_number.format(jour)
                + "/" + annee_pro;
    }

    public static Date transformerStringEnDate(String str, String token) {
        if (str == null) {
            return null;
        }
        StringTokenizer dateCreation_token = new StringTokenizer(str, token);
        if (dateCreation_token.countTokens() != 3) {
            return null;
        }
        try {
            int dateCreation_jour = Integer.parseInt(dateCreation_token.nextToken());
            int dateCreation_mois = Integer.parseInt(dateCreation_token.nextToken());
            int dateCreation_annee = Integer.parseInt(dateCreation_token.nextToken());
            if (dateCreation_annee < 2000) {
                dateCreation_annee = dateCreation_annee + 2000;
            }
            Calendar c = Calendar.getInstance();
            c.set(dateCreation_annee, dateCreation_mois - 1, dateCreation_jour);
            return c.getTime();

        } catch (Exception ex) {
            return null;
        }
    }

    /**
     *  Format date
     *
     *    G  	Era designator 	Text  	AD
     *    y 	Year 	Year 	1996; 96
     *    M 	Month in year 	Month 	July; Jul; 07
     *    w 	Week in year 	Number 	27
     *    W 	Week in month 	Number 	2
     *    D 	Day in year 	Number 	189
     *    d 	Day in month 	Number 	10
     *    F 	Day of week in month 	Number 	2
     *    E 	Day in week 	Text 	Tuesday; Tue
     *    a 	Am/pm marker 	Text 	PM
     *    H 	Hour in day (0-23) 	Number 	0
     *    k 	Hour in day (1-24) 	Number 	24
     *    K 	Hour in am/pm (0-11) 	Number 	0
     *    h 	Hour in am/pm (1-12) 	Number 	12
     *    m 	Minute in hour 	Number 	30
     *    s 	Second in minute 	Number 	55
     *    S 	Millisecond 	Number 	978
     *    z 	Time zone 	General time zone 	Pacific Standard Time; PST; GMT-08:00
     *    Z 	Time zone
     *
     *  Examples
     *   "yyyy.MM.dd G 'at' HH:mm:ss z"  	2001.07.04 AD at 12:08:56 PDT
     *   "EEE, MMM d, ''yy" 	Wed, Jul 4, '01
     *   "h:mm a" 	12:08 PM
     *   "hh 'o''clock' a, zzzz" 	12 o'clock PM, Pacific Daylight Time
     *   "K:mm a, z" 	0:08 PM, PDT
     *   "yyyyy.MMMMM.dd GGG hh:mm aaa" 	02001.July.04 AD 12:08 PM
     *   "EEE, d MMM yyyy HH:mm:ss Z" 	Wed, 4 Jul 2001 12:08:56 -0700
     *   "yyMMddHHmmssZ" 	010704120856-0700
     *
     *  @param date date
     *  @param pattern the pattern describing the date and time format
     */
    public static String formatDate(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        //SimpleDateFormat formatter = new SimpleDateFormat ("dd-MMM-yyyy");
        //SimpleDateFormat formatter_b = new SimpleDateFormat ("dd-MM-yy");
        //SimpleDateFormat formatter_c = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
        //SimpleDateFormat formatter_d = new SimpleDateFormat ("dd-MM-yy hh:mm");
        //SimpleDateFormat formatter_e = new SimpleDateFormat ("dd-MMM-yyyy - hh:mm:ss");
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
        //String date_b = formatter_b.format(date_now);
        //String date_c = formatter_c.format(date_now);
        //String date_d = formatter_d.format(date_now);
        //String date_e = formatter_e.format(date_now);
    }

    public static String today(String pattern) {
        Date date_now = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date_now);
    }

    public static String yesterday(String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }
    
    public static String yesterday(String pattern, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DAY_OF_MONTH, 0 - days);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static String yesterday(Date date, String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DAY_OF_MONTH, -1);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }
    
    public static String getDate(Date date, int day, String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DAY_OF_MONTH, day);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static String tomorrow(String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DAY_OF_MONTH, 1);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static String getDayOfWeek(Date date, int i, String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int day = c.get(Calendar.DAY_OF_WEEK);
        c.set(Calendar.DAY_OF_WEEK, i);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static String getDayOfWeek(String date, int i, String pattern) {
        return getDayOfWeek(transformerStringEnDate(date, "-"), i, pattern);
    }

    public static String getNextWeek(String date, int i, String pattern) {
        return getNextWeek(transformerStringEnDate(date, "-"), i, pattern);
    }

    public static String getNextWeek(Date date, int i, String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int day = c.get(Calendar.DAY_OF_WEEK);
        c.set(Calendar.DAY_OF_WEEK, 2);
        c.add(Calendar.DAY_OF_MONTH, 7);
        c.set(Calendar.DAY_OF_WEEK, i);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static String getDayLastWeek(Date date, int i, String pattern) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int day = c.get(Calendar.DAY_OF_WEEK);
        c.set(Calendar.DAY_OF_WEEK, 2);
        c.add(Calendar.DAY_OF_MONTH, -7);
        c.set(Calendar.DAY_OF_WEEK, i);
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(c.getTime());
    }

    public static int getDay(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            return 0;
        }

        int result = 0;
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        while (c1.get(Calendar.YEAR) != c2.get(Calendar.YEAR)) {
            result += 360;
            c2.add(Calendar.DAY_OF_YEAR, 360);
        }
        result += c1.get(Calendar.DAY_OF_YEAR) - c2.get(Calendar.DAY_OF_YEAR);
        return result;
    }

    public static int getDay(String strDate1, String strDate2) {
        Date date1 = transformerStringEnDate(strDate1, "-");
        Date date2 = transformerStringEnDate(strDate2, "-");
        int result = 0;
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        while (c1.get(Calendar.YEAR) != c2.get(Calendar.YEAR)) {
            result += 360;
            c2.add(Calendar.DAY_OF_YEAR, 360);
        }
        result += c1.get(Calendar.DAY_OF_YEAR) - c2.get(Calendar.DAY_OF_YEAR);
        return result;
    }

    public static Date convertStringToDate(String dateStr, String format) {
        SimpleDateFormat mySimpleDateFormat = new SimpleDateFormat(format);
        try {
            return mySimpleDateFormat.parse(dateStr);
        } catch (Exception e) {
            return null;
        }
    }
}
