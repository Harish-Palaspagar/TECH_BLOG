<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tech.blog.entities.Message" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN | PAGE</title>

<!-- CSS -->

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 62% 89%, 27% 100%, 0 85%, 0 0);
}

</style>
</head>
<body style="background: -webkit-linear-gradient(left, #0072ff, #00c6ff);">

	<!-- Navigation Bar -->
	
	<%@include file="normal_navbar.jsp"%>

	<!-- Login Form -->

<main class="d-flex align-items-center " style="height:70vh;">

<div class="container d-flex flex-column justify-content-center  ">

<div class="row">

<div class="col-md-6 offset-md-3">

<div class="card d-flex">

<div class="card-header primary-background text-white text-center">
<p class="m-0">LOGIN</p>

</div>

	<%
		Message m =(Message)session.getAttribute("msg");
		if(m!=null)	
		{
	%>
	<div class="alert <%= m.getCssClass() %>" role="alert">
			  <%=m.getContent() %>
			</div>
	
	<%
		session.removeAttribute("msg");
	
		}
	
	%>
	

<div class="card-body ">
<form action="Login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">EMAIL ADDRESS</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ENTER EMAIL">
    <small id="emailHelp" class="form-text text-muted">WE'LL NEVER SHARE YOUR EMAIL WITH ANYONE ELSE</small>
  </div>
  <div class="form-group">
    <label  for="exampleInputPassword1">PASSWORD</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="ENTER PASSWORD">
  </div>
  
  <div class="text-center">
  <button style="background:-webkit-linear-gradient(left, #0072ff, #00c6ff); color:white;" type="submit" class="btn  btn-block ">LOGIN</button>
  </div>
  
</form>

</div> 
<div class="form-group text-center">
  
 NOT REGISTERED ? <a href="registration.jsp"> CLICK HERE </a>
  </div>

</div>

</div>

</div>

</div>

</main>
<footer class="text-center text-white" style="background-color: #-webkit-linear-gradient(left, #0072ff, #00c6ff); margin-top:160px;">
  
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    ©  2023  COPYRIGHT :
    <a class="text-white" href="index.jsp">TECH BLOGS</a>
  </div>
  <!-- Copyright -->
</footer>

<!-- Java Script -->

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>