package tw.brad.ok;

import java.util.HashSet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/myserver")
public class MyServer {
	private static HashSet<Session> sessions;
	
	public MyServer() {
		System.out.println("MyServer()");
		if (sessions == null) {
			sessions = new HashSet<>();
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen()");
		session.setMaxIdleTimeout(60*1000);
		sessions.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println(message);
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose()");
		sessions.remove(session);
	}
	
	@OnError
	public void onError(Session session, Throwable t) {
		System.out.println("onError():" + t.toString());
		sessions.remove(session);
	}
	
}
