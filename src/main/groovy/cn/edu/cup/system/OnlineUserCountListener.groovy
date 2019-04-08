package cn.edu.cup.system;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class OnlineUserCountListener implements HttpSessionListener {

    def systemStatusService

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        Date now = new Date();
        System.out.printf("创建session at %s......\n", now.toString());
        //创建唯一的用户登记表
        HttpSession s = se.getSession();
        if (s != null) {
            def ss = new SystemStatus(
                    sessionId: s.getId(),
                    loginTime: now
            )
            def item = new SystemStatusItem(
                    actionTime: now,
                    paramsString: "创建会话",
                    systemStatus: ss
            )
            if (!ss.items) {
                ss.items = []
            }
            ss.items.add(item)
            ss.save()
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession s = se.getSession();
        Date now = new Date()
        println("${s} 会话撤销 at ${now.toString()}...")
        def ss = SystemStatus.findBySessionId(s.getId())    // 会话撤销，这一句已经不能执行了！！
        if (ss) {
            ss.logoutTime = now
            def item = new SystemStatusItem(
                    actionTime: now,
                    paramsString: "超时退出",
                    systemStatus: ss
            )
            if (!ss.items) {
                ss.items = []
            }
            ss.items.add(item)
            systemStatusService.save(ss)
        }
    }

}
