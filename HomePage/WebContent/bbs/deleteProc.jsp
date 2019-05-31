<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property="*"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");

	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd",dto.getPasswd());
	
	boolean flag = dao.create(dto);
	boolean pflag = dao.passCheck(map);
	if(pflag){
		flag=dao.delete(bbsno);
	}
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>게시판 삭제</title> 
  <meta charset="utf-8">
  
  <script type="text/javascript">
  
    function listM(){
  		var url = "list.jsp";
  		url += "?col=<%=request.getParameter("col")%>";
  		url += "&word=<%=request.getParameter("word")%>";
  		url += "&nowPage=<%=request.getParameter("nowPage")%>";
  		
  		location.href=url; 
  	}
  </script>

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
  	if(!pflag){
	  	out.print("잘못된 비밀번호 입니다.");
  	}else if(flag){
	  	out.print("게시글이 삭제되었습니다.");
  	}else{
  		out.print("게시글 삭제를 실패했습니다.");
  	}
  
  %>
  
  </div>

  
  <div class="form-group">
    <div class="text-center">
    <br><br>
  	<% if(!pflag){ %>
  	  <button class="btn btn-default" onclick="history.back()">이전</button>
  	<%} %>
      <button class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
      <button class="btn btn-default" onclick="listM();">목록</button>
    </div>
  </div>

</body> 
</html> 

