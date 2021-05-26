package servlet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import jcon.*;
import dao.*;
import table.*;
/**
* Servlet implementation class upload
*/
@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class Upload extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Connection con = Connector.getConnection();
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws
	ServletException, IOException {
		// gets values of text fields
		String fullname = request.getParameter("fullname");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String email = request.getParameter("email");
		String cnum = request.getParameter("cnum");
		
		InputStream inputStream = null; // input stream of the upload file
		
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			
		}
		String message = null; // message will be sent back to client
		
		try {
			// constructs SQL statement
			String sql = "INSERT INTO student (fullname,country,state,city,email,cnum,photo) values (?,?,?,?,?,?,?)";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, fullname);
			statement.setString(2, country);
			statement.setString(3, state);
			statement.setString(4, city);
			statement.setString(5, email);
			statement.setString(6, cnum);
			
			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(7, inputStream);
			}
			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "File uploaded and saved into database";
				}
			} catch (SQLException ex) {
				message = "ERROR: " + ex.getMessage();
				ex.printStackTrace();
				} finally {}
		// sets the message in request scope
		request.setAttribute("Message", message);
		
		// forwards to the message page
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}
}
