package File;

import java.util.Timer;
import java.util.TimerTask;

public class Main {
    public static void main(String[] args) {

        Integer cacheTime = 1000 * 5;
        Timer timer = new Timer();
        // (TimerTask task, long delay, long period)任务，延迟时间，多久执行
        timer.schedule(new TimerTask() {

            @Override
            public void run() {
                //
                //获取token
                String token=HttpRequest.sendGet("http://openapi.ecois.info/v3/token", "appid=vMsI7usfbsO5bF7U","secret=WvzUoBh5aw73IVQufY5kiPIhk8gSzD7w");
                //发送 POST 请求
                String sr=HttpRequest.sendPost("http://openapi.ecois.info/v3/devices","page=2","limit=100",token);
                String sr2=HttpRequest.sendPostt("http://openapi.ecois.info/v3/devices","page=2","limit=100",token);
            }
        }, 1000, cacheTime);
    }
}
