<!DOCTYPE html >
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


    
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2020 00:00:00 GMT">
<title>Helios Solutions| home</title>
<link href="static/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

	<div >
			<div>
				<a href="/welcome">Helios Solutions</a>
				<div >
					<ul >
						<li><a href="/login">Login</a></li>
						<li><a href="/register">New Registration</a></li>
						<li><a href="/show-users">All Users</a></li>
					</ul>
				</div>
			</div>
	</div>
	
	<c:choose>
	<c:when test="${mode=='MODE-HOME' }">
	<div class="container" id="homediv">
		<div class="jumbotron text-center">
			<h1>Welcome to Helios Solutions</h1>
		</div>
	</div>
	</c:when>

		<c:when test="${mode=='MODE-REGISTER' }">
		<div class="container text-center">
		<h3>New Registration</h3>
		<hr>
		<form class="form-horizontal" method="POST" action="save-user">
			<input type="hidden" name="id" value="${user.id }" />
			<div class="form-group">
				<label class="control-label col-md-3">User Name</label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="username"
						value="${user.username }" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3">First Name</label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="firstname"
						value="${user.firstname }" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3">Last Name</label>
				<div class="col-md-7">
					<input type="text" class="form-control" name="lastname"
						value="${user.lastname }" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-md-3">Password</label>
				<div class="col-md-7">
					<input type="password" class="form-control" name="password"
						value="${user.password }" />
				</div>
			</div>
			<div class="form-group ">
				<input type="submit" class="btn btn-primary" value="Register" />
			</div>
		</form>
	</div>
	</c:when>
	
	<c:when test="${mode=='ALL-USERS' }">
	<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table border="1" >
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>FirstName</th>
								<th>LastName</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${users}" var="user" >
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td><a href="/delete-user?id=${user.id}">DELETE<span class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id}">EDIT<span class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			
	<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>

	
<!-- Optional JavaScript -->
	
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/resources/static/js/bootstrap.min.js"></script>
	
</body>
</html>