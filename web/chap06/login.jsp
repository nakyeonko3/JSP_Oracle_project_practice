<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String n1 = request.getParameter("n1");
    String n2 = request.getParameter("n2");
    String n3 = request.getParameter("n3");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인정보</title>
</head>
<body>
    <h3>로그인 정보 jsp</h3><hr>
    <div>아이디:<%=n1%></div>
    <div>비밀번호:<%=n2%></div>
    <div>지역번호:<%=n3%></div>
</body>
</html>
