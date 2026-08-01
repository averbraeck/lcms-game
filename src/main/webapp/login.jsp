<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>LCMS Login</title>
</head>

<body>

<h2>Login</h2>

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

login

    <p>
        Username:
        <input type="text"
               name="username">
    </p>

    <p>
        Password:
        <input type="password"
               name="password">
    </p>

    <p>
        <input type="submit"
               value="Login">
    </p>

</form>

</body>
</html>