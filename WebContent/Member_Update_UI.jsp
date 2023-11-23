<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
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
  String id = request.getParameter("_id");
  String name = request.getParameter("_name");
  String phone = request.getParameter("_phone");
  String email = request.getParameter("_email");
%>
  <h2>회원정보 수정</h2>

  <form action="Member_Update_Query.jsp" method="post">
    <table>
      <tr>
        <td>아이디</td><td><%= id %></td>
      </tr>
      <tr>
        <td>이름</td><td><input type="text" name="_name"><%= name %></td>
      </tr>
      <tr>
        <td>전화번호</td><td><input type="text" name="_phone"><%= phone %></td>
      </tr>
      <tr>
        <td>이메일</td><td><input type="text" name="_email"><%= email %></td>
      </tr>
      <tr>
        <td></td><td><input type="submit" value="수정"></td>
      </tr>
    </table>
  </form>

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