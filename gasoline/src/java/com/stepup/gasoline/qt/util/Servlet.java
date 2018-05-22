package com.stepup.gasoline.qt.util;

import com.stepup.core.util.LogUtil;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServlet;

public class Servlet extends HttpServlet {

    WatchTask watchTask = null;

    /** Creates a new instance of TMServlet */
    public Servlet() {
    }

    @Override
    public void init() {
        try {
            LogUtil.initialize(Servlet.class.getResource("/log4j.properties"));
            //init timer
            System.out.println("Start WatchTask");
            watchTask = WatchTask.getInstance();
//            watchTask.schedule(0, WatchTask.schdule);
            Calendar c = Calendar.getInstance();
            c.setTime(new Date());
            int mm = c.get(Calendar.MINUTE);
            if (mm != 0) {
                watchTask.run();
                watchTask.schedule((60 - mm) * 60 * 1000, WatchTask.anHour);
            } else {
                watchTask.schedule(mm * 60 * 1000, WatchTask.anHour);
            }
        } catch (Exception e) {
        }
    }

    @Override
    public void destroy() {
        if (watchTask != null) {
            System.out.println("Stop WatchTask");
            watchTask.cancel();
        }
        super.destroy();
    }
}
