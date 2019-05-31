<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file = "/ssi/ssi_bbs.jsp" %> 

<!DOCTYPE html> 
<html> 
<head>
  <style type="text/css">
  
  	#yellow{
		color:yellow;
  	}
  
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
<br><br><br><br>

<div class="container">
<h1 class="col-sm-offset-1 col-sm-10" style="text-align: center" >삭제</h1>
<br><br>
<p id="yellow" class="col-sm-offset-1 col-sm-10" style="text-align: center">삭제하면 복구할 수 없습니다.</p>
<BR><br><br><br><br>
 <form class="form-horizontal" action="deleteProc.jsp" method="post">
  <input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
  <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
   <div class="form-group">
    <label class="control-label col-sm-4" for="passwd">비밀번호</label>
     <div class="col-sm-4">
       <input type="password" name="passwd" id="passwd" class="form-control">
     </div>
   </div>
   
   <br>
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

