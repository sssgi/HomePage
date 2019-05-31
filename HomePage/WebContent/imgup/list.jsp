<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_img.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"></jsp:useBean> 
<%
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word ="";
	
	//페이징
	int nowPage = 1;
	int recordPerPage =4;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;

	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	int total = dao.total(map);
	

	List<ImgUpDTO> list = dao.list(map);
	
	String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

%>

<!DOCTYPE html> 
<html> 
<head>
  <title>이미지 목록</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	
  	function read(imgno){
  		var url = "read.jsp";
  		url += "?imgno="+imgno;
  		location.href=url; 		
  	}
  	
  	function filedown(fname){
		var url = "<%=root%>/download";
		url += "?dir=/imgup/storage";
		url += "&filename="+fname;
		location.href=url;
	}

  </script>
  <style>

	th{text-align: center !important;}
	td{
		vertical-align: middle !important;
		text-align: center;
	}
	
  </style>
</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-1 col-sm-10" style="text-align: center">이미지 목록</h1>
          
  <br>
        
  <table class="table table-bordered">	 
     
    <tr>
    <th>이미지</th>
      <th>순차</th>	
      <th>제목</th>
      <th>작성자</th>
      <th>조회수</th>
      <th>등록일</th>
      <th>다운로드</th>
    </tr>
  <%
	for(int i=0; i<list.size();i++){
		ImgUpDTO dto = list.get(i);
  %>
     <tr>   
	<td><img src="./storage/<%=dto.getFname()%>" class="img-rounded" style="width:80px; height:80px;" /></td>
      <td><%=dto.getImgno() %></td>
      <td><a href="javascript:read('<%=dto.getImgno()%>')"><%=dto.getTitle() %></a></td>
      <td><%=dto.getName() %></td>
      <td><%=dto.getViewcnt() %></td>
      <td><%=dto.getRegdate()%></td>
      <td><a href="javascript:filedown('<%=dto.getFname()%>')"><span class="glyphicon glyphicon-download-alt"></span></a></td>
    </tr>
  <% } %> 

  </table>
 
 
 <form style="text-align: center" class="form-inline" action="./list.jsp" method="post">
    <div class= "form-group">
      <select class="form-control" name = "col">
        <option value="name"
        <%if(col.equals("name")) out.print("selected");%>
        >작성자</option>
        <option value="title"
        <%if(col.equals("title")) out.print("selected");%>
        >제목</option>
        <option value="content"
        <%if(col.equals("content")) out.print("selected");%>
        >내용</option>
        <option value="title_content"
        <%if(col.equals("title_content")) out.print("selected");%>
        >제목+내용</option>
        <option value="total"
        <%if(col.equals("total")) out.print("selected");%>
        >전체</option>
      </select>  
    </div>
    
    <div class="form-group">
      <input type="text" class="form-control" name="word" value="<%=word %>">
    </div>
    <button class= 'btn btn-default'>검색</button>
    <button class="btn-default btn" type="button" onclick="location.href='<%=root%>/imgup/createForm.jsp'">등록</button>
  </form>
 
 
 <%=paging %> 
 
 

</div>
</body> 
</html> 

