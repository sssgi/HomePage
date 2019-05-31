<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<style type="text/css">
#need {
	color: blue;
}
</style>
<script type="text/javascript">
	function incheck(frm) {
		if (frm.title.value == '') {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;
		}
		
		if (frm.name.value == '') {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}
	
		if (frm.gender[0].checked == false && frm.gender[1].checked == false) {
			alert("성별을 체크해주세요.");
			frm.gender[0].checked;
			return false;
		}
		
		if (frm.content.value == '') {
			alert("내용을 입력하세요.");
			frm.content.focus();
			return false;
		}
	
		var check = 0;
		
		for (var i = 0; i < frm.part.length; i++) {
			if (frm.part[i].checked) {
				check++;
			}
		}

		if (check == 0) {
			alert("관계를 한개이상 체크해주세요.");
			frm.part[0].focus();
			return false;
		}
	}
</script>
</head>
<body>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

  <div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">방명록 등록</h1>
	  <form method="post" action="createProc.jsp" name="frm" class="form-horizontal" onsubmit="return incheck(this)">
		
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
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="초등학교친구">초등학교 친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="중학교친구">중학교 친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="고등학교친구">고등학교 친구</label>
		<label class="checkbox-inline"> <input type="checkbox" name="part" value="대학교친구">대학교 친구</label>
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