<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_img.jsp" %> 
<jsp:useBean id="dao" class="imgup.ImgUpDAO"></jsp:useBean>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String oldfile = request.getParameter("oldfile");
	ImgUpDTO dto = dao.read(imgno);

%>


<!DOCTYPE html> 
<html> 
<head>
  <title>사진 및 내용 수정</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-1 col-sm-10" style="text-align: center" >수정</h1>
  <form class="form-horizontal" action="updateProc.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="imgno" value="<%=imgno %>">
    <input type="hidden" name="oldfile" value="<%=oldfile %>">
    <input type="hidden" name="col" value="<%=request.getParameter("col") %>">
    <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
    <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
    
    
<div class="form-group"> 
	<div class="text-center">
		<img  src ="./storage/<%=dto.getFname()%>" class="img-rounded" style="width:250px; height:250px">
	</div>
</div>
    
     <div class="form-group">
       <label class="control-label col-sm-3" for="fname">이미지</label>
         <div class="col-sm-6">
           <input type="file" name="fname" class="form-control" accept=".png,.jpg,.gif">
         </div>
     </div>
     
      <div class="form-group">
        <label class="control-label col-sm-3 " for="title">제목</label>
          <div class="col-sm-6">
            <input type="text" name="title" value="<%=dto.getTitle()%>" id="title" class="form-control">	
          </div>
      </div>
      
      <div class="form-group">
        <label class="control-label col-sm-3" for="content">내용</label>
          <div class="col-sm-6">
            <textarea class="form-control"id="content" name="content" rows="10"><%=dto.getContent() %></textarea> 
          </div>
      </div>
      
      <div class="form-group">
        <label class="control-label col-sm-3" for="content">비밀번호</label>
          <div class="col-sm-6">
            <input type="password" class="form-control" id="passwd" name="passwd" required="required" >
          </div>
      </div>


  <div class="form-group">
    <div class="col-sm-offset-1 col-sm-10" style="text-align: center" >
      <button class="btn-default btn" type="submit" >수정</button>
      <button class="btn-default btn" type="button" onclick="history.back()" >취소</button>
    </div>
  </div>

</form>

</div>
</body> 
</html> 

