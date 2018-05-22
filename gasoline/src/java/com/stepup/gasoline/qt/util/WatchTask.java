package com.stepup.gasoline.qt.util;

import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;
import com.stepup.core.util.TimerUtil;

/**
 *
 * @author Administrator
 */
public class WatchTask extends TimerTask {

    private static WatchTask instance = null;
    private boolean scheduled;
    private Calendar c = Calendar.getInstance();
    public final static long anHour = 60 * 60 * 1000; // chenh lech 1 phut

    private WatchTask() {
        scheduled = false;
    }

    public static synchronized WatchTask getInstance() {
        if (instance == null) {
            instance = new WatchTask();
        }
        return instance;
    }

    @Override
    public boolean cancel() {
        return super.cancel();
    }

    public synchronized void schedule(Date firstTime, long period) {
        if (!scheduled) {
            scheduled = true;
            TimerUtil.getInstance().schedule(this, firstTime, period);
        }
    }

    public synchronized void schedule(Date time) {
        if (!scheduled) {
            scheduled = true;
            TimerUtil.getInstance().schedule(this, time);
        }
    }

    public synchronized void schedule(long delay, long period) {
        if (!scheduled) {
            scheduled = true;
            TimerUtil.getInstance().schedule(this, delay, period);
        }
    }

    public synchronized void scheduleAtFixedRate(Date firstTime, long period) {
        if (!scheduled) {
            scheduled = true;
            TimerUtil.getInstance().schedule(this, firstTime, period);
        }
    }

    public synchronized void scheduleAtFixedRate(long delay, long period) {
        if (!scheduled) {
            scheduled = true;
            TimerUtil.getInstance().schedule(this, delay, period);
        }
    }

    public synchronized void schedule(long period) {
        if (!scheduled) {
            long delay = getRescheduleDelay();
            if (delay > 0) {
                scheduled = true;
                TimerUtil.getInstance().schedule(this, delay, period);
            }
        }
    }

    private long getRescheduleDelay() {
        c.setTime(new Date());
        int mm = c.get(Calendar.MINUTE);
        long delay = 0;
        delay = (60 - mm) * 60 * 1000;
        return delay;
    }

    @Override
    public void run() {
//        try {
//            try {
//                LogDAO logDAO = new LogDAO();
//                logDAO.tryToConnectServer();
//            } catch (Exception ex) {
//            }
//            c.setTime(new Date());
//            int hh = c.get(Calendar.HOUR_OF_DAY);
////            int mi = c.get(Calendar.MINUTE);
//            System.out.println("Start WatchTask " + DateUtil.today("dd/MM/yyyy HH:mm:ss"));
//            if (hh == 1) {
////            if ((hh >= 0 && hh < 1) || (hh > 0 && hh <= 1)) {
////            if (hh > 0 && hh < 1 && mi > 0 && mi < 30) {
//                try {
//                    StoreDAO storeDAO = new StoreDAO();
//                    storeDAO.createFoodAveragePrice(DateUtil.yesterday("dd/MM/yyyy"));
//                    storeDAO.createFoodAveragePrice(DateUtil.today("dd/MM/yyyy"));
//                } catch (Exception ex) {
//                }
//            }
//            System.out.println("End WatchTask");
//        } catch (Exception ex) {
//        }
    }
}
