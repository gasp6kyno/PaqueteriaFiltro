<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
</head>
<body>
	<h2>Identifiquese por favor:</h2>
	<table>
		<tr>
			<td><a href="adminArticulo?action=index">Ir al menú</a></td>
		</tr>
	</table>
	<form action="LoginServlet" method="POST">
		NOMBRE:<input type="text" name="user"/><br>
		CONTRASEÑA:<input type="password" name="password"/><br>
		<input type="submit" value="Enviar"/>
	</form>
	<hr>
	<a href="adminArticulo?action=nuevo">TWITTER</a>
</body>
</html>