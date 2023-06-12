<%--
  Created by IntelliJ IDEA.
  User: badac
  Date: 2023-05-26
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>서비스 중 일시적인 오류가 발생하였습니다.</h2>
<p>
    오류명 : <%=exception.getClass().getName()%> <br/>
    오류 메시지 : <%=exception.getMessage()%>
</p>

</body>
</html>
