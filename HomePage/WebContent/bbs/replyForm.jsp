<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.readReply(bbsno);
	
%>

<!DOCTYPE html> 
<html> 
<head>
  <style type="text/css">
  	body{
  		background-color: #79a6d2 !important;
  	}
  
 	h1,label {
  		color: #ffffff !important;
  	}
  </style>
  
</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br>

<div class="container">
<h1 class="col-sm-offset-1 col-sm-10" style="text-align: center" >게시판 답변</h1>
<br><br><br><br><br>
  <form class="form-horizontal" action="replyProc.jsp" method="post">
	<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
	<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
	<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
  
	<div class="form-group">
	  <label class="control-label col-sm-2" for="title">제목</label>
    	<div class="col-sm-8">
      	  <input type="text" name="title" id="title" class="form-control" value="<%=dto.getTitle()%>">
  		</div>
	</div>

	<div class="form-group">
 	  <label class="control-label col-sm-2" for="content">내용</label>
  		<div class="col-sm-8">
    	  <textarea class="form-control"id="content" name="content" rows="10"></textarea> 
   		</div>
	</div>

	<div class="form-group">
 	  <label class="control-label col-sm-2" for="wname">작성자</label>
  		<div class="col-sm-4">
    	  <input type="text" name="wname" id="wname" class="form-control">
  		</div>
  		
      <label class="control-label col-sm-1" for="passwd">비밀번호</label>
  		<div class="col-sm-3">
    	  <input type="password" name="passwd" id="passwd" class="form-control">
  		</div>
	</div>
	<BR><BR>

    <div class="form-group">
      <div class="text-center">
        <button type="submit" class="btn btn-default">등록</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>

</form>

</div>
</body> 
</html> 

