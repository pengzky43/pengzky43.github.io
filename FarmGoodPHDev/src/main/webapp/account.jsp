<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.User, table.Items, java.util.*, javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
List<User> user = null;
Boolean flag = false;
if(aa == null || pp == null){
	flag = true;
}
User data = null;
if(flag){
	user = Dao.getData(aa, pp);
	try{
		data = user.get(0);
	}catch(Exception e){e.printStackTrace();}
	request.setAttribute("data",data);
}
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Doctor's Online Appointment</title>
  <link rel="stylesheet" type="text/css" href="Designs\css\bootstrap.css">
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" type="text/css" href="Designs\css\all.css">
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
  <script src="Designs\js\jquery-3.3.1.slim.min.js"></script>
  <script src="Designs\js\bootstrap.min.js"></script>
  <script src="Designs\js\popper.min.js"></script>
  
</head>
<body style="background-color: rgb(255,255,255)">
<jsp:include page="/load.jsp"></jsp:include>
<script>
   var ii = "<%= aa%>";
   if(ii=="null"){
	   alert("Not Yet Signed In");
	   location.href = "index.jsp";
   }
   </script>
   <input type="hidden" name="nickname" value="<%= aa%>"/>
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #e3f2fd;">
    <button class="navbar-toggler navbar-toggler-right collapsed" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand mr-2" href="index.jsp"><img src="FarmGoodPHLogo.png" height="35px" width="35px" style="float: left;"/></a>
    <a class="navbar-brand" href="index.jsp">Doctor's Online Appointment</a>
    <div class="navbar-collapse collapse" id="navbarColor03" style="">
      <ul class="navbar-nav mr-auto" style="">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="account.jsp">Account <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#Aboutus">About Us</a>
          <li class="nav-item">
            <a class="nav-link btn btn-link" id="terms" data-toggle="modal" data-target="#exampleModal3">Terms & Conditions</a>
          </li>
        </ul>
        <form class="form-inline" action="Logout" method="post">
        <div id="welcomeu mr-4" style="display: block; float: left;">
        <div id="welcomeu mr-4" >Welcome, <%= aa%></div>
        <div></div>
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
      <script type="text/javascript">
      var i = "<%= aa%>";
      if(i!=null){
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
      <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">
      Ok
        </button>
      </div>
    </div>
  </div>
</div>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="farmbanana.jpg"
        alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="farmcoconut.jpg"
        alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="farmcorn.jpg"
        alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="farmmango.jpg"
        alt="Fourth slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="farmsugarcane.jpg"
        alt="Fifth slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="farmrice.jpg"
        alt="Sixth slide">
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
<div class="w-100 mt-4 mb-4">

<div class="container marketing mb-4">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4 text-center mt-4">
        <svg height="100px" viewBox="0 0 569 569.54905" width="100px" xmlns="http://www.w3.org/2000/svg"><path d="m1.527344 52.246094 37.984375 66.46875c1.28125 2.246094 3.425781 3.871094 5.933593 4.5l35.4375 8.859375 121.542969 121.542969 13.429688-13.425782-123.445313-123.441406c-1.214844-1.21875-2.738281-2.082031-4.40625-2.5l-34.050781-8.542969-32.339844-56.625 27.726563-27.726562 56.648437 32.371093 8.546875 34.050782c.414063 1.671875 1.28125 3.199218 2.496094 4.414062l123.445312 123.445313 13.425782-13.429688-121.542969-121.542969-8.859375-35.417968c-.628906-2.511719-2.253906-4.660156-4.5-5.945313l-66.472656-37.980469c-3.707032-2.109374-8.371094-1.484374-11.394532 1.527344l-37.980468 37.984375c-3.0546878 3.003907-3.71875 7.675781-1.625 11.414063zm0 0"/><path d="m396.3125 187.144531-208.902344 208.90625-13.429687-13.429687 208.90625-208.902344zm0 0"/><path d="m150.847656 403.441406c-1.71875-2.859375-4.804687-4.605468-8.140625-4.605468h-56.972656c-3.332031 0-6.421875 1.746093-8.136719 4.605468l-28.488281 47.476563c-1.808594 3.007812-1.808594 6.769531 0 9.78125l28.488281 47.476562c1.714844 2.855469 4.804688 4.605469 8.136719 4.605469h56.972656c3.335938 0 6.421875-1.75 8.140625-4.605469l28.484375-47.476562c1.808594-3.011719 1.808594-6.773438 0-9.78125zm-13.511718 90.347656h-46.226563l-22.789063-37.980468 22.789063-37.984375h46.226563l22.789062 37.984375zm0 0"/><path d="m456.0625 227.914062c62.714844.210938 113.730469-50.460937 113.941406-113.175781.03125-9.546875-1.140625-19.054687-3.488281-28.308593-1.265625-5.089844-6.417969-8.1875-11.507813-6.921876-1.671874.417969-3.195312 1.28125-4.414062 2.496094l-59.109375 59.070313-46.898437-15.628907-15.640626-46.886718 59.109376-59.121094c3.707031-3.710938 3.703124-9.722656-.007813-13.429688-1.222656-1.222656-2.761719-2.089843-4.445313-2.503906-60.820312-15.402344-122.605468 21.414063-138.007812 82.230469-2.339844 9.226563-3.507812 18.710937-3.476562 28.230469.023437 7.476562.792968 14.929687 2.308593 22.25l-207.957031 207.953125c-7.320312-1.511719-14.773438-2.28125-22.246094-2.308594-62.933594 0-113.949218 51.015625-113.949218 113.949219 0 62.929687 51.015624 113.945312 113.949218 113.945312 62.929688 0 113.945313-51.015625 113.945313-113.945312-.023438-7.476563-.796875-14.929688-2.308594-22.25l49.785156-49.785156 21.773438 21.773437c3.710937 3.707031 9.71875 3.707031 13.429687 0l4.746094-4.75c4.164062-4.136719 10.894531-4.136719 15.058594 0 4.160156 4.148437 4.167968 10.882813.019531 15.042969-.003906.003906-.011719.011718-.019531.019531l-4.746094 4.746094c-3.707031 3.707031-3.707031 9.71875 0 13.425781l113.273438 113.273438c29.792968 30.066406 78.316406 30.285156 108.382812.492187 30.0625-29.792969 30.28125-78.320313.488281-108.382813-.160156-.164062-.324219-.328124-.488281-.492187l-113.273438-113.269531c-3.707031-3.707032-9.71875-3.707032-13.425781 0l-4.746093 4.746094c-4.167969 4.140624-10.894532 4.140624-15.0625 0-4.15625-4.148438-4.167969-10.882813-.019532-15.039063.007813-.007813.015625-.011719.019532-.019531l4.75-4.75c3.707031-3.707032 3.707031-9.71875 0-13.425782l-21.773438-21.773437 49.785156-49.785156c7.320313 1.511719 14.773438 2.285156 22.246094 2.308593zm37.308594 322.851563c-6.898438-.011719-13.738282-1.257813-20.195313-3.683594l74.160157-74.164062c11.191406 29.769531-3.867188 62.972656-33.636719 74.164062-6.496094 2.441407-13.382813 3.691407-20.328125 3.683594zm-107.574219-246.792969c-10.515625 12.542969-8.867187 31.238282 3.675781 41.75 11.023438 9.238282 27.089844 9.230469 38.101563-.027344l106.5625 106.65625c1.15625 1.160157 2.238281 2.382813 3.285156 3.625l-81.1875 81.1875c-1.246094-1.042968-2.46875-2.125-3.628906-3.285156l-106.644531-106.652344c10.515624-12.542968 8.867187-31.238281-3.675782-41.75-11.023437-9.242187-27.09375-9.230468-38.105468.023438l-15.191407-15.191406 81.613281-81.492188zm38.34375-95.503906-215.410156 215.367188c-2.363281 2.359374-3.3125 5.785156-2.507813 9.023437 13.027344 51.160156-17.886718 103.195313-69.050781 116.21875-51.160156 13.027344-103.195313-17.886719-116.222656-69.050781-13.023438-51.160156 17.890625-103.195313 69.054687-116.222656 15.476563-3.9375 31.691406-3.9375 47.167969 0 3.238281.792968 6.65625-.15625 9.023437-2.503907l215.359376-215.371093c2.359374-2.359376 3.308593-5.785157 2.496093-9.019532-12.9375-50.5625 17.5625-102.039062 68.125-114.980468 9.554688-2.441407 19.4375-3.378907 29.28125-2.765626l-50.089843 50.109376c-2.542969 2.539062-3.433594 6.300781-2.296876 9.710937l18.988282 56.976563c.949218 2.832031 3.175781 5.058593 6.011718 6l56.976563 18.992187c3.40625 1.136719 7.167969.25 9.710937-2.289063l50.089844-50.089843c.113282 1.8125.171875 3.605469.171875 5.390625.265625 52.175781-41.8125 94.6875-93.988281 94.957031-8.066406.039063-16.105469-.953125-23.917969-2.953125-3.238281-.808594-6.664062.136719-9.023437 2.496094h.050781zm0 0"/><path d="m491.273438 477.578125-13.429688 13.429687-94.953125-94.953124 13.425781-13.429688zm0 0"/></svg>
        <h2 class="mt-4">Settings</h2>
        <p class="text-center">Edit Settings</p>
        <p class="text-center"><a class="btn btn-secondary" href="#11" role="button">Edit Settings �</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 text-center mt-4">
        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 width="100px" height="100px" viewBox="0 0 510 510" style="enable-background:new 0 0 510 510;" xml:space="preserve">
<g>
	<g id="account-circle">
		<path d="M255,0C114.75,0,0,114.75,0,255s114.75,255,255,255s255-114.75,255-255S395.25,0,255,0z M255,76.5
			c43.35,0,76.5,33.15,76.5,76.5s-33.15,76.5-76.5,76.5c-43.35,0-76.5-33.15-76.5-76.5S211.65,76.5,255,76.5z M255,438.6
			c-63.75,0-119.85-33.149-153-81.6c0-51,102-79.05,153-79.05S408,306,408,357C374.85,405.45,318.75,438.6,255,438.6z"/>
	</g>
</g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
        <h2 class="mt-4">Account Information</h2>
        <p class="text-center">See your Account Information</p>
        <p class="text-center"><a class="btn btn-secondary" href="#12" role="button">Information �</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4 text-center mt-4">
        <svg height="100px" viewBox="-1 0 480 480.00023" width="100px" xmlns="http://www.w3.org/2000/svg"><path d="m19.765625 282.769531c-1.953125-10.113281-3.203125-20.347656-3.753906-30.632812-.238281-4.417969-4.011719-7.808594-8.433594-7.570313-4.417969.242188-7.804687 4.015625-7.5664062 8.433594.5820312 11.011719 1.9179692 21.972656 4.0000002 32.800781.726562 3.757813 4.011719 6.472657 7.839843 6.480469.511719 0 1.023438-.050781 1.527344-.144531 2.089844-.390625 3.941406-1.601563 5.136719-3.359375 1.199219-1.757813 1.648437-3.917969 1.25-6.007813zm0 0"/><path d="m55.492188 367.519531c-2.515626-3.632812-7.503907-4.539062-11.136719-2.023437-3.632813 2.515625-4.539063 7.503906-2.023438 11.136718 6.285157 9.066407 13.183594 17.691407 20.65625 25.808594 2.988281 3.253906 8.050781 3.46875 11.304688.480469 3.253906-2.992187 3.46875-8.050781.480469-11.304687-6.972657-7.582032-13.414063-15.632813-19.28125-24.097657zm0 0"/><path d="m7.835938 228.558594c.222656.015625.441406.015625.664062 0 4.175781.015625 7.65625-3.183594 8-7.34375.839844-10.265625 2.398438-20.460938 4.65625-30.511719.96875-4.316406-1.75-8.601563-6.070312-9.570313-4.316407-.96875-8.601563 1.75-9.570313 6.066407-2.429687 10.78125-4.109375 21.71875-5.03125 32.730469-.175781 2.121093.503906 4.222656 1.882813 5.84375 1.378906 1.617187 3.347656 2.621093 5.46875 2.785156zm0 0"/><path d="m122.285156 430.824219c-8.773437-5.40625-17.160156-11.414063-25.105468-17.976563-3.40625-2.8125-8.449219-2.332031-11.265626 1.074219-2.8125 3.40625-2.332031 8.449219 1.074219 11.261719 8.515625 7.023437 17.496094 13.457031 26.886719 19.257812 2.433594 1.628906 5.5625 1.800782 8.15625.445313 2.597656-1.355469 4.246094-4.019531 4.296875-6.949219.050781-2.925781-1.5-5.648438-4.042969-7.097656zm0 0"/><path d="m19.636719 165.824219c.898437.335937 1.851562.511719 2.816406.511719 3.332031 0 6.3125-2.066407 7.488281-5.183594 2.699219-7.207032 5.777344-14.269532 9.222656-21.152344 1.933594-3.945312.324219-8.710938-3.609374-10.675781-3.929688-1.964844-8.707032-.390625-10.703126 3.523437-3.683593 7.382813-6.988281 14.949219-9.894531 22.671875-1.554687 4.136719.539063 8.753907 4.679688 10.304688zm0 0"/><path d="m27.683594 312.585938c-1.429688-4.183594-5.980469-6.414063-10.164063-4.980469-4.183593 1.429687-6.410156 5.980469-4.980469 10.164062 3.589844 10.4375 7.890626 20.621094 12.871094 30.472657 2.050782 3.835937 6.789063 5.332031 10.671875 3.367187 3.878907-1.964844 5.480469-6.667969 3.601563-10.59375-4.648438-9.1875-8.660156-18.6875-12-28.429687zm0 0"/><path d="m178.683594 455.601562c-9.914063-2.792968-19.621094-6.265624-29.054688-10.402343-4.015625-1.605469-8.578125.265625-10.308594 4.226562-1.730468 3.960938 0 8.578125 3.90625 10.429688 10.117188 4.441406 20.523438 8.183593 31.152344 11.199219.710938.199218 1.441406.300781 2.175782.304687 4 .007813 7.390624-2.941406 7.9375-6.90625.546874-3.960937-1.917969-7.71875-5.769532-8.796875zm0 0"/><path d="m45.585938 307.265625c1.683593 4.085937 6.359374 6.035156 10.445312 4.355469 4.085938-1.683594 6.039062-6.359375 4.355469-10.445313-3.90625-9.441406-7-19.203125-9.238281-29.175781-.957032-4.316406-5.230469-7.039062-9.546876-6.082031-4.320312.953125-7.042968 5.230469-6.085937 9.546875 2.445313 10.867187 5.816406 21.503906 10.070313 31.800781zm0 0"/><path d="m47.035156 186.65625c.777344.242188 1.585938.367188 2.402344.367188 3.492188 0 6.582031-2.265626 7.628906-5.597657 3.058594-9.777343 6.890625-19.292969 11.464844-28.457031 1.988281-3.949219.398438-8.761719-3.546875-10.75-3.949219-1.988281-8.761719-.398438-10.75 3.550781-4.957031 9.929688-9.113281 20.238281-12.429687 30.832031-.644532 2.027344-.453126 4.226563.527343 6.113282.980469 1.886718 2.675781 3.304687 4.703125 3.941406zm0 0"/><path d="m47.683594 241.640625v-1.535156c.128906-9.625.929687-19.226563 2.398437-28.738281.492188-2.851563-.597656-5.746094-2.847656-7.566407-2.25-1.824219-5.308594-2.289062-8-1.214843-2.6875 1.070312-4.585937 3.511718-4.964844 6.382812-1.582031 10.234375-2.445312 20.566406-2.585937 30.917969v2.128906c.007812 2.105469.855468 4.117187 2.359375 5.585937 1.507812 1.46875 3.539062 2.273438 5.640625 2.230469 4.457031-.085937 8.019531-3.734375 8-8.191406zm0 0"/><path d="m136.355469 396.679688c-8.351563-6.023438-16.277344-12.621094-23.710938-19.742188-3.207031-2.933594-8.167969-2.769531-11.175781.371094-3.003906 3.136718-2.957031 8.101562.109375 11.179687 7.972656 7.648438 16.472656 14.726563 25.433594 21.183594 3.585937 2.582031 8.585937 1.765625 11.167969-1.824219 2.582031-3.585937 1.765624-8.585937-1.824219-11.167968zm0 0"/><path d="m190.882812 424.382812c-9.746093-3.078124-19.214843-6.96875-28.3125-11.628906-3.933593-2.011718-8.753906-.453125-10.761718 3.480469-2.011719 3.9375-.453125 8.753906 3.484375 10.765625 9.894531 5.066406 20.199219 9.296875 30.796875 12.648438 4.21875 1.324218 8.707031-1.015626 10.035156-5.230469 1.324219-4.214844-1.019531-8.707031-5.234375-10.035157zm0 0"/><path d="m90.539062 365.34375c3.453126-2.753906 4.023438-7.785156 1.273438-11.238281-6.4375-8.058594-12.316406-16.546875-17.601562-25.402344-1.386719-2.597656-4.09375-4.222656-7.042969-4.230469-2.945313-.003906-5.660157 1.613282-7.054688 4.207032-1.398437 2.597656-1.257812 5.75.371094 8.207031 5.652344 9.480469 11.941406 18.570312 18.824219 27.203125 2.753906 3.457031 7.792968 4.023437 11.246094 1.261718zm0 0"/><path d="m239.683594 0c-45.917969-.0742188-90.886719 13.078125-129.527344 37.886719l-32.59375-35.308594c-2.101562-2.28125-5.332031-3.136719-8.289062-2.203125-2.957032.9375-5.105469 3.496094-5.519532 6.570312l-16 120c-.328125 2.480469.523438 4.972657 2.296875 6.734376 1.777344 1.761718 4.277344 2.589843 6.753907 2.242187l112-16c2.9375-.425781 5.402343-2.445313 6.394531-5.242187.996093-2.800782.355469-5.921876-1.660157-8.101563l-30.128906-32.632813c69.871094-40.554687 157.648438-33.035156 219.601563 18.808594s84.828125 136.921875 57.226562 212.84375c-27.597656 75.921875-99.769531 126.449219-180.554687 126.402344h-.097656c-6.316407 0-12.628907-.386719-18.902344-1.152344-4.386719-.53125-8.375 2.597656-8.902344 6.984375-.53125 4.386719 2.59375 8.375 6.984375 8.902344 6.898437.839844 13.847656 1.261719 20.796875 1.265625h.121094c88.789062.070312 167.835937-56.230469 196.792968-140.164062 28.957032-83.9375 1.441407-177-68.507812-231.691407-69.945312-54.691406-166.898438-58.953125-241.371094-10.609375-1.972656 1.289063-3.277344 3.378906-3.570312 5.714844-.289063 2.339844.464844 4.683594 2.0625 6.414062l26.402344 28.578126-86.480469 12.367187 12.351562-92.65625 25.601563 27.792969c2.691406 2.921875 7.121094 3.425781 10.398437 1.183594 79.488281-54.199219 184.703125-51.589844 261.40625 6.484374 76.699219 58.070313 107.753907 158.636719 77.148438 249.84375-30.601563 91.207032-116.027344 152.6875-212.234375 152.742188-10.300782.003906-20.585938-.699219-30.792969-2.09375-4.332031-.527344-8.289063 2.523438-8.882813 6.847656-.597656 4.324219 2.386719 8.332032 6.699219 9 88.808594 12.238282 177.03125-26.035156 228.769531-99.246094 51.738282-73.207031 58.359376-169.148437 17.171876-248.773437s-123.320313-129.65625-212.964844-129.734375zm0 0"/><path d="m239.683594 88c-4.417969 0-8 3.582031-8 8v144c0 2.121094.84375 4.15625 2.34375 5.65625l80 80c3.140625 3.03125 8.128906 2.988281 11.214844-.097656 3.085937-3.085938 3.128906-8.074219.097656-11.214844l-77.65625-77.65625v-140.6875c0-4.417969-3.582032-8-8-8zm0 0"/></svg>
        <h2 class="mt-4">Transaction History</h2>
        <p class="text-center">See Latest Transactions.</p>
        <p class="text-center"><a class="btn btn-secondary" href="#13" role="button">View details �</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette" id="11">
      <div class="col-md-7" >
        <h2 class="featurette-heading">Settings <span class="text-muted">Edit Your Settings Here</span></h2>
        
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" id="12">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Account Information.<span class="text-muted">Edit your Account information here.</span></h2>
<a class="btn btn-secondary" href="#12" role="button" data-target="#exampleModal5" data-toggle="modal">Information �</a>
<form action="Logout" method="post">
<input type="hidden" name="action" value="getdata"/>
</form>
<div class="modal fade" id="exampleModal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Your Account Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="Logout" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="username1" value='<%= aa%>'/>
        <input type="hidden" name="password1" value='<%= pp%>'/>
      <div class="modal-body">
          <div class="form-row">
            <div class="form-group col-md-6">
            
              <label for="inputfName4">First Name</label>
              <input type="text" class="form-control" readonly name="fname" id="inputfName4" value="${data.getFname()}" placeholder="First Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputlName4">Last Name</label>
              <input type="text" class="form-control" name="lname" readonly id="inputlName4" value="${data.getLname()}" placeholder="Last Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputmName4">Middle Name</label>
              <input type="text" class="form-control" name="mname" readonly id="inputmName4" value="${data.getMname()}" placeholder="Middle Name" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputEmail4">Email</label>
              <input type="email" class="form-control" name="email" id="inputEmail4" value="${data.getEmail()}" placeholder="Email" required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputUsername4">Username</label>
              <input type="text" class="form-control" name="username" id="inputUsername4" value="${data.getUsername()}" placeholder="Username"required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Password</label>
              <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password"required>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Re-Enter Password</label>
              <input type="password" class="form-control" name="password1" onkeyup="onpass()" id="inputPassword4" placeholder="Password"required><span id="status"></span>
            </div>
            <div class="form-group col-md-6">
              <label for="inputbDate4">Birth Date</label>
              <input type="date" class="form-control"  onblur="checkAge()" name="bday" id="dob" value="${data.getBday()}" placeholder="MM/DD/YYYY" required>
            </div>
            <script>function onpass(){
            if(document.getElementById("inputPassword3").value != document.getElementById("inputPassword4").value){
            	document.getElementById("status").innerHTML = "Password not matched";
            	document.getElementById("status").style = "text-color: red;"
            	document.getElementById("stats").type = "button";
            }
            else{
            	document.getElementById("status").innerHTML = "Password matched";
            	document.getElementById("status").style = "text-color: green;"
            		document.getElementById("stats").type = "submit";
            }
            }
            </script>
            <div class="form-group col-md-6">
              <label for="inputAge4">Age</label>
              <input type="text" class="form-control" name="age" id="age" value="${data.getAge()}" placeholder="Enter Age" readonly>
            </div>
            <div class="form-group col-md-6">
              <label for="inputGender4">Gender</label>
              <select id="inputGender4" class="form-control" name="gender" required>
              <option value="Male" selected>Male</option>
              <option value="Female">Female</option>
              </select>
            </div>
          </div>
          <script type="text/javascript">
          document.getElementById("inputGender4").selected = "${data.getGender()}";
          </script>
          <div class="form-group">
            <label for="inputAddress">Permanent Address</label>
            <input type="text" class="form-control" id="inputAddress" name="pa" value="${data.getPa()}" placeholder="12 Main St, CAB Subd., Brgy. XYZ, Example City, State" required>
          </div>
         
          <div class="form-group">
            <label for="inputAddress2">Current Address</label>
            <input type="text" class="form-control" id="inputAddress2" name="ca" value="${data.getCa()}" placeholder="12 Main St, CAB Subd., Brgy. XYZ, Example City, State" required>
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
              <input type="text" class="form-control" name="city" id="inputCity" value="${data.getCity()}" placeholder="Las Pinas City" required>
            </div>
            <div class="form-group col-md-4">
              <label for="inputState">State</label>
              <input type="text" class="form-control" name="state" placeholder="Manila" value="${data.getState()}" id="inputState" required>
            </div>
            <div class="form-group col-md-2">
              <label for="inputZip">Zip Code</label>
              <input type="text" class="form-control" name="zip" placeholder="1747" value="${data.getZip()}"  id="inputZip"required>
            </div>
           
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="stats" class="btn btn-primary">Sign Up</button>
      </div>
    </form>
    <form action="Logout" method="post"><input type="hidden" name="action" value="delete"><button type="submit">Delete</button></form>
    </div>
  </div>
</div>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" id="13">
      <div class="col-md-7">
        <h2 class="featurette-heading">Transaction History <span class="text-muted">View Transaction History</span></h2>
        <table class="table">
  <thead>
    <tr>
      <th scope="col">TR No.</th>
      <th scope="col">Doctor's Name</th>
      <th scope="col">Location</th>
      <th scope="col">Purpose</th>
      <th scope="col">Remarks</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">00001</th>
      <td>Dr. Evan Steve</td>
      <td>California, USA</td>
      <td>Check Up</td>
      <td><span class="badge badge-success">Finished, Paid</span></td>
      <td>08/21/2019</td>
    </tr>
    <tr>
      <th scope="row">00002</th>
      <td>Dr. Jacob Dimansalang</td>
      <td>West Virginia</td>
      <td>Follow up Check Up</td>
      <td><span class="badge badge-success">Finished, Paid</span></td>
      <td>09/22/2019</td>
    </tr>
    <tr>
      <th scope="row">00003</th>
      <td>Dr. Jacob Dimansalang</td>
      <td>West Virginia</td>
      <td>Follow up Check up</td>
      <td><span class="badge badge-danger">Pending</span></td>
      <td>10/29/2019</td>
    </tr>
  </tbody>
</table>
      </div>
    </div>

    <hr class="featurette-divider mb-2">

    <!-- /END THE FEATURETTES -->

  </div>
</div>
<div class="jumbotron text-right" id="Aboutus" style="margin-bottom: 0!important; background-color: #1C0D02;">
  <img src="FarmGoodPHLogo.png" width="100px" height="100px"/>
  <p class="lead" style="color: white; font-family: customfonts;">Doctor's Online Appointment System</p>
  <p class="lead" style="color: white; font-family: customfonts;font-size:16px;">
  DOA is a System used for booking your doctor's appointment via  online means. we simplify things for you. All rights Reserve
  </p>
  <hr class="my-2" style="color: white; font-family: customfonts; background-color: white;">
  <p style="color: white; font-family: customfonts;">@2019 DOA Systems Ltd Co.</p>
</div>
<%@ page import="java.util.GregorianCalendar, java.util.Calendar" %>
<%
 GregorianCalendar currentDate = new GregorianCalendar();
 int currentYear = currentDate.get(Calendar.YEAR);
%>
<div class="footer fixed-bottom bg-success text-white">
<p>&copy; Copyright <%= currentYear%> DOA Systems Ltd Co.</p>
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
if (byr >= nowyear || byr < 1900) { // check valid year
showMessage();
return false;
}
var bmth = parseInt(d[1],10)-1; // radix 10!
if ((bmth < 0 )|| (bmth >11)) { // check valid month 0-11
	showMessage()
	return false;
	}
	var bdy = parseInt(d[2],10); // radix 10!
	var dim = daysInMonth(bmth+1,byr);
	if ((bdy <1) || (bdy > dim)) { 		// check valid date according to month
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