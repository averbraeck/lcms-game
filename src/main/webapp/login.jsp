<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>LCMS Login</title>
</head>

<body>

<h2>Login</h2>

<img src="images/lcms-logo-naam.png">

<%
if ("true".equals(request.getParameter("error")))
{
%>
	<p style="color:red">
	  Invalid username or password
	</p>
<%
}
%>

<form method="post" action="<%= request.getContextPath() %>/login">
	 
	<p>
		Username:<br>
		<input type="text" name="username" autofocus>
	</p>
	 
	<p>
		Password:<br>
		<input type="password" name="password">
	</p>
	 
	<p>
	  <input type="submit" value="Login">
	</p>
</form>

</body>
</html>