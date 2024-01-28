<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="com.tech.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<style>
.jumbotron,.banner-background{
background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
}
</style>
<meta charset="UTF-8">
<title> HOME | PAGE </title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

</style>
</head>

<body style="background: -webkit-linear-gradient(left, #0072ff, #00c6ff);">
<!-- Navigation Bar -->
<%@include file="normal_navbar.jsp"%>

<div class="container-fluid p-0 m-0 banner-background">
<div class="jumbotron  text-white ">
<div class="container">

<h3 class="display-3">Welcome to Tech Blog</h3>
<p>A computer program is a sequence or set of instructions in a programming language for a computer to execute. It is one component of software, which also includes documentation and other intangible components.</p>
<p>A computer program in its human-readable form is called source code. Source code needs another computer program to execute because computers can only execute their native machine instructions. Therefore, source code may be translated to machine instructions using the language's compiler.
</p>
<a href="registration.jsp" class=" button btn btn-outline-light btn-lg"> <span class="fa fa-address-card-o"></span>   Start ! It's Free</a>
<a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-handshake-o"> </span>Login</a>
</div>
</div>
</div>

<!-- Cards -->

<div class="container" >
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Web Development</h5>
                    <p class="card-text">Explore the world of web development with HTML, CSS, and JavaScript to create stunning and interactive websites.</p>
                    <a href="login.jsp" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Python Programming</h5>
                    <p class="card-text">Dive into the world of Python programming, from basic syntax to advanced topics, and unleash the power of this versatile language.</p>
                    <a href="login.jsp" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Data Science Essentials</h5>
                    <p class="card-text">Learn the essentials of data science, including data analysis, machine learning, and data visualization, to extract valuable insights from data.</p>
                    <a href="login.jsp" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Mobile App Development</h5>
                    <p class="card-text">Get hands-on experience in mobile app development, covering both Android and iOS platforms, and build apps that users will love.</p>
                    <a href="login.jsp" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Cybersecurity Basics</h5>
                    <p class="card-text">Master the fundamentals of cybersecurity, including ethical hacking and security best practices, to protect digital assets from potential threats.</p>
                    <a href="login.jsp" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Cloud Computing Solutions</h5>
                    <p class="card-text">Explore the world of cloud computing, including popular platforms like AWS and Azure, and build scalable and efficient cloud-based solutions.</p>
                    <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>



<footer class="text-center text-white" style="background-color:-webkit-linear-gradient(left, #0072ff, #00c6ff) ; margin-top:180px;">
  
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
<script type="text/javascript" src="js/script.js"></script>
</body>

</html>