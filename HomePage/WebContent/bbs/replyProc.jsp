<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property="*"/>

<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	
	dao.upAnsnum(map);
	boolean flag = dao.createreply(dto);

%>

<!DOCTYPE html> 
<html> 
<head>
 <title>게시판 답변처리</title>
 <meta charset="utf-8">
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

<div class="container" style="text-align: center; color:#ffffff;">
  
  <% 
  	if(flag){
	  	out.print("글 답변 성공입니다.");
  	}else{
  		out.print("글 답변 실패입니다.");
  	}
  
  %>
</div>

  
  <div class="form-group">
    <div class="text-center">
    <br><br>
      <button class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
      <button class="btn btn-default" onclick="location.href='./list.jsp'">목록</button>
    </div>
  </div>

</body> 
</html> 

