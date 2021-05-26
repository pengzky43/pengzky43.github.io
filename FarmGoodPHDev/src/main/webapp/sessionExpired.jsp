<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="jcon.Connector, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Doctor's Online Appointment</title>
  <link rel="stylesheet" type="text/css" href="Designs\css\bootstrap.css">
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link rel="stylesheet" type="text/css" href="Designs\css\all.css">
  <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
  </script>
  <script src="Designs\js\jquery-3.3.1.slim.min.js"></script>
  <script src="Designs\js\bootstrap.min.js"></script>
  <script src="Designs\js\popper.min.js"></script>
<title>Session Expired</title>
</head>
<body>
<script type="text/javascript">
alert("Session Has Expired.");
location="index.jsp";
</script>
</body>
</html>