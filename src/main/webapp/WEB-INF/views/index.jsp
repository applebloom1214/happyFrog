<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- w3스쿨 이미지 링크 -->
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="/happyfrog/resources/css/index.css" rel="stylesheet">
  <title>Document</title>

</head>
<body>
<div class="grid-container">
  <!-- header -->
  <jsp:include page="header.jsp"/>
  <!-- API -->
  <div class="grid-item fs">
    <br> <h4><b>현 시각 서울시 미세먼지 현황</b></h4>
        &nbsp;${finedust.value}
        &nbsp;${finedust.status}
            <c:if test="${finedust.status=='좋음'}">
              <img src="/happyfrog/resources/images/1.png">
            </c:if>
            <c:if test="${finedust.status=='보통'}">
              <img src="/happyfrog/resources/images/2.png">
            </c:if>
            <c:if test="${finedust.status=='나쁨'}">
              <img src="/happyfrog/resources/images/3.png">
            </c:if>
  </div>
  <!--게시판, 정렬 버튼-->
  <div class="grid-item">
    <div class="table">
      <div class="sort">
        <button class="reply">댓글순</button>
        <button class="grade">평점순</button>
        <button class="random">랜덤</button>
      </div>
      <div class="divTable blueTable">
        <div class="divTableHeading">
          <div class="divTableRow">
            <div class="divTableHead bno">번호</div>
            <div class="divTableHead title">제목</div>
            <div class="divTableHead day">작성일</div>
            <div class="divTableHead rcnt">조회수</div>
            <div class="divTableHead grade">평점</div>
          </div>
        </div>
        <div class="divTableBody">
          <c:forEach var="board" items="${board}">
            <div class="divTableRow">
              <div class="divTableCell">${board.bno}</div>
              <div class="divTableCell"><a href="<c:url value="/read?bno=${board.bno}"/>">${board.title}</a></div>
              <div class="divTableCell"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" type="date"/></div>
              <div class="divTableCell">${board.hits}</div>
              <div class="divTableCell">${board.rating}</div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
  <!--목록 버튼 & 페이징 & 글쓰기 버튼-->
  <div class="grid-item">
    <div class="paging">
      <button type="button" class="listBtn" onclick="location.href='<c:url value='/'/>';">목록</button>
      <c:if test="${pageDTO.showPrev}"><a href="<c:url value="/${pageDTO.searchDTO.getQueryString(pageDTO.beginPage-1)}"/>">&laquo;</a></c:if>
      <c:forEach var="i" begin="${pageDTO.beginPage}" end="${pageDTO.endPage}">
        <a class="${i == pageDTO.searchDTO.page ?"active":""}" href="<c:url value="/${pageDTO.searchDTO.getQueryString(i)}"/>">${i}</a>
      </c:forEach>
      <c:if test="${pageDTO.showNext}"><a href="<c:url value="/${pageDTO.searchDTO.getQueryString(pageDTO.endPage+1)}"/>">&raquo;</a></c:if>
      <button type="button" class="writeBtn" onclick="location.href='<c:url value='/write'/>'">글쓰기</button>
    </div>
  </div>
  <!--검색-->
  <div class="grid-item">
    <div class="searchD">
      <form class="search" action="<c:url value="/"/>" method="get">
        <select class="search" style="height:42px" name="option">
          <option value="T">제목</option>
          <option value="W">작성자</option>
        </select>
        <input type="text" placeholder="검색할 내용을 입력해주세요" name="keyword">
        <button type="submit">
          <i class="fa fa-search"></i>
        </button>
      </form>
    </div>
  </div>
</div>
</body>
</html>