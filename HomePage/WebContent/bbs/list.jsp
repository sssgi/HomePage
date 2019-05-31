<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_bbs.jsp" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%
	//검색관련------------------------
	String col =Utility.checkNull(request.getParameter("col"));
	String word =Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word ="";
	
	
	//페이지관련-----------------------
	int nowPage = 1;//현재 보고있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5;//한페이지당 보여줄 레코드갯수
	 
	//DB에서 가져올 순번-----------------
	int sno = ((nowPage-1)*recordPerPage) + 1; //1페이지라면 레코드를1.2.3 을 가지고 2페이지라면 sno=4부터 eno=6   -->레코트 456을 가지고옴
	int eno = nowPage * recordPerPage;
	
	
	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	 
	int total= dao.total(col,word); //전체레코드 수를 알 수 있음.
		
	List<BbsDTO> list = dao.list(map);
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  
  <style type="text/css">
  	body{
  		background-color: #79a6d2 !important;
  	}
  
 	h1,label {
  		color: #ffffff !important;
  	}
  	table a, table a:hover, table a:link, table a:visited, table a:active{color:#fff !important;}
  </style>
 

  <script type="text/javascript">
  <!--JSP인자를 통해 Javascript의 함수 호출-->
	 function read(bbsno){	
	 	var url = "read.jsp"; //content의 내용을 보여줄 페이지의 주소
	 	url += "?bbsno="+bbsno; //bbsno는 jsp메소드에 의해 호출되어서 사용되는 javascript변수
	 	
	 	//javascript변수 :bbsno,url  <-- 선언된 변수 혹은 메소드에 의해 parameter로 사용되는 변수 
	 	//jsp변수:col,word,nowPage  <--자바스크립트 안에서 사용하려면 스크립트릿으로 감싸줘야 함.
	 	url += "&col=<%=col%>";
	 	url += "&word=<%=word%>";
	 	url += "&nowPage=<%=nowPage%>";
	 	
	 	location.href=url; //내장객체 location를 통해 href호출. -->url의 페이지를 찾아가라는 의미.
	 	
  	 } 	
  </script>
</head>
<body>


<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br><br>

<div class="container">
<h1 class="col-sm-offset-1 col-sm-10" style="text-align: center">게시판 목록</h1>
<br><br><br><br><br>

<form class="form-inline" style="float:right" action="./list.jsp">
  <div class="form-group">
    <select class="form-control " name="col">
      <option value="wname"
      <%if(col.equals("wname")) out.print("selected"); %>
      >성명</option>
      <option value="title"
      <%if(col.equals("title")) out.print("selected"); %>
      >제목</option>
      <option value="content"
      <%if(col.equals("content")) out.print("selected"); %>
      >내용</option>
      <option value="title_content"
      <%if(col.equals("title_content")) out.print("selected"); %>
      >제목+내용</option>
      <option value="total"
      <%if(col.equals("total")) out.print("selected"); %>
      >전체출력</option>   
    </select> 
  </div>
  
  <div class="form-group ">
    <input type="text" class="form-control" placeholder="Enter검색어" name="word" value="<%=word %>">
  </div>
  
  <button type="submit" class="btn btn-default">검색</button>
  <button type="button" class="btn btn-default" onclick="location.href='./createForm.jsp'">등록</button>
</form>
  <br><br><br>
  <div class="form-horizontal">
  <table class= "table table-default" style="color:#ffffff">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>grpno</th>
        <th>indent</th>
        <th>ansnum</th>
      </tr>
    </thead>
  	<tbody>
  	
  	 <% if(list.size()==0){ %>
  	  <tr><td colspan="4">등록된 게시글이 없습니다.</td>
  	 <% }else{
  		 	for(int i=0; i<list.size(); i++){
  		 
  		 	 	BbsDTO dto = list.get(i);
     %> 
      <tr>
        <td><%=dto.getBbsno()%></td>
        <td><%
           	   for(int r=0; r<dto.getIndent();r++){
        	   		out.print("&nbsp;&nbsp;");
           	   }
           	   if(dto.getIndent()>0){
        	   		out.print("<img src='../images/re.jpg'>");
           	   }
        	%>
        	<a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle() %></a>
        	<% if(Utility.compareDay(dto.getWdate())) {%>
        	  <img src = "../images/new.gif">
        	<% } %>        	
        	</td>
        <td><%=dto.getWname() %></td>
        <td><%=dto.getGrpno() %></td>
        <td><%=dto.getIndent() %></td>
        <td><%=dto.getAnsnum() %></td>
      </tr>
     <%
        	} 
  	   }
     %>  
        
  	</tbody>
  </table>
  </div>
  <br><br>
  <div>
    <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
  </div>

</div>
</body> 
</html> 

