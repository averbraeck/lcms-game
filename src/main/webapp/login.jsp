<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>
	<head>
	  <title>LCMS Login</title>
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
	</head>
	
	<body>
    <div class="login-box">
			<img src="${pageContext.request.contextPath}/images/lcms-logo-naam.png" style="max-width: 150px; height:auto; display:block; margin:auto;">
			
			<p>&nbsp;</p><p>&nbsp;</p>
			
			<%
			if ("true".equals(request.getParameter("error")))
			{
			%>
				<p style="color:red">
				  Invalid username or password
				</p>
			<% } %>
		
				<form method="post" action="${pageContext.request.contextPath}/login">
					<p>
						<label for="username">Gebruikersnaam</label>
						<input type="text" name="username" placeholder="Geef uw gebruikersnaam..." autofocus>
					</p>
					
					<p>
		        <label for="username">Wachtwoord</label>
						<input type="password" name="password" placeholder="Geef uw wachtwoord...">
					</p>
					 
	 				<p>
					  <input type="submit" value="Inloggen">
					</p>
					
					<p>&nbsp;</p><p>&nbsp;</p>
				</form>
    </div>	

	</body>
</html>