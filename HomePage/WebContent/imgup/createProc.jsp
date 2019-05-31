<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_img.jsp"%>
<jsp:useBean id="dao" class="imgup.ImgUpDAO"></jsp:useBean>
<jsp:useBean id="dto" class="imgup.ImgUpDTO"></jsp:useBean>
<%
	//getAttribute는 setArribute로 값을 넣어줄때 가지고 올 수 있는데 create는 처음 ㅅ
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setFname(UploadSave.encode(upload.getParameter("fname")));

	
	//form의 선택한 파일 받기
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = UploadSave.saveFile(fileItem, upDir);
	if (size > 0) {
		dto.setFname(fname);
	} else {
		dto.setFname("default.jpg");
	}
	boolean flag = dao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<title>사진등록 확인</title>
<meta charset="utf-8">

</head>
<body>

<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">사진등록 확인</h1>
		<div class="well well-lg">
			<%
				if (flag) {
					out.print("사진등록을 성공했습니다.");
				} else {
					out.print("사진등록을 실패했습니다.");
				}
			%>
		</div>
		<button class="btn" onclick="location.href='list.jsp'">목록</button>
		<button class="btn" onclick="">취소</button>
	</div>

</body>
</html>