package chat;

import java.io.IOException;
import org.jivesoftware.smack.*;
import org.jivesoftware.smack.SmackException.NotConnectedException;
import org.jivesoftware.smack.chat2.Chat;
import org.jivesoftware.smack.chat2.ChatManager;
import org.jivesoftware.smack.chat2.IncomingChatMessageListener;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.MessageBuilder;
import org.jivesoftware.smack.tcp.*;
import org.jxmpp.jid.EntityBareJid;
import org.jxmpp.jid.impl.JidCreate;
import org.jxmpp.stringprep.XmppStringprepException;
import java.time.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.chat2.OutgoingChatMessageListener;
import table.ChatMessage;

public class ChatMethod {
	public static boolean flag = true;
	public static ChatManager chatManager = null;
	private static List<AbstractXMPPConnection> con = null;
	public static XMPPTCPConnectionConfiguration config(String username, String password) throws XmppStringprepException {
		XMPPTCPConnectionConfiguration conf = XMPPTCPConnectionConfiguration.builder()
				.setUsernameAndPassword(username, password)
				.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled)
				.setXmppDomain("desktop-2r19ff6")
				.setHost("127.0.0.1")
				.setPort(5222)
				.build();
		return conf;
	}
	
	public static AbstractXMPPConnection connect(String username, String password) throws NotConnectedException, InterruptedException, XmppStringprepException {
		XMPPTCPConnectionConfiguration config = config(username, password);
		AbstractXMPPConnection con = new XMPPTCPConnection(config);
		try {
			con.connect(); //Establishes a connection to the server
			con.login(username, password);
		} catch (XMPPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SmackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public static void message(ChatManager chatM, String message, String user) throws NotConnectedException, InterruptedException {
		EntityBareJid jid = null;
		try{
			jid= JidCreate.entityBareFrom(user + "@desktop-2r19ff6");
			}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		Chat chat = chatM.chatWith(jid);
		chat.send(message);
	}
	public static void messageAPI(String user, String password, String message, String recepient) throws NotConnectedException, InterruptedException, XmppStringprepException {
		AbstractXMPPConnection conn = connect(user, password);
		con.add(conn);
		ChatManager chatmgr = ChatManager.getInstanceFor(conn);
		chatmgr.addIncomingListener(new IncomingChatMessageListener() {
			@Override
			public void newIncomingMessage(EntityBareJid from, Message message, Chat chat) {
				System.out.println("New Message from " + from + ": " + message.getBody());
				}
			}
		);
		chatmgr.addOutgoingListener(new OutgoingChatMessageListener() {
			@Override
			public void newOutgoingMessage(EntityBareJid from, MessageBuilder message, Chat chat) {
				// TODO Auto-generated method stub
				System.out.println(from + " " + message.getBody());
				System.out.println(chat.toString());
			}
		});
	}
	public static void main(String args[]) throws NotConnectedException, InterruptedException {
		try {
			messageAPI("pengzky43", "Admin123", "hello", "duhh");
			messageAPI("duhh", "Admin123", "hello", "pengzky43");
			TimeUnit.SECONDS.sleep(1);
			con.get(0).disconnect();
			con.get(1).disconnect();
			
			
		} catch (NotConnectedException | XmppStringprepException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static void setCon(AbstractXMPPConnection connect) {
		con.add(connect);
	}
	public static List<AbstractXMPPConnection> getCon() {
		return con;
	}
	
}