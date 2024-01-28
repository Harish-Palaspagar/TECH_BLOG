<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikesDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page import="java.sql.*"  %>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Posts" %>

<div class="row">


<%
User uuu  =(User)session.getAttribute("currentUser");


PostDao d = new PostDao(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cid"));
List<Posts> posts = null;
if(cid==0)
{
posts = d.getAllPosts();
	
}
else{
posts = d.getPostByCatId(cid);
}
if(posts.size()==0)
{
	out.println("<h4 class='display-3 text-center' >No Post Found in this Category </h4>");
	return;
}
for(Posts p:posts)
{
	%>
	<div class="col-md-6 mt-3">
	<div class="card">
	<div class="card-body">
	<b><%= p.getPtitle()%></b>
	<p><%= p.getPcontent() %></p>
	</div>
	
	<div class="card-footer primary-background text-center">

<%LikesDao ld = new LikesDao(ConnectionProvider.getConnection());%>
		<a href="#!" onclick="doLike(<%=p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
			<a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">READ MORE</a>
		<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
		
	
	</div>
	</div>
	</div>
	<% 
}
%>
</div>

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





