package com.stepup.gasoline.qt.util;

import com.stepup.core.util.DateUtil;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;
import com.stepup.core.util.TimerUtil;
import com.stepup.gasoline.qt.dao.BasicDAO;
import com.stepup.gasoline.qt.employee.AutoSalarayEmployee;

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
        try {
            try {
                BasicDAO.tryToConnectServer();
            } catch (Exception ex) {
            }
            c.setTime(new Date());
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int day = c.get(Calendar.DATE);
            System.out.println("Start WatchTask " + DateUtil.today("dd/MM/yyyy HH:mm:ss"));
            if (hour == 1 && day == 1) {
                try {
                    AutoSalarayEmployee autoRunnable = new AutoSalarayEmployee();
                    Thread t = new Thread(autoRunnable);
                    t.start();
                } catch (Exception ex) {
                }
            }
            System.out.println("End WatchTask");
        } catch (Exception ex) {
        }
    }
}
