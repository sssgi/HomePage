<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi_img.jsp" %>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"></jsp:useBean> 
<jsp:useBean id="dto" class="imgup.ImgUpDTO"></jsp:useBean> 
<%

	
	//getAttribute는 setArribute로 값을 넣어줄때 가지고 올 수 있는데 create는 처음 ㅅ
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	int imgno = Integer.parseInt(upload.getParameter("imgno"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	String passwd = UploadSave.encode(upload.getParameter("passwd"));

	Map map = new HashMap();
	map.put("imgno", imgno);
	map.put("passwd",passwd);
	
	dto.setImgno(imgno);
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(passwd);
	dto.setFname(UploadSave.encode(upload.getParameter("fname")));


	boolean flag = false;
	boolean pflag = dao.passwdCheck(map);
	
	if(pflag==true){
		//form의 선택한 파일 받기
		FileItem fileItem = upload.getFileItem("fname");
		int size = (int) fileItem.getSize();
		String fname = "";
		if (size > 0) {
			UploadSave.deleteFile(upDir,oldfile);
			fname = UploadSave.saveFile(fileItem, upDir);
		} else {
			fname = oldfile;
		}
		dto.setFname(fname);
		
		flag = dao.update(dto);
	}
	

%>
<!DOCTYPE html> 
<html> 
<head>
  <title>이미지수정</title>
  <meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" >이미지수정 확인</h1>
  <div class="well well-lg">
  <%
	if(flag){
		out.print("이미지 변경에 성공했습니다.");
	}else{
		out.print("이미지 변경에 실패했습니다.");
	}

  %>
  
  </div>
  <button class="btn-default btn" onclick="location.href='read.jsp?imgno=<%=dto.getImgno()%>'">확인</button>
  <button class="btn-default btn" onclick="history.back()">다시시도</button>
  

</div>
</body> 
</html>  

