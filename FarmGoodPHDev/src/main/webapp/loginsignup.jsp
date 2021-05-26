<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.User, table.Items, java.util.*, javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>

<%
 GregorianCalendar currentDate = new GregorianCalendar();
 int currentYear = currentDate.get(Calendar.YEAR);
%>
<%!String aa = "";%>

<%
String aa = String.valueOf(session.getAttribute("user"));
Object p = session.getAttribute("keyuid");
String pp = String.valueOf(p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FarmGood PH</title>
	<link rel="shortcut icon" href="FarmGoodPHLogo.png"/>
	<link rel="stylesheet" type="text/css" href="design.css">
	<script>
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')
})
	</script>
  
	<script>
		$("#nav ul li a[href^='#']").on('click', function(e) {
			// prevent default anchor click behavior
			e.preventDefault();

			// store hash
			var hash = this.hash;

			// animate
			$('html, body').animate({
				scrollTop: $(hash).offset().top
	     	}, 300, function(){

	       	// when done, add hash to url
	       	// (default click behaviour)
				window.location.hash = hash;
	     	});
		});
	</script>
  
	<script type="text/javascript">
    	function same() {
      		if(document.getElementById('gridCheck').checked)
        	document.getElementById('inputAddress2').value=document.getElementById('inputAddress').value;
      	else
        	document.getElementById('inputAddress2').value = null;
    	}
	</script>
  
	<script src="Designs\js\jquery-3.3.1.slim.min.js"></script>
	<script src="Designs\js\bootstrap.min.js"></script>
	<script src="Designs\js\popper.min.js"></script>
	<script src="script.js"></script>
</head>
<body>
<jsp:include page="/load.jsp"></jsp:include>
<div class="hero">
	<div class= "form-box">
		<div class="button-box">
			<div id="btn"></div>
    			<button type="button" class="toggle-btn" onclick="login()">Login</button>
    			<button type="button" class="toggle-btn" onclick="signup()">Signup</button>
    	</div>
    	
    	<div class="social-icons">
    		<a href="https://www.facebook.com"><img src="fb.png" alt="Facebook"></a>
    		<a href="https://www.twitter.com"><img src="tw.png" alt="Twitter" ></a>
    		<a href="https://www.Google.com"><img src="gp.png" alt="Google"></a>
    	</div>
    	
    <form id="login" action="Httpservlet" method="post" class="input-group">
    	<input type=hidden name="action" value="login">
    	<input type="hidden" name="type" value="0">
    	<input type="text" class="input-field" placeholder="Username" id="uname" name = "uname" required>
    	<input type="password" class="input-field" placeholder="Password" id ="pass" name="pass" required>
    	<input type="checkbox" class="chech-box" value="isRememberMe" id="rememberMe"><span>Remember Password</span>
    		<button type="submit" class="submit-btn" onclick="IsRememberMe()">Login</button>
    </form>
    
    <form id="signup" class ="input-group" action="Httpservlet" method="post">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="type" value="0"/>
    	<input type="text" class="input-field" name ="uname" placeholder="Usermame" required>
    	<input type="email" class="input-field" name="email" placeholder="Email" required>
    	<input type="password" class="input-field" name="pass" placeholder="Password" required>
    	<input type="password" class="input-field" name="pass2" placeholder="Password" required>
    	<input type="checkbox" class="chech-box"><span>I agree to the Terms and Conditions</span>
    		<button type="submit" class="submit-btn">Signup</button>
    </form>
    
    </div>
</div>
<script>
var x = document.getElementById("login");
var y = document.getElementById("signup");
var z = document.getElementById("btn");

function signup(){
	x.style.left = "-400px";
	y.style.left = "50px";
	z.style.left = "110px";
}

function login(){
	x.style.left = "50px";
	y.style.left = "450px";
	z.style.left = "0px";
}
</script>

</body>
</html>