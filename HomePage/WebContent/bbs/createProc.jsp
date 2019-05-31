<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property="*"/>

<%
	boolean flag = dao.create(dto);
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
<br><br><br><br>

<div class="container" style="text-align: center; color: #ffffff;">
  
  <% 
  	if(flag){
	  	out.print("게시판글 등록 성공입니다.");
  	}else{
	  	out.print("게시판글 등록 실패입니다.");
  	}
  %>
  
  </div>
  
  <div class="form-group">
    <div class="text-center">
    <br><br>
      <button type="button" class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
      <button type="button" class="btn btn-default" onclick="location.href='./list.jsp'">목록</button>
      <button type="reset" class="btn btn-default" >취소</button>
    </div>
  </div>

</body> 
</html> 

