<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userBuilding" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order with me ?</title>
</head>
<body>
	<%
		if (user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null
		||user.getUserBuilding()==null || user.getUserEmail()==null)
		{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('There are items that have not been entered.')");
				script.println("history.back()");
				script.println("</script>");
		} 
		else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('The ID already exists.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}
	%>
</body>
</html>