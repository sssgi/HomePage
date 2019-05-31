<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO" />

<%
   int no = Integer.parseInt(request.getParameter("no"));
   boolean flag = dao.delete(no);
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 정보 삭제</title>
<meta charset="utf-8">

</head>
<body>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<br><br>


  <div class="container">
   <fieldset>
    <legend>방명록 정보 삭제 확인</legend>
	  <%
	   	 if(flag)
		     out.print("방명록 정보를 삭제 했습니다. ");
	   	 else
		     out.print("방명록 삭제에 실패했습니다. ");
	   %>
   </fieldset>
   <button type="button" onclick="location.href='list.jsp'">목록</button>
	<button type="button" onclick="location.href='createForm.jsp'">다시등록</button>
  </div>
</body>
</html>
