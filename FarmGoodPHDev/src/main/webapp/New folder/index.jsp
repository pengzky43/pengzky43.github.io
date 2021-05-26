<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.*, java.util.*, javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.GregorianCalendar, java.util.Calendar" %>
<%
 GregorianCalendar currentDate = new GregorianCalendar();
 int currentYear = currentDate.get(Calendar.YEAR);
%>
<!DOCTYPE html>
<html>
<head>
<%!
String aa = "";
%>
<%
String aa = String.valueOf(session.getAttribute("user"));
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Doctor's Online Appointment</title>
  <link rel="stylesheet" type="text/css" href="Albert\css\bootstrap.css">
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" type="text/css" href="Albert\css\all.css">
  <link rel="shortcut icon" href="favicon.ico" />
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
  <script src="Albert\js\jquery-3.3.1.slim.min.js"></script>
  <script src="Albert\js\bootstrap.min.js"></script>
  <script src="Albert\js\popper.min.js"></script>
  
</head>
<body style="background-color: rgb(255,255,255)">
   <input type="hidden" name="nickname" value="<%= aa%>"/>
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #e3f2fd;">
    <button class="navbar-toggler navbar-toggler-right collapsed" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand mr-2" href="index.jsp"><img src="logo.png" height="35px" width="35px" style="float: left;"/></a>
    <a class="navbar-brand" href="index.jsp">Doctor's Online Appointment</a>
    <div class="navbar-collapse collapse" id="navbarColor03" style="">
      <ul class="navbar-nav mr-auto" style="">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="account.jsp">Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#Aboutus">About Us</a>
          <li class="nav-item">
            <a class="nav-link btn btn-link" id="terms" data-toggle="modal" data-target="#exampleModal3">Terms & Conditions</a>
          </li>
        </ul>
        <form class="form-inline" action="Logout" method="post">
        <div id="welcomeu" style="display: none; float: right;">
        <span id="welcomeu">Welcome, <%= aa%></span>
        </div>
         <div  id="Sign-In">
         New Here?
          <button type="button" class="btn btn-link" id="Sign-In" data-toggle="modal" data-target="#exampleModal">
            Sign Up
          </button>
          <button type="button" class="btn btn-primary" id="Sign-In" data-toggle="modal" data-target="#exampleModal1">
            Sign In
          </button>
          </div>
          <div id="Sign-Out" style="display: none;">
          <input type="hidden" name="action" value="logout"/>
        <button type="submit" class="btn btn-warning" style="display: inherit;">Sign Out</button>
          </div>
        </form>
      </div>
    </nav>
<!-- Button trigger modal  -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sign Up for Free!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <script type="text/javascript">
      var i = "<%= aa%>";
      if(i!="null"){
        	document.getElementById("Sign-In").style.display = "none";
        	document.getElementById("Sign-Out").style.display = "block";
        	document.getElementById("nicknames").style.display = "block";
        	document.getElementById("nickname").style.display = "block";
        	document.getElementById("Sign-up").innerHTML = "New Here?";
        	document.getElementById("welcomeu").style.display = "block"
        	alert("Welcome, "+ i);}
      else{
    	  document.getElementbyId("Sign-In").style.display = "block";
    	  document.getElementbyId("Sign-Out").style.display = "none";
    	  document.getElementbyId("nicknames").style.display = "none";
    	  document.getElementbyId("nickname").style.display = "none";
    	  document.getElementbyId("welcomeu").style.display = "none";}
        </script>
      <form action="Httpservlet" method="post">
        <input type="hidden" name="action" value="add">
      <div class="modal-body">
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputfName4">First Name</label>
              <input type="text" class="form-control" name="fname" id="inputfName4" placeholder="First Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputlName4">Last Name</label>
              <input type="text" class="form-control" name="lname" id="inputlName4" placeholder="Last Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputmName4">Middle Name</label>
              <input type="text" class="form-control" name="mname" id="inputmName4" placeholder="Middle Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputEmail4">Email</label>
              <input type="email" class="form-control" name="email" id="inputEmail4" placeholder="Email" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputUsername4">Username</label>
              <input type="text" class="form-control" name="username" id="inputUsername4" placeholder="Username"required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Password</label>
              <input type="password" class="form-control" name="password" id="inputPassword4" placeholder="Password"required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputbDate4">Birth Date</label>
              <input type="date" class="form-control" name="bday" id="dob" onblur="checkAge()" placeholder="MM/DD/YYYY"required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputAge4">Age</label>
              <input type="text" class="form-control" readonly name="age" id="age" placeholder="Enter Age" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputGender4">Gender</label>
              <select id="inputGender4" class="form-control" name="gender" required>
              <option value="Male" selected>Male</option>
              <option value="Female">Female</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="inputAddress">Permanent Address</label>
            <input type="text" class="form-control" id="inputAddress" name="pa" placeholder="12 Main St, CAB Subd., Brgy. XYZ, Example City, State" required>
          </div>
         
          <div class="form-group">
            <label for="inputAddress2">Current Address</label>
            <input type="text" class="form-control" id="inputAddress2" name="ca" placeholder="12 Main St, CAB Subd., Brgy. XYZ, Example City, State" required>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" onclick="same(checked)" name="filladdress" id="gridCheck">
            <label class="form-check-label" for="gridCheck" onclick="document.getElementById('gridCheck').checked">
              Same as Permanent Address
            </label>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputCity">City</label>
              <input type="text" class="form-control" name="city" id="inputCity" placeholder="Las Pinas City" required>
            </div>
            <div class="form-group col-md-4">
              <label for="inputState">State</label>
              <input type="text" class="form-control" name="state" placeholder="Manila" id="inputState" required>
            </div>
            <div class="form-group col-md-2">
              <label for="inputZip">Zip Code</label>
              <input type="text" class="form-control" name="zip" placeholder="1747" id="inputZip"required>
            </div>
            <div class="form-check">
            <input class="form-check-input1" type="checkbox" name="agree" id="gridCheck1">
            <label class="form-check-label1" for="gridCheck1">
              <span class="form-inline">I Have Read the<a class="btn btn-link text-primary" id="terms" data-toggle="modal" data-target="#exampleModal3">Terms & Conditions</a></span>
            </label>
      </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Sign Up</button>
      </div>
    </form>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Login:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Httpservlet" method="post">
      <input type=hidden name="action" value="login">
      <div class="modal-body">
        <!--Contents are Here Senpaikazu-->
          <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
              <div class="input-group-text">@</div>
            </div>
            <input type="text" class="form-control" id="inlineFormInputGroupUsername2" name="uname" placeholder="Username" required>
          </div>
          <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
              <div class="input-group-text"><i class="fal fa-key"></i></div>
              </div>
              <label class="sr-only" for="inlineFormInputName2">Password</label>
              <input type="password" class="form-control" id="inlineFormInputName2" name="pass" placeholder="Password" required>
        </div>
          <label class="sr-only" for="inlineFormInputGroupUsername2">Password</label>
          <div class="form-check mb-2 mr-sm-2">
            <input class="form-check-input" type="checkbox" id="inlineFormCheck">
            <label class="form-check-label" for="inlineFormCheck">
              Remember me
            </label>
          </div>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Log In</button>
      </div>
    </form>
    </div>
  </div>
</div>
<form action="">
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Terms & Conditions</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body overflow-auto">
      Terms of Service - Clinics
      <div class="form-inline">Hi there, I am DOA System and these are our Terms of Service. They form a contract between you (and your clinic) and us, so please read them carefully before using or accessing the DOA platform and its functionalities. Because we actually want you to read these Terms, we've included some explanations, While we hope they will help you to identify some key points, they don't technically form part of the Terms - so please don't rely on them instead of reading the Terms in full. Feel free to contact us if you have any questions or feedback about these Terms.</div>
      <div class="form-inline">
      <h4>1. Background</h4>
      <div>1.1 We provides the DOA online platform that enables Clinics to manage medical appointment bookings, communicate with their Patients, and utilise other related functionalities (the Platform).</div>
	  <div>1.2 In these Terms, a reference to You or Your is a reference to a Clinic or a Clinic User of the Platform, as applicable.</div>
	   <div>1.3 We may amend these Terms at any time by publishing the amended version on Our website or by otherwise providing written notice to You. Any such amended version will apply to Your Use of the Platform from the date of its publication or Our written notice to you.</div>
      </div>
      <div class="form-inline">
      <h4>2. Conditions</h4>
      <div>2.1 We have the rights to remove your account for any misuse or abuse of our system.</div>
	  <div>2.2 The DOA System will give you 3 chances in case of cancelling your order. then after reaching the maximum threshold, we have the right to remove your account accordingly.</div>
	   <div>2.3 For your protection and unbiased terms we will give each of a user a chance to explain every cancellation created and will be evaluated of our administration.</div>
      </div>
      <div class="form-inline">
      <h4>3. Account Management</h4>
      <div>3.1 You Acknowledge that, (a) inorder to access our DOA System, You must Sign up an account (b)We may set registration requirements, On our sole discretion.</div>
	  <div>3.2 You are held responsible for negligence of your own account, for correctly setting up your account, and any information about you.</div>
	   <div>3.3 You are held responsible for any incorrect information and appropriate measures will be done.</div>
      </div>
      <div class="form-inline">
      <h4>4. Data Privacy</h4>
      <div>4.1 Any information and details about your health will be disclose to anyone in our DOA System. You have the sole rights of spreading such information.</div>
	  <div>4.2 The DOA System will provide a user-login authentication for securing your account and transaction in our system.</div>
	   <div>4.3 You are solely responsible for the security of Your login details for accessing the Platform; and You will notify Us immediately if You become aware of any unauthorised access to the Platform</div>
      </div>
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-primary" data-dismiss="modal" aria-label="Close">
      Ok
        </button>
      </div>
    </div>
  </div>
</div>
</form>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="1.jpg"
        alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="2.jpg"
        alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="3.jpg"
        alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div id="carouselExampleFade1" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">       
    <div class="jumbotron d-block w-100" alt="First Slide" id="jumbo" style="margin-bottom: 0!important; background-size: cover!important; background-repeat: no-repeat; background: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) ), url('research.jpg');">
  <h1 class="display-3" style="color: white; font-family: customfonts;">Intense Passion in searching for Solution.</h1>
  <p class="lead" style="color: white; font-family: customfonts;">Our pharmaceutical research team strive to find solutions in mitigating life-threatening diseases.</p>
  <hr class="my-2" style="color: white; font-family: customfonts;">
  <p style="color: white; font-family: customfonts;">Because you are our Passion in Saving Lives.</p>
  <p class="lead">
    <button class="close" href="#!" role="button" style="color: white; float: right;"><span>
      >
      </span></button>
  </p>
</div>
    </div>
    <div class="carousel-item">
      <div class="jumbotron d-block w-100" alt="Second Slide" id="jumbo" style="margin-bottom: 0!important; background-size: cover!important; background-repeat: no-repeat; background: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('smile.jpg');">
  <h1 class="display-3" style="color: white; font-family: customfonts;">Intense Passion in searching for Solution.</h1>
  <p class="lead" style="color: white; font-family: customfonts;">Our pharmaceutical research team strive to find solutions in mitigating life-threatening diseases.</p>
  <hr class="my-2" style="color: white; font-family: customfonts;">
  <p style="color: white; font-family: customfonts;">See our Passion in Saving Lives.</p>
  <p class="lead">
    <button class="close" href="#!" role="button" style="color: white; float: right;"><span>
      >
      </span></button>
  </p>
</div>
    </div>
    <%
    String uname = String.valueOf((String) (session.getAttribute("user")));
    String pass = String.valueOf((String)(session.getAttribute("keyuid")));
    %>
    <div class="carousel-item">
      <div class="jumbotron d-block w-100" alt="Third Slide" id="jumbo" style="margin-bottom: 0!important; background-size: cover!important; background-repeat: no-repeat; background: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url('smile.jpg');">
  <h1 class="display-3" style="color: white; font-family: customfonts;">Book an Appointment with your Practitioner</h1>
  <form class="form-inline lead" action="Logout" method="post">
  <input type="hidden" name="username" value="<%= uname%>"/>
  <input type="hidden" name="password" value="<%= pass%>"/>
  <input type="hidden" name="date" value="<%= currentDate%>"/>
  <input type="hidden" name="action" value="book"/>
  <div class="input-group mb-2 lead">
  <div class="input-group-prepend">
  <span class="input-group-text"><i class="fas fa-search"></i></span>
  </div>
  <input type="text" class="lead form-control" id="staticEmail2" name="provider" placeholder="Search by provider name"/>
  </div>
  <div class="lead input-group mx-sm-3 mb-2">
  <div class="input-group-prepend">
  <span class="input-group-text"><i class="fas fa-location"></i></span>
  </div>
    <input type="text" class="lead form-control" id="inputPassword2" name="location" placeholder="Suburb or postcode">
  </div>
  <div class="lead input-group mx-sm-3 mb-2">
  <div class="input-group-prepend">
  <span class="input-group-text"><i class="fas fa-date"></i></span>
  </div>
    <input type="date" class="lead form-control" id="inputAhead2" name="Ahead" placeholder="Date Scheduled">
  </div>
  <button type="submit" class="lead btn btn-primary mb-2">Find Now!</button>
</form>
  <hr class="my-2" style="color: white; font-family: customfonts;">
  <p style="color: white; font-family: customfonts;">Booking was never been made easy.</p>
  <p class="lead">
    <button class="close" href="#!" role="button" style="color: white; float: right;"><span>
      >
      </span></button>
  </p>
</div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade1" role="button" data-slide="prev" style="opacity: 0;">
    <span class="carousel-control-prev-icon" aria-hidden="true" style="opacity: 0;"></span>
    <span class="sr-only" style="opacity: 0;">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade1" role="button" data-slide="next" style="opacity: 0;">
    <span class="carousel-control-next-icon" aria-hidden="true" style="opacity: 0;"></span>
    <span class="sr-only" style="opacity: 0;">Next</span>
  </a>
</div>

<div class="jumbotron text-right" id="Aboutus" style="margin-bottom: 0!important; background-color: #1C0D02;">
  <img src="logo.png" width="100px" height="100px"/>
  <p class="lead" style="color: white; font-family: customfonts;">Doctor's Online Appointment System</p>
  <p class="lead" style="color: white; font-family: customfonts; font-size:16px;">
  DOA is a System used for booking your doctor's appointment via  online means. we simplify things for you. All rights Reserve
  </p>
  <hr class="my-2" style="color: white; font-family: customfonts; background-color: white;">
  <p style="color: white; font-family: customfonts;">@2019 DOA Systems Ltd Co.</p>
</div>
<div class="footer fixed-bottom bg-primary text-white">
<p>&copy; Copyright <%= currentYear%> DOA System Ltd Co.</p>
</div>
<script>
date = new Date();
var month = date.getMonth()+1;
var day = date.getDate();
var year = date.getFullYear();
document.getElementById("date").value = month + '/' + day + '/' + year;
</script>
<script>
function checkAge(){
var today = new Date();
var d = document.getElementById("dob").value;
if (!/\d{4}\-\d{2}\-\d{2}/.test(d)) { // check valid format
showMessage();
return false;
}
d = d.split("-");
var byr = parseInt(d[0]);
var nowyear = today.getFullYear();
if ((byr >= nowyear) || (byr < 1900)) { // check valid year
showMessage();
return false;
}
var bmth = parseInt(d[1],10)-1;
if((bmth < 0)||(bmth >11)) {
showMessage();
return false;
}
var bdy = parseInt(d[2],10); // radix 10!
var dim = daysInMonth(bmth+1,byr);
if ((bdy <1 )|| (bdy > dim)) { // check valid date according to month
showMessage();
return false;
}
var age = nowyear - byr;
var nowmonth = today.getMonth();
var nowday = today.getDate();
if (bmth > nowmonth) {age = age - 1} // next birthday not yet reached
else if (bmth == nowmonth && nowday < bdy) {age = age - 1}
alert('You are ' + age + ' years old');
document.getElementById("age").value = age;
document.getElementById("age").focus();
if (age <= 15) {
alert ("You are 15 years old or less!");
document.getElementById("age").value = age;
document.getElementById("age").focus();
}
}
function showMessage() {
if (document.getElementById("dob").value != "") {
alert ("Invalid date format or impossible year/month/day of birth - please re-enter as nowyearYY-MM-DD");
document.getElementById("dob").value = "";
document.getElementById("dob").focus();
}
}
function daysInMonth(month,year) { // months are 1-12
var dd = new Date(year, month, 0);
return dd.getDate();
}
</script>
</body>

</html>