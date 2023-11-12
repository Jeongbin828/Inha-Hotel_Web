<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Inha Hotel</title>
  <link rel="stylesheet" href="css/Header.css" />
  <link rel="stylesheet" href="css/Info.css" />
  <link rel="stylesheet" href="css/Footer.css" />
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="-1" />
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

  <h2>Inha Hotel</h2>
  <hr style="margin: auto; width: 60%; height: 5px; background-color: black">
  <img id="info_img" src="images/Info.PNG">
  <div id="content">
    <div id="box">
      <div class = "box_2">
        <h3 style="text-align: left; color: #404040;">Urban Lifestyle Hotel</h3>
        <p class="p_2">한국의 전통미와 현대적 
          감각을 겸비하고 있는 세계 속의 명문호텔 인하호텔은 세계 최고의 어번(Urban) 라이프스타일 호텔로 고객들에게 최고급
          Hospitality 서비스를 제공합니다. 한국을 대표하는 럭셔리 호텔로서 '일상이 최고의 순간이 되는 곳'이라는 컨셉을
          새롭게 선보이며 휴식은 물론 고급 식문화, 예술, 뷰티, 쇼핑, 웨딩, 엔터테인먼트 등 고객의 고품격 라이프스타일을
          제안하는 공간으로 거듭나고 있습니다.
        </p>
      </div>
      <div class = "box_2">
        <h3 style="text-align: left; color: #404040;">A Leading Grobal Property</h3>
        <p class="p_2">LHW의 멤버로 세계 럭셔리 호텔들과 어깨를 나란히 하고 있는
          인하호텔은 고객 한 분 한 분을 배려하는 기품있는 서비스로 세계 각국의 수반들과 외교, 경제, 문화 등의 분야의 명사로부터
          찬사를 받고 있으며, Conde Nast Traveler, Travel&Leisure, Zagat, Euromoney 등
          권위있는 해외 매체로부터 매년 한국 최고의 호텔로 선정되고 있습니다.</p>
      </div>
    </div>

    <!-- 지도 표시 -->
    <div id="map" style="width:50%; height:400px; margin:auto; margin-top:50px; margin-bottom:40px;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	faff3da120710e84724bde8d13efd08e"></script>
    <script>
      var mapContainer = document.getElementById('map'),  // 지도를 표시할 div 
      mapOption = { 
        center: new kakao.maps.LatLng(37.44819465088797, 126.65750409793611), // 지도의 중심좌표
        level: 3  // 지도의 확대 레벨
      };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var markerPosition = new kakao.maps.LatLng(37.44819465088797, 126.65750409793611); 
      
      // 마커 생성
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      
      // 마커가 지도 위에 표시되도록 설정
      marker.setMap(map);
    </script>
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