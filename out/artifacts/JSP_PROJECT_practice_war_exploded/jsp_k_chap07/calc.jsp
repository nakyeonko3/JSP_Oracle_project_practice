<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:useBean id="calc" class="chap07.Calculator"/>
<jsp:setProperty name="calc" property="*"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JSP 계산 결과</title>
</head>
<body>
<h3>계산 결과 - JSP</h3>
<hr>
결과: <%=calc.calc()%>
</body>
</html>

