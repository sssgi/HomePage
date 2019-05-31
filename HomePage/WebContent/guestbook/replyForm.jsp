<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />
<%
   int no = Integer.parseInt(request.getParameter("no"));
   GuestbookDTO dto = dao.readReply(no);
   
%>
 
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">  
</head>

<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">답변 등록</h1>	
 <form class="form-horizontal" action="replyProc.jsp" method="post">
   <input type="hidden" name="no" value="<%=dto.getNo()%>">
   <input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
   <input type="hidden" name="indent" value="<%=dto.getIndent() %>">
   <input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
	  
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목<span id="need">*</span></label>
	  <div class="col-sm-6">
	    <input type="text" name="title" id="title" class="form-control">
	  </div>
  </div>
			
  <div class="form-group">
	<label class="control-label col-sm-2" for="name">이름<span id="need">*</span></label>
	  <div class="col-sm-6">
	    <input type="text" name="name" id="name" class="form-control">
	  </div>
  </div>
			
  <div class="form-group">
	<label class="control-label col-sm-2" for="gender">성별<span id="need">*</span></label>
	  <div class="col-sm-10">
	   <label class="radio-inline"> <input type="radio" value="남자" name="gender" id="gender">남자</label>
	   <label class="radio-inline"> <input type="radio" value="여자" name="gender" id="gender">여자</label>
	  </div>
  </div>
			
  <div class="form-group">
	<label class="control-label col-sm-2" for="content">내용<span id="need">*</span></label>
	  <div class="col-sm-6">
		<textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
	  </div>
  </div>
			
  <div class="form-group">
    <label class="control-label col-sm-2" for="part">관계<span id="need">*</span></label>
	  <div class="col-sm-10">
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="초등학교친구">초등학교친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="중학교친구">중학교친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="고등학교친구">고등학교친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="대학교친구">대학교친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="제3자">제3자</label>
	  </div>
  </div>

  <div class="form-group">
	<label class="control-label col-sm-2" for="passwd">비밀번호<span id="need">*</span></label>
	  <div class="col-sm-2">
		<input type="password" name="passwd" id="passwd" class="form-control">  
	  </div>
  </div>
			
  <div class="form-group">
	<div class="col-sm-offset-2 col-sm-5">
	  <button class="btn">등록</button>
	  <button type="reset" class="btn">취소</button>
	</div>
  </div>
		
  <div class="col-sm-offset-2 col-sm-5">
	<span id="need">*</span>는 필수 입력사항입니다.
  </div>
	
 </form>
</div>
  
</body>
</html>