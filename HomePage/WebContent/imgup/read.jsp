<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_img.jsp" %> 
<jsp:useBean id="dao" class="imgup.ImgUpDAO"></jsp:useBean>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	
	dao.upViewcnt(imgno);
	
	ImgUpDTO dto = dao.read(imgno);
	
	String content = dto.getContent().replace("\r\n","<br>");
	
  	List list = dao.imgRead(imgno);
    String[] files = (String[])list.get(0);
    int[] noArr = (int[])list.get(1);

	int currentLeftId = noArr[1];
	int currentRightId = noArr[3];
%>


<!DOCTYPE html> 
<html> 
<head>
  <title>사진보기</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	function readGo(imgno){
  		var url = "./read.jsp";
  		url += "?imgno="+imgno;
  		
  		location.href=url;
  	}
  	
   	function updateGo(){
		var url = "./updateForm.jsp";
		url += "?imgno=<%=dto.getImgno()%>";
		url += "&oldfile=<%=dto.getFname()%>";
		location.href=url;
	}
   	
   	function deleteGo(){
		var url = "./deleteForm.jsp";
		url += "?imgno=<%=dto.getImgno()%>";
		
		location.href=url;
	}
  
  </script>
  <style>
	.curImg{
		margin-right:0;
		border-style:solid;
		border-width: 3px;
		border-color: red;
	}
	.td_padding{
		padding:5px 5px;
	}
	.td_padding img{width:89px; height:89px;}
	.glyphicon-chevron-left{color:#FF5675 !important; float:left !important; left:0 !important; margin-left:10px !important; padding:20px !important; position:absolute !important; top:45% !important; cursor:pointer !important; transition:all 0.5s !important;}
	.glyphicon-chevron-right{color:#FF5675 !important; float:right !important; right:0 !important; margin-right:10px !important; padding:20px !important; position:absolute !important; top:45% !important; cursor:pointer !important; transition:all 0.5s !important;}
	.glyphicon-chevron-left:hover, .glyphicon-chevron-right:hover{border-radius:50px !important; opacity: 0.3 !important; background-color:#ededed !important;}
	
	th{text-align:center !important; width:30%;}
	
  </style>
</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container text-center">
<h1>사진</h1>

  <div style="display:inline-block;">
	<div style="position:relative; display:block; width:500px;">
	  <%if(currentLeftId > 0){%>
	    <span class="glyphicon glyphicon-chevron-left" onclick="readGo(<%=currentLeftId %>);"> </span>
	  <% } %>
	  <%if(currentRightId > 0){%>
	    <span class="glyphicon glyphicon-chevron-right" onclick="readGo(<%=currentRightId %>);"> </span>
	  <% } %>
				
		<img src="./storage/<%=dto.getFname() %>" width="100%" class="img-thumbnail">				
	</div>
			
  <div style="display:block; width:500px;">
	<table style="width: 100%;">
	  <tr>
		<%
		  for(int i=0;i<5;i++){
			if(files[i]==null){  
		%>
		<td class="td_padding">
   		  <img style="opacity: 0.5;" src="./storage/default.jpg" width="100%">
		<td>
		<%
		  }else{
			if(noArr[i]==imgno){
		%>
		<td class="td_padding">
		  <a href="javascript:readGo('<%=noArr[i]%>')">
			<img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
	  	  </a>
		</td>
								<%		
							}else{
								%>
								<td class="td_padding">
									<a href="javascript:readGo('<%=noArr[i]%>')">
										<img src="./storage/<%=files[i] %>" width="100%" border="0">
									</a>
								</td>
								<%
							}
						}
					}
					%>
					</tr>
				</table>
			</div>
			
			<div style="display:block; width:500px;">
				<table class="table table-bordered" style="width: 100%;">
					<tr>
						<th>성명</th>
						<td><%=dto.getName() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=dto.getTitle() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=content %></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=dto.getViewcnt() %></td>
					</tr>
				</table>
			</div>
		</div>
		
	  	<br><br>
 
	<div class="form-group">
	  <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3">   
	    <button class="btn-default btn" type="button" onclick="location.href='<%=root%>/imgup/list.jsp'">목록</button>
	    <button class="btn-default btn" type="button" onclick="updateGo()">수정</button>      
	    <button class="btn-default btn" type="button" onclick="deleteGo()">삭제</button>
	  </div>
	</div>

</div>
</body> 
</html> 

