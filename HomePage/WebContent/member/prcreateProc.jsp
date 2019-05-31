<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
		
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String id = UploadSave.encode(upload.getParameter("id"));
	String email = UploadSave.encode(upload.getParameter("email"));
	
	String str = "";
	
	if(dao.duplicateId(id)){
		str="중복된 아이디입니다. 아이디 중복 확인을 하세요";
	}else if(dao.duplicateEmail(email)){
		str="중복된 이메일입니다. 이메일 중복 확인을 하세요";
	}else{
		//createProc.jsp로 이동해서 db에 회원정보를 저장한다.
		request.setAttribute("upload",upload);	
	
%>
<jsp:forward page="/member/createProc.jsp" />
<%
	return;
}
%>	


<!DOCTYPE html> 
<html> 
<head>
  <title>ID 및 Email 중복확인</title>
  <meta charset="urf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container"> 
  <div class="well well-lg">
  <br><br>
    <%=str %>
  </div>
  
  <button class="btn-default btn" type="button" onclick="history.back()">다시시도</button>


</div>
</body> 
</html> 

