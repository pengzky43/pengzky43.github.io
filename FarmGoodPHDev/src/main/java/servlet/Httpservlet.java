package servlet; // package servlet

import java.io.*; // import java.io.* "*" means all
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet; // import servlet.annotations.WebServlet
import javax.servlet.http.*; // import http servlet
import table.*; // import table
import dao.Dao; // import Dao
import jcon.Connector; // import JDBC Connector using Class Connector
import javax.servlet.http.HttpServlet; // 
import java.sql.*; // import sql class for sql query
import chat.ChatMethod;
import crypt.*;

@SuppressWarnings("serial") // SuppressWarnings in serial
@WebServlet("/Httpservlet") // WebServlet for submitting forms in jsp
public class Httpservlet extends HttpServlet { // declare Httpservlet extends as HttpServlet
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		String email = null;
		String lname = null;
		String fname = null;
		String mname = null;
		String username = null;
		String password = null;
		String bday = null;
		String age = null;
		String gender = null;
		String phone = null;
		String pa = null;
		String ca = null;
		String city = null;
		String state = null;
		String zip = null;
		String tags = null;
		int type = 0;
		String search = null;
		String url = "/index.jsp"; // default url
		String action = request.getParameter("action"); // getParameter for input type hidden "action"
		try {
			email = request.getParameter("email");
			lname = request.getParameter("lname");
			fname = request.getParameter("fname");
			mname = request.getParameter("mname");
			username = request.getParameter("uname");
			password = request.getParameter("pass");
			bday = request.getParameter("bday");
			age = request.getParameter("age");
			gender = request.getParameter("gender");
			phone = request.getParameter("phone");
			pa = request.getParameter("pa");
			ca = request.getParameter("ca");
			city = request.getParameter("city");
			state = request.getParameter("state");
			zip = request.getParameter("zip");
			if(request.getParameter("type") == null) {
				type = 0;
			}
			else {
				type = Integer.parseInt(request.getParameter("type"));
			}
			tags = request.getParameter("tag");
			search = request.getParameter("search");
		}catch(Exception e) {e.printStackTrace();}
		if (action == null) {
		action = "join"; // default action
		}
		// perform action and set URL to appropriate page
		if (action.equals("join")) {
		url = "/loginsignup.jsp";
		}
		if(action.equals("Search")){
			try{
				List<Items> list = new ArrayList<Items>();
				list = Dao.search(search);
				request.setAttribute("items", list);
				url = "/search.jsp";
			}catch(Exception e){e.printStackTrace();}
		}
		if(action.equals("CatSearch")){
			try{
				List<Items> list = new ArrayList<Items>();
				list = Dao.searchCat(tags);
				request.setAttribute("items", list);
				url = "/search.jsp";
			}catch(Exception e){e.printStackTrace();}
		}
		if (action.equals("add")) { // if action = add, this will be used for inserting values in sql database
		// get parameters from the request

		try{
			List<User> list = Dao.signUp(username, password, email);
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			session.setAttribute("keyuid", password);
			request.setAttribute("signedIn", "yes");
		}
		catch(Exception e){ // error log, catch error
			e.printStackTrace(); // print error into console and web browser
		}
		// store data in User object
		User user = new User(email, lname, fname, mname, username, password, bday, age, gender, phone, pa, ca, city, state, zip, type);
		// validate the parameters
		String message;
		if (email == null || username == null || password == null ||
		username.isEmpty() || password.isEmpty()) {
		message = "Please fill out all the text boxes.";
		url = "/loginsignup.jsp";
		}
		else {
		message = null;
		url = "/account.jsp";
		Dao.insert(user);
		}
		request.setAttribute("user", user);
		request.setAttribute("message", message);
		}
		if(action.equals("login")) {
			username = request.getParameter("uname");
			password = request.getParameter("pass");
			String user = null;
			String pass = null;
			int ID = 0;
			PrintWriter out = response.getWriter();
			ResultSet rs = null;
			try {
				Connection con = Connector.getConnection();
				String query = "select UserID, username, password from farmuser where username=?";
				PreparedStatement pssst = con.prepareStatement(query);
				pssst.setString(1, username);
				rs = pssst.executeQuery();
				while(rs.next()) {
					ID = rs.getInt("UserID");
					user = rs.getString("username");
					pass = rs.getString("password");
					//System.out.print(user + " " + pass);
				}
				if(PassCrypt.verifyHash(password, pass)) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					session.setAttribute("keyuid", pass);
					session.setAttribute("ID", ID);
					request.setAttribute("signedIn", "yes");
					url = "/account.jsp";
				}
				else {
					url = "/loginsignup.jsp?";
					/*
					 * for sending an alert message along with the index.jsp */
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Incorrect Username or Password. Check Again.');");
					out.println("location='loginsignup.jsp';");
					out.println("</script>");
				}
				con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		if(action.equals("send")) {
			url="/chat.jsp";
		}
		
		getServletContext()
		.getRequestDispatcher(url)
		.forward(request, response);
		}
		@Override
		protected void doGet(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request, response);
		}
		
		
	}

