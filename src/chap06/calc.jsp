<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    int n1 = Integer.parseInt(request.getParameter("n1"));
    int n2 = Integer.parseInt(request.getParameter("n2"));

    long result = 0;

    switch (request.getParameter("op")){
        case "+": result= n1 + n2; break;
        case "-": result= n1 - n2; break;
        case "/": result= n1 / n2; break;
        case "*": result= n1 * n2; break;
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP 계산 결과</title>
</head>
<body>
    <h3>계산 결과 - JSP</h3><hr>
    결과: <%=result%>
</body>
</html>

