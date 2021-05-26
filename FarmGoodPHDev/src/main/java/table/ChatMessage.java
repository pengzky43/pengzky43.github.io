package table; // package table
import java.io.Serializable; // import Serialization for get and set, and storing form values into variables
import java.sql.Blob;
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

public class ChatMessage implements Serializable{ // declare class User that implements Serialization
	private static final long serialVersionUID = 1L; // Serial
	/* 
	declare String variables
	*/
	AbstractXMPPConnection con = null;
	ChatManager chatmgr = null;
	String username;
	String password;
	String message;
	String recepient;
	XMPPTCPConnectionConfiguration config = null;
	List<ChatMessage> user = new ArrayList<ChatMessage>();
/* 
 public declaration of Class "User", with parameter , for inserting values
*/	public  ChatMessage(String username, String password) throws SmackException, IOException, XMPPException, InterruptedException {
	build(username ,password);
	login();
	init();
	}

	public ChatMessage() {
		
	}

	public ChatMessage(String username, String password, String message, String recepient) throws SmackException, IOException, XMPPException, InterruptedException{
		ChatMessage s = new ChatMessage(username, password);
		s.setRecepient(recepient);
		s.setMessage(message);
		user.add(s);
	}
	/*
	set and get of variables
	e.g. getVar() setVar(String var)
	*/
	public XMPPTCPConnectionConfiguration build(String username, String password) throws XmppStringprepException {
		this.config = XMPPTCPConnectionConfiguration.builder()
				.setUsernameAndPassword(username, password)
				.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled)
				.setXmppDomain("desktop-2r19ff6")
				.setHost("127.0.0.1")
				.setPort(5222)
				.build();
		return this.config;
	}
	public XMPPTCPConnectionConfiguration getbuild() {
		return this.config;
	}
	
	public AbstractXMPPConnection login() throws SmackException, IOException, XMPPException, InterruptedException {
		con = new XMPPTCPConnection(this.config);
		con.connect();
		con.login();
		return con;
	}
	public AbstractXMPPConnection getCon(){
		return con;
	}
	public ChatManager init() {
		chatmgr = ChatManager.getInstanceFor(con);
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
			}
		});
		return chatmgr;
	}
	
	public void message(String mesasge, String recepient) throws XmppStringprepException {
		EntityBareJid jid = JidCreate.entityBareFrom(recepient + "@desktop-2r19ff6");
		Chat chat = chatmgr.chatWith(jid);
		try {
			chat.send(mesasge);
		} catch (NotConnectedException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	public void setRecepient(String recepient) {
		this.recepient = recepient;
	}
	public void logout(){
		con.disconnect();
	}
	
	public List<ChatMessage> add(ChatMessage s){
		user.add(s);
		return user;
	}
	
}
