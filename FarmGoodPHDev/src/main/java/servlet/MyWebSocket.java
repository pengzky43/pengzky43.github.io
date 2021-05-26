package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class MyWebSocket {
	
	private static Map<String, Session> sMap = new HashMap<String, Session>();

	@OnMessage
    public void onMessage(String message, Session session) 
    	throws IOException, InterruptedException {
		
		try {
            for (String key : sMap.keySet()) {
                
                Session s = sMap.get(key); 
                                    
                if (s.isOpen()) {
                	s.getBasicRemote().sendText(message);
                } else {
                    sMap.remove(key);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	@OnOpen
    public void onOpen (Session session) {
        System.out.println("Client "+ session.getId() +" connected");
        sMap.put(session.getId(), session);
        
		///////////////////////////////////////////////////////////////////////////// 
		// Access request parameters from URL query String.
		// If a client subscribes, add Session to PushTimeService. 
		//
//		Map<String, List<String>> params = session.getRequestParameterMap();
//		
//		if (params.get("push") != null && (params.get("push").get(0).equals("TIME"))) {
//		
//			PushTimeService.initialize();
//			PushTimeService.add(session);
//		}
		/////////////////////////////////////////////////////////////////////////////
    }

    @OnClose
    public void onClose (Session session) {
    	System.out.println("Client " + session.getId() + " left");
    }
    
    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
}