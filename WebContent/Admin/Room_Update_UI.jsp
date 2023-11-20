<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <style>
  th, td{
    padding: 5px;
  }
  </style>
  <title>Inha Hotel Admin</title>
</head>

<body>
<%
  String rmId = request.getParameter("_rmId");
  String rmName = request.getParameter("_rmName");
  String rmSize = request.getParameter("_rmSize");
  String maxP = request.getParameter("_maxP");
  String price = request.getParameter("_price");
%>

  <h2>객실 수정</h2>

  <form action="Room_Update_Query.jsp" method="post">
    <table>
      <tr>
        <th>객실 번호</th><td><input type="hidden" name="_rmId" value="<%= rmId %>"><%= rmId %></td>
      </tr>
      <tr>
        <th>객실명</th><td><input type="text" name="_rmName" value="<%= rmName %>"></td>
      </tr>
      <tr>
        <th>객실 크기(㎡)</th><td><input type="text" name="_rmSize" value="<%= rmSize %>"></td>
      </tr>
      <tr>
        <th>최대 인원</th><td><input type="text" name="_maxP" value="<%= maxP %>"></td>
      </tr>
      <tr>
        <th>1박 가격</th><td><input type="text" name="_price" value="<%= price %>"></td>
      </tr>
      <tr>
        <td></td><td style="text-align: right;"><input type="submit" value="수정"></td>
      </tr>
    </table>
  </form>
</body>
</html>