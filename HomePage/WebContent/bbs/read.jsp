<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%

	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dao.upViewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);
	
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
      url +="?bbsno=<%=dto.getBbsno()%>";
      url += "&col=<%=request.getParameter("col")%>";
      url += "&word=<%=request.getParameter("word")%>";
      url += "&nowPage=<%=request.getParameter("nowPage")%>"
      
      location.href=url;   	
    }
    
    function deleteM(){
    var url = "deleteForm.jsp";
    url +="?bbsno=<%=dto.getBbsno()%>";
    url += "&col=<%=request.getParameter("col")%>";
    url += "&word=<%=request.getParameter("word")%>";
    url += "&nowPage=<%=request.getParameter("nowPage")%>"
    
    location.href=url;   	
    }

    
    function replyM(){
    var url = "replyForm.jsp";
    url +="?bbsno=<%=dto.getBbsno()%>";
    
    location.href=url;   	
  }
    
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
<br><br><br>



<div class="container">

 <H1 class="text-center">조회</H1>
 <br><br>
 <div class="form-horizontal">
  
   <div class="form-group" >
	 <div class= "col-sm-offset-2 col-sm-8 col-sm-offset-2">
	   <div class="panel panel-default" >
		 <div class="panel-heading" style="text-align: center">번호</div>
		 <div class="panel-body"><%=dto.getBbsno() %></div>
			
		 <div class="panel-heading" style="text-align: center">제목</div>
		 <div class="panel-body"><%=dto.getTitle() %></div>  
			  
		 <div class="panel-heading" style="text-align: center" >내용</div>
		 <div class="panel-body"><%=dto.getContent() %></div>
			
		 <div class="panel-heading" style="text-align: center" >작성자</div>
		 <div class="panel-body"><%=dto.getWname()%></div>
			
		 <div class="panel-heading" style="text-align: center">조회수</div>
		 <div class="panel-body"><%=dto.getViewcnt() %></div>  
			
		 <div class="panel-heading" style="text-align: center">날짜</div>
		 <div class="panel-body"><%=dto.getWdate() %></div>
	   </div>
     </div>
   </div>	  
	 <div class="form-group" style="text-align: center">
		 <button type="button" class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
		 <button type="button" class="btn btn-default" onclick="updateM();">수정</button>
		 <button type="button" class="btn btn-default" onclick="deleteM();">삭제</button>
		 <button type="button" class="btn btn-default" onclick="replyM();">답변</button>
		 <button type="button" class="btn btn-default" onclick="listM();">목록</button>
	 </div>
 </div>

</div>
</body> 
</html> 

