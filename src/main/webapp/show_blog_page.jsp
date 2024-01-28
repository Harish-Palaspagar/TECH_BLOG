<%@page import="com.tech.blog.dao.LikesDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>


<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());

Posts p = d.getPostByPostId(postId);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<!-- Other head elements -->

<meta charset="UTF-8">
<title><%=p.getPtitle()%> | HARISH BLOGS WEB</title>
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

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-size: 20px;
	font-weight: 100;
}

.post-user-info {
	font-size: 15px;
	font-style: 300;
}

.row-user {
	border: 2px solid #e2e2e2;
	padding-top: 15px;
}

body {
	 background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
}
</style>
</head>
<body>
	<!-- NavBar -->


	<nav class="navbar navbar-expand-lg navbar-dark primary-background ">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-shield"></span>TECH BLOG
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="fa fa-street-view"></span>
						HARISH<span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-tasks"></span>CATEGORIES
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">PROGRAMMING</a> <a
							class="dropdown-item" href="#">PROJECTS</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">DATA</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"> <span
						class="fa fa-address-book"></span>CONTACT
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="fa fa-asterisk mr-1"></span>DO POST
				</a></li>


			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-street-view"></span> <%=user.getName().toUpperCase()%></a>
				</li>

				<li class="nav-item"><a class="nav-link" href="Logout"> <span
						class="fa fa-random"></span>LOG OUT
				</a></li>

			</ul>
		</div>
	</nav>

	<!-- NavBar End -->

	<!-- MAIN CONTENT -->
	<div class="container">



		<div class="row my-4">

			<div class="col-md-8 offset-md-2">

				<div class="card">
					<div class="card-header primary-background text-white">

						<h4 class="post-title">
							<%=p.getPtitle()%></h4>


					</div>

					<div class="card-body">
						<div class="row my-3 row-user">

							<div class="col-md-8">

								<%
								UserDao ud = new UserDao(ConnectionProvider.getConnection());
								%>

								<p class="post-user-info">
									<a href="#"> <%=ud.getUserByUserId(p.getUserId()).getName().toUpperCase()%>
									</a> HAS POSTED :
								</p>

							</div>

							<div class="col-md-4"></div>

						</div>


						<p class="post-content">
							<%=p.getPcontent()%></p>
						<br>

						<div class="post-code">

							<pre> <%=p.getPcode()%></pre>
						</div>
					</div>

					<div class="card-footer primary-background">
						<%
						LikesDao dl = new LikesDao(ConnectionProvider.getConnection());
						%>

						<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=dl.countLikeOnPost(p.getPid())%></span></a>

						<a href="#!" class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i><span>20</span></a>


					</div>



				</div>


			</div>


		</div>



	</div>










	<!--END OF MAIN CONTENT -->



	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TECH BLOG</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>


				<div class="modal-body">
					<div class="container text-center">
						<h5 class="modal-title mb-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Profile  Edit  -->
						<div id="profile-edit" style="display: none;">

							<h5 class="mt-2">PLEASE EDIT CAREFULLY</h5>
							<form action="EditServlet" method="post">
								<table class="table">
									<tr>

										<td>ID :</td>
										<td><%=user.getId()%></td>

									</tr>
									<tr>

										<td>EMAIL :</td>
										<td><input class="form-control" type="email"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>NAME :</td>
										<td><input class="form-control" type="text"
											name="user_name" value="<%=user.getName()%>"></td>

									</tr>

									<tr>
										<td>PASSWORD :</td>
										<td><input class="form-control" type="password"
											name="user_password" value="<%=user.getPassword()%>"></td>

									</tr>

									<tr>
										<td>GENDER :</td>
										<td><%=user.getGender().toUpperCase()%></td>

									</tr>

									<tr>
										<td>ABOUT :</td>
										<td><textarea rows="5" class="form-control"
												name="user_about"><%=user.getAbout()%></textarea></td>

									</tr>




								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">

										UPDATE</button>


								</div>



							</form>


						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal End  -->

	<!-- Button trigger modal -->

	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">PROVIDE THE
						POST DETAILS</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---SELECT CATEGORY---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%>
								</option>
								<%
								}
								%>
							</select>
						</div>
						<!-- Other form fields go here... -->
						<div class="form-group">
							<input name="postNumber" type="number"
								placeholder="Enter Post Number" class="form-control"
								name="postNumber">
						</div>
						<div class="form-group">
							<input name="postTitle" type="text"
								placeholder="Enter Post Title" class="form-control"
								name="postTitle">
						</div>
						<div class="form-group">
							<textarea name="postContent" class="form-control"
								style="height: 200px;" placeholder="Enter Content Here"
								name="postContent"></textarea>
						</div>
						<div class="form-group">
							<textarea name="postCode" class="form-control"
								style="height: 200px;"
								placeholder="Enter Code Here (If Any.....)" name="postCode"></textarea>
						</div>

						<div class="container text-center">

							<button type="submit" class="btn btn-outline-primary">POST</button>

						</div>


					</form>
				</div>

			</div>
		</div>
	</div>
<footer class="text-center text-white" style="background-color: #-webkit-linear-gradient(left, #0072ff, #00c6ff); margin-top:300px;">
  
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    ©  2023  COPYRIGHT :
    <a class="text-white" href="index.jsp">TECH BLOGS</a>
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

	<script>
	$(document).ready(function() {
		let edit = false;
		
		
		
		
		$('#edit-profile-button').click(function(){
			//alert("nyauuu");
			//$("#profile-details").hide();
			//$("#profile-edit").show();
			if(edit == false)
				{
				$("#profile-details").hide();
				$("#profile-edit").show();
				edit = true;
				$(this).text("SAVE");
				}
			else
				{
				$("#profile-details").show();
				$("#profile-edit").hide();
				edit = false;
				$(this).text("EDIT");
				
				}
			
			
			
		});
	});
</script>

	<!-- Post Java script -->



	<script>

$(document).ready(function(e){
	//alert("Loaded"); 
	$("#add-post-form").on("submit",function(event)
			{
		event.preventDefault();
		console.log("submited success");
		let form = new FormData(this);
		
		$.ajax({
			
			url:"AddPostServlet",
		   type:"post",
		 data:form,
			success:function(data, textStatus, jqXHR)
			{
				console.log(data);
				if(data.trim()=='done')
					{
					swal("GOOD JOB!", "SAVED SUCCESSFULLY!", "success");
					}
				else{
					
					swal("ERROR", "SOMETHING WENT WRONG!", "error");
					
				}
			},
			error: function(jqXHR, textStatus,errorThrown)
			{
				swal("ERROR", "SOMETHING WENT WRONG!", "error");
				
			},
			processData:false,
			contentType:false
		});
			});
                });
                
                

                
                
</script>
	<!-- Likes Java script -->

	<script>
function doLike(postId, userId) {
	const d = {
			
	uid : userId,
	pid : postId,
	operation:'like'	
	}
	$.ajax({
		
		url:"LikeServlet",
		data : d,
		success: function(data, textStatus, jqXHR)
		{
		console.log(data);
		if(data.trim()=='true')
			{
			let c= $(".like-counter").html();
			c++;
			$(".like-counter").html(c);
			}
		},
		error: function(jqXHR, textStatus,errorThrown)
		{
			console.log(data);
			
		},
		
		
	})
	
	
	
	console.log("Liked post with ID: " + postId + " by user ID: " + userId);
}

</script>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</body>
</html>