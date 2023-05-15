package tw.brad.ok;

import java.util.HashMap;
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
	private static HashMap<String,Session> users;
	
	public MyServer() {
		System.out.println("MyServer()");
		if (sessions == null) {
			sessions = new HashSet<>();
			users = new HashMap<>();
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen():" + session.getId());
		session.setMaxIdleTimeout(60*1000);
		if (sessions.add(session)) {
			users.put(session.getId(), session);
			
		}
		
		System.out.println("Count:" + sessions.size());
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println(message);
		
		for (Session user : sessions) {
			try {
				user.getBasicRemote().sendText(message);
			}catch(Exception e) {
				System.out.println(e);
			}
		}
		
//		try {
//			users.get("47").getBasicRemote().sendText(message);
//		}catch(Exception e) {
//		}
		
		
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("onClose()");
		sessions.remove(session);
		System.out.println("Count:" + sessions.size());
	}
	
	@OnError
	public void onError(Session session, Throwable t) {
		System.out.println("onError():" + t.toString());
		sessions.remove(session);
	}
	
}
