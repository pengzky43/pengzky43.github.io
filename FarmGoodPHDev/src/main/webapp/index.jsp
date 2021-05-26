<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.*, java.util.*, javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.GregorianCalendar, java.util.Calendar"%>

<%
 GregorianCalendar currentDate = new GregorianCalendar();
 int currentYear = currentDate.get(Calendar.YEAR);
%>

<!DOCTYPE html>
<html>
<head>
<%!String aa = "";%>

<%String aa = String.valueOf(session.getAttribute("user"));%>

<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FarmGood PH</title>
	<link rel="shortcut icon" href="FarmGoodPHLogo.png"/>
	<link rel="stylesheet" type="text/css" href="Designs\css\bootstrap.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="Designs\css\all.css">
	
 	<script>
		$('#myModal').on('shown.bs.modal', function () {
			$('#myInput').trigger('focus')})
	</script>
  
	<script src="Designs\js\jquery-3.3.1.slim.min.js"></script>
	<script src="Designs\js\bootstrap.min.js"></script>
	<script src="Designs\js\popper.min.js"></script>
	
</head>

<body>
<jsp:include page="/load.jsp"></jsp:include>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    		<a class="navbar-brand mr-2" href="index.jsp"><img src="FarmGoodPHLogo.png" height="35px" width="35px" style="float: left;"/></a>
    		<a class="navbar-brand" href="index.jsp">FarmGood PH</a>   
    			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          			<span class="navbar-toggler-icon"></span>
        		</button>
    	<div class="collapse navbar-collapse" id="navbarResponsive">
      		<ul class="navbar-nav ml-auto">
        		<li class="nav-item active">
          			<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        		</li>
        		<li class="nav-item active">
          			<a class="nav-link" href="#AboutForm">About Us</a>
          		</li>
        		<li class="nav-item active">
          			<a class="nav-link" href="account.jsp">Account</a>
        		</li>
       			<li class="nav-item active">
           			<a class="nav-link" id="terms" data-toggle="modal" href="#TAD">Terms and Conditions</a>
        		</li>
        	</ul>              		
     	</div>
     					
          	<div class="buttons">
  				<div>
      				<a href="loginsignup.jsp" class="btn effect01" target="_blank"><span>Register</span></a>
  				</div>
			</div>    	
    </nav>
        
	<form action="">
		<div class="modal fade" id="TAD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  			<div class="modal-dialog" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="exampleModalLabel">Terms and Conditions</h5>
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
      <div>3.1 You Acknowledge that, (a) in order to access our DOA System, You must Sign up an account (b)We may set registration requirements, On our sole discretion.</div>
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
      <button type="submit" class="btn btn-dark" data-dismiss="modal" aria-label="Close">
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
      				<img class="d-block w-100" src="farmbanana.jpg" alt="First slide" height=750px>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="farmcoconut.jpg" alt="Second slide" height=750px>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="farmcorn.jpg" alt="Third slide" height=750px>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="farmmango.jpg" alt="Fourth slide" height=750px>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="farmsugarcane.jpg" alt="Fifth slide" height=750px>
    			</div>
    			<div class="carousel-item">
      				<img class="d-block w-100" src="farmrice.jpg" alt="Sixth slide" height=750px>
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
		
		<footer>
			<div class="page-footer">
      			<div class="topview">
        			<div class="container">
          				<div class="row">
           					 <div class="col-lg-3 col-md-12 col-sm-12 footer-col-3">
              					<div class="footerlink footer_footerlink">
                					<h5 class="footer-title">Address</h5>
                						<div class="gem-contacts">
                 	 						<div class="gem-contacts-item gem-contacts-address">Corporate Office :<br> Doon House, B-275(A), First floor
                    						Sector-57, Shushant Lok 3
                    						Near Hong Kong Bazzar, Gurugram Pin 122001, Haryana.
                 							</div>
                  							<div class="gem-contacts-item gem-contacts-phone"><i class="fa fa-phone" aria-hidden="true"></i> Phone: <a href="">+91-9122588799</a></div>
                  							<div class="gem-contacts-item gem-contacts-address mt-2">Reg. Office :<br> Doon House, D2/3,
                    						4th Floor, Chandra Tower, IDBI Bank Building
                    						Dimna Road, Mango, Jamshedpur-831012, Jharkhand.</div>
                  							<div class="gem-contacts-item gem-contacts-phone"><i class="fa fa-phone" aria-hidden="true"></i> Phone: <a>+91 9122588799</a></div>
										</div>
              					</div>
           					</div>
           					 <div class="col-12 col-lg-6 col-md-6 col-sm-12">
              					<div class="row">
                					<div class="col-6 col-lg-6 col-md-6 col-sm-6=">
                  						<div class="footerlink footer_footerlink">
                    						<h5 class="footer-title">Recent News</h5>
                    							<ul class="posts styled">
                      								<li class="clearfix gem-pp-posts">
                        								<div class="gem-pp-posts-text">
                          									<div class="gem-pp-posts-item">
                            									<a href="#">Want to start Your Own Play School.</a>
                          									</div>
                          									<div class="gem-pp-posts-date">Call +91-9122588799</div>
                          								</div>
                      								</li>
                      								<li class="clearfix gem-pp-posts">
                        								<div class="gem-pp-posts-text">
                         	 								<div class="gem-pp-posts-item"><a href="#">Now we are in Faridabad,Now we are in DaudNagar.</a></div>
                          									<div class="gem-pp-posts-date">Call +91-9122588799, +91-9122588799</div>
                        								</div>
                     								</li>
                      								<li class="clearfix gem-pp-posts">
                        								<div class="gem-pp-posts-text">
                          								<div class="gem-pp-posts-item">
                            								<a href="">Now we are in Ranchi, Admission open</a>
                          								</div>
                          								<div class="gem-pp-posts-date">Call +91-9122588799, +91-9122588799</div>
                        								</div>
                      								</li>
                    							</ul>
                  						</div>
                					</div>
                					<div class="col-6 col-lg-6 col-md-6 col-sm-6">
                  						<div class="footerlink">
                    						<h5 class="footer-title">Email Us</h5>
                    							<div class="textfooterlink">
                      								<div role="form" class="textbox" id="textbox-f4-o1" lang="en-US" dir="ltr">
														<form method="post" class="textbox-form" novalidate="novalidate">
															<div class="contact-form-footer">
        														<p><span class="textbox-form-control-wrap your-first-name"><input type="text" name="your-first-name" value="" size="40" class="textbox-form-control textbox-text" aria-invalid="false" placeholder="Please enter your Name"></span></p>
            													<p><span class="textbox-form-control-wrap your-email_1"><input type="email" name="your-email_1" value="" size="40" class="textbox-form-control textbox-text textbox-email textbox-validates-as-email" aria-invalid="false" placeholder="Please enter your Email Address"></span></p>
																<p><span class="textbox-form-control-wrap your-message"><textarea name="your-message" cols="40" rows="10" class="textbox-form-control textbox-textarea" aria-invalid="false" placeholder="Type your message (Optional)"></textarea></span></p>
        															<div><input type="submit" value="Send" class="textbox-form-control textbox-submit"><span class="ajax-loader"></span></div>
        													</div>
     													</form>
                      								</div>
                    							</div>
                  						</div>
                					</div>
              					</div>
            				</div>
            				<div class="col-12 col-lg-3 col-md-5 col-sm-12 footer-col-4">
              					<div class="footerlink footerlink_gallery">
                					<h5 class="footer-title">FarmGood PH</h5>
                						<ul class="image">
                 	 						<li><a class="magnific-anchor"><img src="FarmGoodPHLogo.png" alt=""></a></li>
                  						</ul>
              					</div>
            				</div>
          				</div>
        			</div>
      			</div>   
      			<div class="bottomview">
        			<div class="container">
          				<div class="row">
            				<div class="col-md-3">
              					<div class="Copyright">&copy; Copyright <%= currentYear%> FarmGood PH</div>
            				</div>
            				<div class="col-md-6">
              					<nav id="footer-navigation" class="site-navigation footer-navigation centered-box" role="navigation">
                					<ul id="footer-menu" class="nav-menu styled clearfix inline-inside">
                  						<li id="menu-item-26" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-26"><a href="#">Support</a></li>
                  						<li id="menu-item-27" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-27"><a href="#">Contact Us</a></li>
                  						<li id="menu-item-28" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-28"><a href="#">Disclaimer</a></li>
                  						<li id="menu-item-29" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-29"><a href="#">Add more</a></li>
                					</ul>
              					</nav>
            				</div>
            				<div class="col-md-3">
              					<div id="footer-social">
                					<div class="socials inline-inside socials-colored">
                  						<a href="https://facebook.com" title="Facebook" class="social-icon">
                    						<i class="fab fa-facebook-f facebook"></i>
                  						</a>
                  						<a href="https://twitter.com" title="Twitter" class="social-icon">
                    						<i class="fab fa-twitter twitter"></i>
                  						</a>
                  						<a href="https://Instagram.com" title="Instagram" class="social-icon">
                    						<i class="fab fa-instagram instagram"></i>
                  						</a>
                  						<a href="https://Google.com" title="Google" class="social-icon">
                    						<i class="fab fa-google google"></i>
                  						</a>
                  						<a href="https://www.linkedin.com" title="Linkedin" class="social-icon">
                    						<i class="fab fa-linkedin linkedin"></i>
                  						</a>
                					</div>
              					</div>
            				</div>
          				</div>
        			</div>
      			</div>
  			</div>
 		</footer>
</body>
</html>