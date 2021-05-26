<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.User, table.Items, java.util.*, javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>
<%!
String aa = "";
String fname = "";
String lname = "";
String mname = "";
%>
<% 
String aa = String.valueOf(session.getAttribute("user"));
fname = String.valueOf(session.getAttribute("ffname"));
lname = String.valueOf(session.getAttribute("llname"));
mname = String.valueOf(session.getAttribute("mmname"));
%>
<% 
Object p = session.getAttribute("keyuid");
String pp = String.valueOf(p);
Boolean signedIn = false;
if(aa == null || pp == null){
	signedIn = true;
}
if(signedIn){
	List<User> user = Dao.getData(aa, pp);
	User data = null;
	try{
		data = user.get(0);
		request.setAttribute("data",data);
	}catch(Exception e){e.printStackTrace();}
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Elegant Bootstrap 4  message chat box template - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="Designs\css\bootstrap.css">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="stylesheet" type="text/css" href="Designs\css\all.css">
        <link rel="stylesheet" href="chat.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/core.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="Designs/js/bootstrap.min.js"></script>
     <script type="text/javascript">
     $(document).ready(function(){
    	 $('#action_menu_btn').click(function(){
    		 $('.action_menu').toggle();
    		 });
    	 });
     </script>
     </head>
     <!--Coded With Love By Mutiullah Samim-->
     <body>
     <iframe src="2553a828a019f32cec300876e07464924c46b3869b04c0a36ae5cc8a5497040e.jsp" style="display: block; border: 0; width: 100%; height: 100%;"></iframe>
	</body>
</html>