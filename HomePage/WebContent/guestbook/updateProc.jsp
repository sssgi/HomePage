<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_guestbook.jsp" %>
<jsp:useBean id="dao" class="guestbook.GuestbookDAO"></jsp:useBean> 
<jsp:useBean id="dto" class="guestbook.GuestbookDTO"></jsp:useBean> 
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = dao.update(dto);
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
  <fieldset>
   <legend>방명록 확인</legend>
     <%if(flag){
    	  out.print("방명록 수정을 성공했습니다.");
       }else{
    	  out.print("방명록 수정을 실패했습니다."); 
       }	    
     %> 
  </fieldset>
  <button type="button" onclick="location.href='createForm.jsp'">수정</button>
  <button type="button" onclick="location.href='list.jsp'">목록</button>
 
</div>
</body> 
</html> 

