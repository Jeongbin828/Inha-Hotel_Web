<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <style>
  #insert{
    padding: 5px;
    margin-bottom: 10px;
    font-size: 20px;
  }

  #insert a{
    padding: 3px;
    padding-top: 8px;
    text-decoration: none;
    color: black;
    background: rgb(235, 228, 207);
    border: 1px solid #ccc;
  }

  #insert a:hover{
    text-decoration: underline;
    color: blue;
  }

  table{
    width: 100%;
    border-top: 1px solid;
    border-collapse: collapse;
    text-align: center;
  }

  th{
    background-color: rgb(235, 228, 207);
  }

  th, td{
    border-bottom: 1px solid;
    padding: 10px;
  }

  a:link, a:visited{
    text-decoration: none;
    color: blue;
  }
  </style>
  <title>Inha Hotel Admin</title>
</head>

<body>
  <h2>객실 정보</h2>

  <div id="insert">
    <a href="Room_Insert_UI.jsp"><b>객실 등록</b></a>
  </div>

  <table>
    <tr>
      <th>객실 번호</th><th>객실명</th><th>객실 크기(㎡)</th><th>최대 인</th><th>1박 가격</th><th>수정</th><th>삭제</th>
    </tr>
<%
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from room");

    while(rs.next()){
      int rmId = rs.getInt("rmId");				// 객실 번호
      String rmName = rs.getString("rmName");		// 객실
      int rmSize = rs.getInt("rmSize");			// 객실 크기(㎡)
      int maxP = rs.getInt("maxP");				// 최대 인원
      int price = rs.getInt("price");				// 1박 가격
			
      out.println("<tr>");
      out.println("<td>"+rmId+"</td>");
      out.println("<td>"+rmName+"</td>");
      out.println("<td>"+rmSize+"</td>");
      out.println("<td>"+maxP+"</td>");
      out.println("<td>"+price+"</td>");
      out.println("<td><a href='Room_Update_UI.jsp?_rmId="+rmId+"&_rmName="+rmName+"&_rmSize="+rmSize+"&_maxP="+maxP+"&_price="+price+"'>수정</a></td>");
      out.println("<td><a href='Room_Delete_Query.jsp?_rmId="+rmId+"'>삭제</a></td>");
      out.println("</tr>");
    }
%>
  </table>
<%		
    rs.close();
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>