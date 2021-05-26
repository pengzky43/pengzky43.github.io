<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jcon.Connector, java.sql.*, servlet.*, dao.*, table.*, java.util.*, javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta charset="ISO-8859-1">
<title>FarmGood PH</title>
	<link rel="shortcut icon" href="FarmGoodPHLogo.png"/>
	<link rel="stylesheet" type="text/css" href="load.css">
	<script src="Designs\js\jquery-3.3.1.slim.min.js"></script>
	<script src="Designs\js\bootstrap.min.js"></script>
	<script src="Designs\js\popper.min.js"></script>
	<script src="script.js"></script>
</head>
<body>
<script type="text/javascript">
document.documentElement.onload = function(){
    document.getElementById("loader").style.display = "block";
};
window.onload = function(){
	var msdelay = 2500;
	setTimeout(function(){
		document.getElementById("loader").style.display = "none";
	}, msdelay);
	};
</script>
<div id="loader" class="loader">
	<div id="icon">
		<div id="potato">
		<img alt="image" id="ptato" src="potato.svg">
		</div>
		<div id="eye">
		</div>
		<div id="eye" class="eye">
		</div>
	</div>
	<div id="loading">
	<span id="loading" style="font-size: 80px">.</span>
	<span id="loading" style="font-size: 80px">.</span>
	<span id="loading" style="font-size: 80px">.</span>
	<span id="loading" style="font-size: 80px">.</span>
	</div>
</div>
</body>
</html>