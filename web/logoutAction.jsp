<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@page import="user.UserDAO" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>WEB SITE</title>
</head>
<body>
<%
    session.invalidate(); // 세션 권한 뺏기
%>

<script> location.href='main.jsp'</script>

</body>
</html>
