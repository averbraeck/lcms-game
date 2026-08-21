<%@ page import="nl.tudelft.simulation.lcms.data.tables.records.UserRecord"%>

<%
UserRecord user = (UserRecord) session.getAttribute("user");
%>

<html>

<head>
<title>LCMS</title>
</head>

<body>

	<h1>Welcome</h1>

	<p>
		Logged in as <b><%=user.getLoginName()%></b>
	</p>

	<p>
		<a href="/lcms/logout">Logout</a>
	</p>

</body>

</html>