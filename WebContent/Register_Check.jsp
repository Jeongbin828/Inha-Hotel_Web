<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
</head>

<body>
<%
  String id = request.getParameter("_id");                                          // 아이디
  String pw = request.getParameter("_pw");                                          // 비밀번호
  String name = request.getParameter("_name");                                      // 이름
  String phone = request.getParameter("_phone");                                    // 전화번호
  String email = request.getParameter("_email1") + request.getParameter("_email2"); // 이메일
  String message = request.getParameter("_message");                                // 문자수신 여부

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from member where id='"+id+"'");
		
    if(rs.next()){
%>
  <script>
    alert("동일한 아이디가 존재합니다.\n 다시 입력해주세요.");
    document.location.href="Register.jsp";
  </script>
<%
    }else{
      stmt.executeUpdate("insert into member(id, pw, name, phone, email, message) values('"+id+"', '"+pw+"', '"+name+"', '"+phone+"', '"+email+"', '"+message+"')");
      out.println("<script>");
      out.println("alert('회원가입되었습니다.');");
      out.println("document.location.href='Login.jsp';");
      out.println("</script>");	
    }
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();	
  }
%>
</body>
</html>