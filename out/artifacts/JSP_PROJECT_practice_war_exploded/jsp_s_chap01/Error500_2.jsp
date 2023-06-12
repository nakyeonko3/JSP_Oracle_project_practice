<%--
  Created by IntelliJ IDEA.
  User: badac
  Date: 2023-05-26
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" errorPage="IsErrorPage.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int myAge = Integer.parseInt(request.getParameter("age")) + 10;
    out.println("10년 후 당신의 나이는 " + myAge + "입니다");
%>
</body>
</html>
