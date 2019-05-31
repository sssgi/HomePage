<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />
<jsp:useBean id="dto" class="guestbook.GuestbookDTO" />
<jsp:setProperty name="dto" property="*" />
<!DOCTYPE html>
<%
	boolean flag = dao.create(dto);
%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>

<div class="container">
  <div class="well well-lg">
	  <%
		if (flag)
			out.print("방명록을 생성했습니다. ");
		else
			out.print("방명록 생성을 실패했습니다. ");
	  %>
  </div>
  <button class="btn" onclick="location.href='createForm.jsp'">다시등록</button>
  <button class="btn" onclick="location.href='list.jsp'">목록</button>
</div>
</body>
</html>