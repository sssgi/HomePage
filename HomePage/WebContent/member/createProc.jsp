<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_member.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="member.MemberDTO"></jsp:useBean>

<%
	UploadSave upload = (UploadSave)request.getAttribute("upload"); //request를 통해 저장한 객체를 받아옴.
	dto.setId(upload.getParameter("id"));
	dto.setEmail(upload.getParameter("email"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setJob(UploadSave.encode(upload.getParameter("job")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	
	String fname = UploadSave.saveFile(fileItem, upDir);	
	
	if(size>0){
		dto.setFname(fname);
	}else{
		dto.setFname("member.jpg"); //default이미지를 사용.
	}
	
	boolean flag = dao.create(dto);

%>

<!DOCTYPE html> 
<html>
<head>
  <title>회원가입처리</title>
  <meta charset="urf-8">

</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>


<div class="container">
  <div class="well well-lg">
    <%
    	if(flag){
    		out.print("회원 가입에 성공했습다");
    	}else{
    		out.print("회원가입을 실패했습니다.");
    	}
    %>
    
	<%if(flag){ %> 

  <DIV class='bottom'>
    <input type='button' value='로그인' onclick="location.href='loginForm.jsp'">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
	<%}else{ %>
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
	<%} %>
  
  

</div>
</body> 
</html> 

