<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <div class="grid-item">HFApi</div>
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
          <div class="divTableRow">
            <div class="divTableCell">cell1_1</div>
            <div class="divTableCell">cell2_1</div>
            <div class="divTableCell">cell3_1</div>
            <div class="divTableCell">cell4_1</div>
            <div class="divTableCell">cell5_1</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_2</div>
            <div class="divTableCell">cell2_2</div>
            <div class="divTableCell">cell3_2</div>
            <div class="divTableCell">cell4_2</div>
            <div class="divTableCell">cell5_2</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_3</div>
            <div class="divTableCell">cell2_3</div>
            <div class="divTableCell">cell3_3</div>
            <div class="divTableCell">cell4_3</div>
            <div class="divTableCell">cell5_3</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_4</div>
            <div class="divTableCell">cell2_4</div>
            <div class="divTableCell">cell3_4</div>
            <div class="divTableCell">cell4_4</div>
            <div class="divTableCell">cell5_4</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_5</div>
            <div class="divTableCell">cell2_5</div>
            <div class="divTableCell">cell3_5</div>
            <div class="divTableCell">cell4_5</div>
            <div class="divTableCell">cell5_5</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_6</div>
            <div class="divTableCell">cell2_6</div>
            <div class="divTableCell">cell3_6</div>
            <div class="divTableCell">cell4_6</div>
            <div class="divTableCell">cell5_6</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_7</div>
            <div class="divTableCell">cell2_7</div>
            <div class="divTableCell">cell3_7</div>
            <div class="divTableCell">cell4_7</div>
            <div class="divTableCell">cell5_7</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_8</div>
            <div class="divTableCell">cell2_8</div>
            <div class="divTableCell">cell3_8</div>
            <div class="divTableCell">cell4_8</div>
            <div class="divTableCell">cell5_8</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_9</div>
            <div class="divTableCell">cell2_9</div>
            <div class="divTableCell">cell3_9</div>
            <div class="divTableCell">cell4_9</div>
            <div class="divTableCell">cell5_9</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_10</div>
            <div class="divTableCell">cell2_10</div>
            <div class="divTableCell">cell3_10</div>
            <div class="divTableCell">cell4_10</div>
            <div class="divTableCell">cell5_10</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--목록 버튼 & 페이징 & 글쓰기 버튼-->
  <div class="grid-item">
    <div class="paging">
      <button type="button" class="listBtn">목록</button>
      <a href="#">&laquo;</a>
      <a href="#">1</a>
      <a class="active" href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a href="#">&raquo;</a>
      <button type="button" class="writeBtn">글쓰기</button>
    </div>
  </div>
  <!--검색-->
  <div class="grid-item">
    <div class="searchD">
      <form class="search" action="#">
        <select class="search" style="height:42px">
          <option value="title">제목</option>
          <option value="content">내용</option>
          <option value="title&content">제목+내용</option>
          <option value="writer">작성자</option>
        </select>
        <input type="text" placeholder="검색할 내용을 입력해주세요" name="search">
        <button type="submit">
          <i class="fa fa-search"></i>
        </button>
      </form>
    </div>
  </div>
</div>
</body>
</html>