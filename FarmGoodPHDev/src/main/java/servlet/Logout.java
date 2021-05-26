package servlet;

import java.io.*; // import java.io.* "*" means all
import javax.servlet.*; // import servlet Classes
import javax.servlet.annotation.WebServlet; // import servlet.annotations.WebServlet
// 
import javax.servlet.http.*; // import http servlet
import table.User; // import table
import dao.Dao; // import Dao
import jcon.Connector; // import JDBC Connector using Class Connector

import java.sql.*; // import sql class for sql query


@WebServlet("/Logout")
public class Logout extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   String url = "/account.jsp";
	   ResultSet rs = null;
	   String action = request.getParameter("action");
	   String username = request.getParameter("username");
	   String email = request.getParameter("email");
	   String password = request.getParameter("password");
	   String fname = request.getParameter("fname");
	   String lname = request.getParameter("mname");
	   String mname = request.getParameter("mname");
	   String age = request.getParameter("age");
	   String gender = request.getParameter("gender");
	   String bday = request.getParameter("bday");
	   String phone = request.getParameter("phone");
	   String pa = request.getParameter("pa");
	   String ca = request.getParameter("ca");
	   String city = request.getParameter("city");
	   String state = request.getParameter("state");
	   String zip = request.getParameter("zip");
	   String username1 = request.getParameter("username1");
	   String password1 = request.getParameter("password1");
	   String provider = request.getParameter("provider");
	   String location = request.getParameter("location");
	   String ahead = request.getParameter("Ahead");
	   String status = "Pending";
	   if("delete".equals(action)) {
		   try {
			   Connection con = Connector.getConnection();
			   String delete = "delete from farmuser where" + " username=? and password=?";
			   PreparedStatement st = con.prepareStatement(delete);
			   st.setString(1, username);
			   st.setString(2, password);
			   st.execute();
			   con.close();
			   PrintWriter out = response.getWriter();
			   
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert(\"Account deleted Successfully!\");");
			   out.println("location='index.jsp'");
			   out.println("</script>");
		   }catch(Exception e) {e.printStackTrace();}
	   }
	   if("logout".equals(action)) {
	   HttpSession session = request.getSession();
	   session.invalidate();
	   response.sendRedirect("index.jsp?logout="+"true");
	   return;}
	   if("book".equals(action)) {
		   try {
			   Connection con = Connector.getConnection();
			   String query = "insert into dbook(username, password, provider, location, ahead, status)" + " values(?, ?, ?, ?, ?, ?)";
			   PreparedStatement st = con.prepareStatement(query);
			   st.setString(1, username);
			   st.setString(2, password);
			   st.setString(3, provider);
			   st.setString(4, location);
			   st.setString(5, ahead);
			   st.setString(6, status);
			   st.execute();
			   con.close();
			   PrintWriter out = response.getWriter();
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert(\"Booked Successfully!\");");
			   out.println("location='account.jsp'");
			   out.println("</script>");
		   }catch(Exception e) {e.printStackTrace();}
	   }
	   if("update".equals(action)) {
		   try {
		   Connection con = Connector.getConnection();
		   String query = "update farmuser" +" set username=?, email=?, password=?, fname=?, lname=?, mname=?, age=?, gender=?, bday=?, phone=?, pa=?, ca=?, city=?, state=?, zip=?" + " where username=? and password=?";
		   PreparedStatement st = con.prepareStatement(query);
		   st.setString(1, username);
		   st.setString(2, email);
		   st.setString(3, password);
		   st.setString(4, fname);
		   st.setString(5, lname);
		   st.setString(6, mname);
		   st.setString(7, age);
		   st.setString(8, gender);
		   st.setString(9, bday);
		   st.setString(10, phone);
		   st.setString(11, pa);
		   st.setString(12, ca);
		   st.setString(13, city);
		   st.setString(14, state);
		   st.setString(15, zip);
		   st.setString(16, username1);
		   st.setString(17, password1);
		  st.execute();
		  String query1 = "select * from farmuser where username=? and password=?";
		  PreparedStatement stmt = con.prepareStatement(query1);
		  stmt.setString(1, username);
		  stmt.setString(1, password);
		  rs = stmt.executeQuery();
		  String user = String.valueOf(rs.getString(1));
		  String pass = String.valueOf(rs.getString(3));
		  HttpSession session = request.getSession();
		  session.setAttribute("user", user);
		  session.setAttribute("key", pass);
		  session.setAttribute("phone", phone);
		  getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
		   }catch(Exception e) {e.printStackTrace();}
	   }
   }
   @Override
   protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
			}
}
