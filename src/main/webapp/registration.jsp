<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Registration Page</title>

<!-- CSS -->

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 62% 89%, 27% 100%, 0 85%, 0 0
		);
}
</style>
</head>
<body  style="background: -webkit-linear-gradient(left, #0072ff, #00c6ff);">

	<!-- Navigation Bar -->

	<%@include file="normal_navbar.jsp"%>
	<main class=" p-5 ">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header primary-background  text-center text-white">REGISTER
						HERE</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post" id="reg-form">
							<div class="form-group">
								<label for="user_id">USER ID</label> <input name="user_id"
									type="number" class="form-control" id="user_id"
									aria-describedby="emailHelp" placeholder="ENTER ID">
							</div>
							<div class="form-group">
								<label for="user_name">USER NAME</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="ENTER NAME" autocomplete="username">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">EMAIL ADDRESS</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="ENTER EMAIL"> <small id="emailHelp"
									class="form-text text-muted">WE'LL NEVER SHARE YOUR EMAIL WITH ANYONE ELSE</small>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">PASSWORD</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="SET PASSWORD" autocomplete="current-password">
							</div>

							<div class="form-group">
								<label for="gender">SELECT GENDER</label> <br> <input
									type="radio"  name="gender" value="MALE" class="m-2">MALE
								<input type="radio"  name="gender" value="FEMALE"
									class="m-2">FEMALE
							</div>


							<div class="form-group">
								<textarea class="form-control" name="about" id="" cols="30"
									rows="5" placeholder="ENTER SOMETHING ABOUT YOURSELF">
  </textarea>
							</div>


							<div class="form-check text-center">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1"> I AGREE TO TERMS AND CONDITIONS.</label>
							</div>
							<div class="container  text-center fa-2x" id="loader"
								style="display: none">

								<span class="fa fa-refresh fa-spin"></span>
								<h5>PLEASE WAIT.....</h5>


							</div>

							<div class=" mt-2 text-center">

								<button style="background:-webkit-linear-gradient(left, #0072ff, #00c6ff); color:white;" id="submit-button" type="submit"
									class="btn btn-block">SIGN UP</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
<footer class="text-center text-white" style="background-color: #-webkit-linear-gradient(left, #0072ff, #00c6ff); margin-top:20px;">
  
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);" >
    ©  2023  COPYRIGHT :
    <a   class="text-white" href="index.jsp">TECH BLOGS</a>
  </div>
  <!-- Copyright -->
</footer>
	<!-- Java Script -->

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
		</script>

	<script>
	$(document).ready(function() {
        $('#reg-form').submit(function(event) {
            event.preventDefault();
            let form = $(this);

            $.ajax({
                url: "RegisterServlet",
                type: 'post',
                data: form.serialize(),
                success: function(data) {
                    if (data.trim() === 'done') {
                        swal("Registration Successful").then(() => window.location.href = "login.jsp");
                    } else {
                        swal(data);
                    }
                },
                error: function() {
                    swal("Something Went Wrong");
                }
            });
        });
    });
</script>
</body>
</html>