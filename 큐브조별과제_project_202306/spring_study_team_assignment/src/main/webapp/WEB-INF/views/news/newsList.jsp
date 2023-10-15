<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/style.css">
    <title>실시간 센서 모니터링 웹사이트</title>
</head>
<body>
<div class="container w-75 mt-5 mx-auto">
    <h2>실시간 온습도</h2>
    <hr>
    <ul class="list-group">
        <c:forEach var="news" items="${newslist}" varStatus="status">
            <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"><span
                    href="/news/${news.datetime}"
                    class="text-decoration-none">${news.humidity}% ${news.temperature}ºC 시간: ${news.datetime}</span>
            </li>
        </c:forEach>
    </ul>
    <hr>
</div>
</body>
<script>
    // setInterval(()=>{location.reload();}, 1000)

</script>
</html>