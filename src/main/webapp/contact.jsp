<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
body{
    background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
}
.contact-form{
    background: #fff;
    margin-top: 10%;
    margin-bottom: 5%;
    width: 70%;
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(29deg);
}
.contact-form form{
    padding: 14%;
}
.contact-form form .row{
    margin-bottom: -7%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 50%;
    border: none;
    border-radius: 1rem;
    padding: 1.5%;
    background:-webkit-linear-gradient(left, #0072ff, #00c6ff);
    font-weight: 600;
    color: #fff;
    cursor: pointer;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background: -webkit-linear-gradient(left, #0072ff, #00c6ff);;
    border: none;
    cursor: pointer;
}

</style>
<title>CONTACT | PAGE</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<!-- Navigation Bar -->
	
	<%@include file="normal_navbar.jsp"%>

	<!-- Login Form -->

<div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form method="post">
                <h3>DROP US A MESSAGE</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="txtName" class="form-control" placeholder="ENTER NAME *" value="" />
                        </div>
                        <div class="form-group">
                            <input type="text" name="txtEmail" class="form-control" placeholder="ENTER EMAIL *" value="" />
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" name="txtPhone" class="form-control" placeholder="ENTER PHONE NUMBER *" value="" />
                        </div>
                        <div class="form-group ">
                            <input type="submit" name="btnSubmit" class="btnContact" value="SEND MESSAGE" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="txtMsg" class="form-control" placeholder="YOUR MESSAGE *" style="width: 100%; height: 150px;"></textarea>
                        </div>
                        <div class="form-group">
                            <a href="index.jsp" class="btn primary-background text-white">HOME</a>
                        </div>
                    </div>
                </div>
            </form>
</div>
<footer class="text-center text-white" style="background-color: #-webkit-linear-gradient(left, #0072ff, #00c6ff); margin-top:20px;">
  
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);" >
    ©  2023  COPYRIGHT :
    <a   class="text-white" href="index.jsp">TECH BLOGS</a>
  </div>
  <!-- Copyright -->
</footer>
</body>
</html>