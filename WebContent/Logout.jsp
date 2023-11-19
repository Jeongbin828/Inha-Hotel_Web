<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
</head>

<body>
<%
  session.invalidate();
%>

  <script>
    alert("로그아웃");
    document.location.href="Main.jsp";
  </script>
</body>
</html>