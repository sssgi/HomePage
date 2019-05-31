<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
	
	boolean flag = dao.delete(id);
	if(flag && !oldfile.equals("member.jpg")) {
		UploadSave.deleteFile(upDir, oldfile);
	}

%>



<!DOCTYPE html> 
<html> 
<head>
  <title>회원탈퇴</title>
  <meta charset="utf-8">

</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" >회원탈퇴</h1>
  <div class="well well-lg">
  <% if(flag){
	  out.print("탈퇴되었습니다. 자동 로그아웃됩니다.");
  }else{
	  out.print("회원탈퇴에 실패했습니다.");
  }

  %>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button class="btn-default btn" onclick="location.href='<%=root%>/index.jsp'">탈퇴</button>
      <button class="btn-default btn" onclick="history.j">취소</button>
    </div>
  </div>

</div>

</div>
</body> 
</html> 

