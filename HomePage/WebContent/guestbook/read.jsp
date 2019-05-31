<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />
<%
   int no = Integer.parseInt(request.getParameter("no"));
   GuestbookDTO dto = dao.read(no);
   
   String content = dto.getContent().replaceAll("\r\n","<br>");
   
%>
 
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <script type="text/javascript">
    function updateM(){
      var url = "updateForm.jsp";
      url +="?no=<%=dto.getNo()%>";
      url += "&col=<%=request.getParameter("col")%>";
      url += "&word=<%=request.getParameter("word")%>";
      url += "&nowPage=<%=request.getParameter("nowPage")%>";
      
      location.href=url;   	
    }
    
    function deleteM(){
      var url = "deleteForm.jsp";
      url += "?no=<%=dto.getNo()%>";    
      url += "&col=<%=request.getParameter("col")%>";
      url += "&word=<%=request.getParameter("word")%>";
      url += "&nowPage=<%=request.getParameter("nowPage")%>";

      location.href=url;   	
    }

    
    function replyM(){
    var url = "replyForm.jsp";
    url +="?no=<%=dto.getNo()%>";
    
    location.href=url;   	
  	}
    
    
  	function listM(){
	  var url = "list.jsp";
		
	  url += "?col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
	  location.href = url;	
		
	}
  
  </script>

</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

 
<div class="container">
<h2>목록</h2>
  <div class="panel panel-default">
    <div class="panel-heading">번호</div>
    <div class="panel-body"><%=dto.getNo()%></div>
    <div class="panel-heading">이름</div>
    <div class="panel-body"><%=dto.getName()%></div>
    <div class="panel-heading">성별</div>
	<div class="panel-body"><%=dto.getGender()%></div>
	<div class="panel-heading">제목</div>
	<div class="panel-body"><%=dto.getTitle()%></div>
	<div class="panel-heading">내용</div>
	<div class="panel-body"><%=dto.getContent()%></div>
	<div class="panel-heading">날짜</div>
	<div class="panel-body"><%=dto.getRegdate()%></div>
	<div class="panel-heading">관계</div>
	<div class="panel-body"><%=dto.getPartstr()%></div>
  </div>
  <button class="btn" type="button" onclick="location.href='createForm.jsp'">등록</button>
  <button class="btn" type="button" onclick="updateM()">수정</button>
  <button class="btn" type="button" onclick="deleteM()">삭제</button>
  <button class="btn" type="button" onclick="replyM()">답변</button>
  <button class="btn" type="button" onclick="listM()">목록</button>

</div>
</body>
</html>