<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
  <link rel="stylesheet" href="css/Header.css"/>
  <link rel="stylesheet" href="css/Footer.css"/>
</head>

<body>
  <header id="main_header">
    <div id="logo">
      <a id="logo_link" href="Main.jsp"><img class="logo" src="images/Logo.png"></a>
    </div>
    <nav id="nav_main">
      <ul id="top_menu">
        <li><a href='Reserve_Check.jsp' class='button'>예약확인</a></li><li>|</li>
        <li><a href='Member.jsp' class='button'>회원정보</a></li><li>|</li>
        <li><a href='Logout.jsp' class='button'>로그아웃</a></li>
      </ul>	
      <ul id="main_menu">
        <li><a href="Main.jsp" class="button">홈</a></li>
        <li><a href="Info.jsp" class="button">호텔 소개</a></li>
        <li><a href="Reserve.jsp" class="button">객실 예약</a></li>
      </ul>
    </nav>
  </header>
<%
  String id = (String)session.getAttribute("__ID");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from member where id='"+id+"'");
		
    if(rs.next()){
      String name = rs.getString("name");
      String phone = rs.getString("phone");
      String email = rs.getString("email");
%>
  <h2>회원정보</h2>

  <table>
    <tr>
      <th>아이디</th><td><%= id %></td>
    </tr>
    <tr>
      <th>이름</th><td><%= name %></td>
    </tr>
    <tr>
      <th>전화번호</th><td><%= phone %></td>
    </tr>
    <tr>
      <th>이메일</th><td><%= email %></td>
    </tr>
  </table>
<%
      out.println("<a href='Member_Update_UI.jsp?_id="+id+"&_name="+name+"&_phone="+phone+"&_email="+email+"'>수정</a>");
      out.println("&nbsp");
      out.println("<a href='Member_Delete_Query.jsp?_id="+id+"'>탈퇴</a>");			
    }
    rs.close();
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>

  <footer id="main_footer">
    <section id="footer_top">
      <h1 id="hotel_title">인하 호텔</h1>
      <nav id="link_info">
        <dl id="contact_info">
          <dd>인하호텔 032-123-4567</dd>
        </dl>
        <dl id="introduction">
          <dd><a href="Main.jsp">인하호텔 소개</a></dd>
        </dl>
      </nav>
    </section>
    <section id="footer_bottom">
      <nav id="bottom_nav">
        <ul id="top_menu">
          <li>인하 호텔 약관</li><li>|</li>
          <li>개인정보처리방침</li><li>|</li>
          <li>이메일 무단 수집 금지</li><li>|</li>
          <li>윤리경영(부정제보)</li><li>|</li>
          <li>건축/시설물 안전관리</li>
        </ul>
      </nav>
      <p id="address">인천광역시 미추홀구 인하로 100 대표이사 홍길동 사업자 등록번호 012-34-56789 통신판매신고번호 중구 123456호</p>
      <p id="inha_email">호스팅서비스 제공자 인하(주) 객실예약 a01234567@inha.com</p>
      <p id="copyright">Copyright (C) HOTEL INHA co.LTD. All Right Reserved</p>
    </section>
  </footer>
</body>
</html>