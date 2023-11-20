<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <style>
  th, td{
    padding: 5px;
  }
  </style>
  <title>Inha Hotel Admin/title>
</head>

<body>
  <h2>객실 등록</h2>

  <form action="Room_Insert_Query.jsp" method="post">
    <table>
      <tr>
        <th>객실명</th><td><input type="text" name="_rmName"></td>
      </tr>
      <tr>
        <th>객실 크기(㎡)</th><td><input type="text" name="_rmSize"></td>
      </tr>
      <tr>
        <th>최대 인원</th><td><input type="text" name="_maxP"></td>
      </tr>
      <tr>
        <th>1박 가격</th><td><input type="text" name="_price"></td>
      </tr>
      <tr>
        <td></td><td style="text-align: right;"><input type="submit" value="등록"></td>
      </tr>
    </table>
  </form>
</body>
</html>