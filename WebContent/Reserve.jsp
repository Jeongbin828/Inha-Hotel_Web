<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
  <link rel="stylesheet" href="css/Header.css"/>
  <link rel="stylesheet" href="css/Reserve.css"/>
  <link rel="stylesheet" href="css/Footer.css"/>
</head>

<body>
  <header id="main_header">
    <div id="logo">
      <a id="logo_link" href="Main.jsp">
        <img class="logo" src="images/Logo.png">
      </a>
    </div>
    <nav id="nav_main">
<%
    if((String)session.getAttribute("__ID") == null){
      out.println("<ul id='top_menu'>");
      out.println("<li><a href='Login.jsp' class='button'>로그인</a></li><li>|</li>");
      out.println("<li><a href='Register.jsp' class='button'>회원가입</a></li>");
      out.println("</ul>");
    }else{
      out.println("<ul id='top_menu'>");
      out.println("<li><a href='Reserve_Check.jsp' class='button'>예약확인</a></li><li>|</li>");
      out.println("<li><a href='Member.jsp' class='button'>회원정보</a></li><li>|</li>");
      out.println("<li><a href='Logout.jsp' class='button'>로그아웃</a></li>");
      out.println("</ul>");
    }
%>
    <ul id="main_menu">
      <li><a href="Main.jsp" class="button">홈</a></li>
      <li><a href="Info.jsp" class="button">호텔 소개</a></li>
      <li><a href="Reserve.jsp" class="button">객실 예약</a></li>
    </ul>
    </nav>
  </header>
<%
  if((String)session.getAttribute("__ID") == null){
    out.println("<script>");
    out.println("alert('로그인이 필요합니다.');");
    out.println("document.location.href='Login.jsp';");
    out.println("</script>");
  }else{
%>
  <h2 style="margin-top:50px; margin-bottom: 30px;">객실 선택</h2>
  <hr style="margin: auto; width: 70%; height: 3px; background-color: black">
  <div id="content">
    <section id="reservation_section" style="margin-bottom: 50px;">	
<%
    try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("select * from room");

      while(rs.next()){
        int rmId = rs.getInt("rmId");
        String rmName = rs.getString("rmName");
        int rmSize = rs.getInt("rmSize");
        int maxP = rs.getInt("maxP");
        int price = rs.getInt("price");

        out.println("<form action='Reserve_Insert_UI.jsp' id='reservation' method='post'>");
        out.println("<table id='table2'>");
        out.println("<tr><td><input type='hidden' name='_rmId' value='"+rmId+"'></td></tr>");
        out.println("<tr>");
        out.println("<td rowspan='4'><img id='img' src='images/"+rmName+".PNG'>");
        out.println("<td id='room'>"+rmName+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td id='intro'>객실 크기 : "+rmSize+"㎡</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td id='intro'>최대 인원 : "+maxP+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td id='price'>1박 "+price+"~<input id='res' type='submit' name='_reserve' value='예약하기'></td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");
        out.println("<hr style='margin: auto; width: 70%; height: 2px; background-color: #D3D3D3;'>");
      }
      stmt.close();
      conn.close();
    }catch(Exception e){
      e.printStackTrace();
    }
  }
%>
    </section>
  </div>

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