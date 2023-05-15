<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
지금<%=new java.util.Date() %><br/>
hello<br/>
<a href="./Hello.bong" methods="get">봉진 Servlet으로 넘어갑니다.</a><br/>
<a href="./Hello.dong" methods="get">동진 Servlet으로 넘어갑니다.</a><br/>
<a href="./Hello.bi" methods="get">은비 Servlet으로 넘어갑니다.</a>
</body>
</html>