<%--
  Created by IntelliJ IDEA.
  User: badac
  Date: 2023-05-26
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<html>
<head>
    <title>jsp date example</title>
</head>
<body>
<h4>date</h4><hr>
<%
    Date today = new Date();
    Locale loc = new Locale("en","US");
    DateFormat dateFormatUS = DateFormat.getDateInstance(DateFormat.DEFAULT, loc);
    String todayStrUS = dateFormatUS.format(today);

    SimpleDateFormat dateFormatKR = new SimpleDateFormat("yyyy-MM-dd");
    String todayStrKR = dateFormatKR.format(today);

    out.println("오늘 날짜 KR : "+todayStrKR+"<br/>");
    out.println("오늘 날짜 US : "+todayStrUS);
%>
</body>
</html>
